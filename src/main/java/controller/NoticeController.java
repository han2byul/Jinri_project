package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.NoticeDAO;
import util.Paging;
import util.Util;
import vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;

	NoticeDAO notice_dao;

	public void setNotice_dao(NoticeDAO notice_dao) {
		this.notice_dao = notice_dao;
	}

	// 게시글 전체 조회
	@RequestMapping("/notice_list.do")
	public String list(Model model, String page, String search, String select, HttpServletRequest request) {
		int nowPage = 1; // 처음 실행 시에는 1페이지로 간주

		if (page != null) {
			nowPage = Integer.parseInt(page);
		}

		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산 (BLOCKLIST와 BLOCKPAGE 값이 변경되어도 자동으로 처리되도록 공식으로
		// 처리)
		int start = (nowPage - 1) * Util.Notice.BLOCKLIST + 1;
		int end = start + Util.Notice.BLOCKLIST - 1;

		// map에 시작과 끝 번호를 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// map에 search 값 넣기
		if (search == null) {
			search = "all";
		}
		map.put("search", search);

		// map에 조회할 컬럼 넣기
		if (select == null) {
			map.put("title", "title");
			map.put("content", "content");
		} else {
			if (select.equals("title")) {
				map.put("title", "title");
			} else if (select.equals("content")) {
				map.put("content", "content");
			} else if (select.equals("all")) {
				map.put("all", "all");
			}
		}

		// 방명록 조회를 위한 dao의 메서드 호출
		List<NoticeVO> list = notice_dao.selectList(map);
		model.addAttribute("list", list);
		model.addAttribute("page", page);

		// 전체 게시물 수 조회
		int row_total = notice_dao.getRowTotal(map);
		model.addAttribute("row_total", row_total);

		// 하단의 표기될 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("notice_list.do", nowPage, row_total, Util.Notice.BLOCKLIST,
				Util.Notice.BLOCKPAGE, search, select);
		model.addAttribute("pageMenu", pageMenu);

		// show라는 이름으로 저장된 값을 제거
		request.getSession().removeAttribute("show");

		return "/WEB-INF/views/notice/notice_list.jsp";
	}

	// 삭제 메서드
	@RequestMapping("/notice_delete.do")
	@ResponseBody
	public String delete(int idx, String filename) {

		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);

		int res = notice_dao.delete(idx); // 게시물을 지우고 잘 지워졌는지 0 or 1 로 알려줘라

		String result = "no";
		if (res == 1) { // 삭제가 잘 되었다면
			result = "yes";
			File f = new File(savePath, filename);

			if (f.exists()) {
				f.delete(); // file 클래스 경로의 파일을 제거
			}
		}
		return result;
	}

	@RequestMapping("/notice_insert_form.do")
	public String insert_form() {
		return "/WEB-INF/views/notice/notice_insert_form.jsp";
	}

	// 새 글 등록하기
	@RequestMapping("/notice_insert.do")
	public String insert(NoticeVO vo) { // 여러 개의 파라미터를 vo 하나로 받을 수 있다. (vo 안에 있는 변수를 모두 받음)

		// 사진을 업로드할 절대경로를 지정
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath); // 사용자도 접속할 수 있도록 절대경로 생성

		// 업로드할 파일의 정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드 된 파일의 파일명
			filename = photo.getOriginalFilename();

			// 파일을 저장할 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 같은 이름의 파일 덮어쓰기 방지
				long time = System.currentTimeMillis(); // 중복될 수 없도록 currentTimeMillis 사용
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			// 업로드 된 파일은 임시저장소에서 일정시간이 지나면 사라지는데,
			// 현재 내가 지정한 upload 폴더까지 경로로 사라지지 않도록
			// 파일을 복사하는 메서드
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		vo.setFilename(filename);

		int res = notice_dao.insert(vo); // vo를 파라미터로 해서 insert 메서드로 보냄

		// JSP 에서는 sendRedirect("list.do"); 로 표기
		return "redirect:notice_list.do"; // list.do 매핑을 호출하는 방법
	}

	// 게시글 상세보기
	@RequestMapping("/notice_view.do")
	public String view(Model model, int idx) {

		// 상세보기를 위한 게시물 한 건 조회
		NoticeVO vo = notice_dao.selectOne(idx);
		model.addAttribute("vo", vo);

		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			// 조회수 증가를 위한 업데이트 메서드
			notice_dao.update_readhit(idx);
			session.setAttribute("show", "");
		}

		return "/WEB-INF/views/notice/notice_view.jsp";

	}

	// 글 수정 폼으로 이동
	@RequestMapping("/notice_modify_form.do")
	public String modify_form(Model model, int idx) {
		NoticeVO vo = notice_dao.selectOne(idx);

		if (vo != null) {
			model.addAttribute("vo", vo);
		}

		return "/WEB-INF/views/notice/notice_modify_form.jsp";
	}

	// 게시글 수정
	@RequestMapping("/notice_modify.do")
	public String modify(NoticeVO vo, String page) {
		// 사진을 업로드할 절대경로를 지정
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath); // 사용자도 접속할 수 있도록 절대경로 생성
		System.out.println("절대경로 : " + savePath);

		// 업로드할 파일의 정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드 된 파일의 파일명
			filename = photo.getOriginalFilename();

			// 파일을 저장할 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 같은 이름의 파일 덮어쓰기 방지
				long time = System.currentTimeMillis(); // 중복될 수 없도록 currentTimeMillis 사용
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			// 업로드 된 파일은 임시저장소에서 일정시간이 지나면 사라지는데,
			// 현재 내가 지정한 upload 폴더까지 경로로 사라지지 않도록
			// 파일을 복사하는 메서드
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		vo.setFilename(filename);

		int res = notice_dao.update(vo);

		return "redirect:notice_view.do?idx=" + vo.getIdx() + "&page=" + page;
	}
}
