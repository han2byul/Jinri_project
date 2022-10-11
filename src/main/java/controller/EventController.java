package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.EventDAO;
import util.Paging2;
import util.Util;
import vo.EventVO;

@Controller
public class EventController {

	// Autowired를 통해 new를 통한 객체생성 없이 서블릿에서 제공해주는 클래스는
	// 자동으로 메모리할당 받을 수 있다.
	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	EventDAO event_dao;

	public void setEvent_dao(EventDAO event_dao) {
		this.event_dao = event_dao;
	}

	@RequestMapping("/eventlist.do")
	public String list(Model model, String page, String search, String search_res) {
		// 페이징

		if (search_res == null) {
			search = "all";
			search_res = "all";
		}

		int nowPage = 1;

		if (page != null) {
			nowPage = Integer.parseInt(page);
		}

		int start = (nowPage - 1) * Util.Event.BLOCKLIST + 1;
		int end = start + Util.Event.BLOCKLIST - 1;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		map.put("search_res", search_res);

		// 검색
		List<EventVO> list = null;
		int row_total = 0;

		if (search.equals("all")) {
			list = event_dao.selectList(map);
			model.addAttribute("list", list);
			row_total = event_dao.getRowTotal(map);
		} else if (search.equals("title")) {
			list = event_dao.selectTitle(map);
			model.addAttribute("list", list);
			row_total = event_dao.getRowTotal_Title(map);
		} else if (search.equals("content")) {

			list = event_dao.selectContent(map);
			model.addAttribute("list", list);
			row_total = event_dao.getRowTotal_Content(map);

		} /*
			 * else { list = event_dao.selectList(map); model.addAttribute("list", list);
			 * row_total = event_dao.getRowTotal(map);
			 * 
			 * }
			 */

		// 하단에 표기될 페이지 메뉴 생성
		String pageMenu = Paging2.getPaging("eventlist.do", nowPage, row_total, Util.Event.BLOCKLIST,
				Util.Event.BLOCKPAGE, search, search_res);

		model.addAttribute("pageMenu", pageMenu);

		// sendRedirect(/aaa.do);
		// return "redirect:list.do";
		return "/WEB-INF/views/event/event_list.jsp?search_res=" + search_res;
	}

	// 삭제메서드
	@RequestMapping("/eventdelete.do")
	@ResponseBody // return값을 jsp등으로 인식하지 않고, 콜백메서드로 전달하기 위한 키워드
	public String delete(int idx, String filename) {

		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);

		int res = event_dao.delete(idx);

		String result = "no";
		if (res == 1) {
			result = "yes";
			File f = new File(savePath, filename);

			if (f.exists()) {
				f.delete();// file클래스 경로의 파일을 제거
			}
		}

		// @ResponseBody가 적용되어 있으므로
		// result에 no 또는 yes데이터는 콜백메서드로 돌아간다
		return result;
	}

	@RequestMapping("/event_insert_form.do")
	public String insert_form() {
		return "/WEB-INF/views/event/event_insert_form.jsp";
	}

	// 새글등록하기
	@RequestMapping("/eventinsert.do")
	public String insert(EventVO vo) {

		// 사진을 업로드할 절대경로를 지정
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대경로 : " + savePath);

		// 업로드할 파일의 정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드될 파일의 파일명
			filename = photo.getOriginalFilename();

			// 파일을 저장할 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			// 업로드된 파일은 임시저장소에서 일정시간이 지나면 사라지는데,
			// 현재 내가 지정한 upload폴더까지 경로로 사라지지 않도록 파일을 복사하는 메서드
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

		// vo에 파일명을 저장해서 DB로 전달
		vo.setFilename(filename);

		int res = event_dao.insert(vo);

		// sendRedirect("list.do");
		return "redirect:eventlist.do";// list.do매핑을 호출하는 방법

	}

	// 글 수정 폼으로 이동
	@RequestMapping("/event_modify_form.do")
	public String modify_form(Model model, Integer idx, Integer page) {

		EventVO vo = event_dao.selectOne(idx);

		if (vo != null) {
			model.addAttribute("vo", vo);
		}

		return "/WEB-INF/views/event/event_modify_form.jsp?page=" + page;

	}

	// 게시글 수정
	@RequestMapping("/eventmodify.do")
	public String modify(EventVO vo, int idx, int page) {

		int res = event_dao.update(vo);
		return "redirect:eventlist.do?page=" + page;
	}

	// 게시글 상세보기
	@RequestMapping("eventview.do")
	public String view(EventVO vo, Model model, Integer idx, int page) {

		vo = event_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);

		return "/WEB-INF/views/event/event_view.jsp?page=" + page;
	}

}
