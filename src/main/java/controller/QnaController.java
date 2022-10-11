package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.QnaDAO;
import util.Paging;
import util.Util;
import vo.QnaVO;

@Controller
public class QnaController {
	@Autowired
	HttpServletRequest request;
	QnaDAO qna_dao;

	public void setQna_dao(QnaDAO qna_dao) {
		this.qna_dao = qna_dao;
	}

	// 전체 게시물 조회
	@RequestMapping("/qna_list.do")
	public String selectList(Model model, String page, String search, String search_res) {

		if (search_res == null) {
			search = "all";
			search_res = "all";
		}

		int nowPage = 1;

		if (page != null) {
			nowPage = Integer.parseInt(page);
		}

		// 한페이지에 표시될 게시물의 시작과 끝번호를 계산
		// ?page =1
		int start = (nowPage - 1) * Util.Qna.BLOCKLIST + 1;
		int end = start + Util.Qna.BLOCKLIST - 1;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		map.put("search_res", search_res);
		System.out.println("search: " + search);
		System.out.println("search_res: " + search_res);

		List<QnaVO> list = null;
		int row_total = 0;

		// map.put("search", search);

		// xxx.do? ------- null
		// xxx.do?search= ---- isEmpty()

		if (search.equals("all")) {

			list = qna_dao.selectList(map);
			model.addAttribute("list", list);
			row_total = qna_dao.getRowTotal(map);
		} else if (search.equals("id")) {
			System.out.println("map : " + map.get("search_res"));
			list = qna_dao.selectID(map);
			model.addAttribute("list", list);
			row_total = qna_dao.getRowTotal(map);

		} else if (search.equals("title")) {

			list = qna_dao.selectTitle(map);
			model.addAttribute("list", list);
			row_total = qna_dao.getRowTotal(map);
		}

		// 하단에 표기될 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("qna_list.do",

				nowPage, row_total, Util.Qna.BLOCKLIST, Util.Qna.BLOCKPAGE, search, search_res);

		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("list", list);

		request.getSession().removeAttribute("show");

		return Util.Qna.VIEW_PATH + "qna_list.jsp?search_res=" + search_res;

	}

	// 새글 작성을 위한 페이지로 전환
	@RequestMapping("/qna_insert_form.do")
	public String insert_form() {
		return Util.Qna.VIEW_PATH + "qna_write.jsp";
	}

	// 새글쓰기
	@RequestMapping("/qna_insert.do")
	public String insert(QnaVO vo) {

		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		int res = qna_dao.insert(vo);
		return "redirect:qna_list.do";
	}

	// 게시글 상세보기

	@RequestMapping("/qna_view.do")
	public String view(Model model, int idx, int page) {
		QnaVO vo = qna_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);

		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			// 조회수 증가를 위한 업데이트 메서드
			qna_dao.update_readhit(idx);
			session.setAttribute("show", "");
		}
		return Util.Qna.VIEW_PATH + "qna_view.jsp";
	}

	@RequestMapping("/qna_del.do")
	@ResponseBody // return 값을 jsp 등으로 인식하지 않고, 콜백 메서드로 전달하기 위한 어노테이션
	public String delete(int idx, String page) {
		QnaVO vo = qna_dao.selectOne(idx);
		vo.setTitle("삭제된 게시글입니다.");
		vo.setId("unknown");
		int res = qna_dao.delete(vo);

		String result = String.format("[{'res':'no'}, {'page':'%s'}]", page);
		if (res == 1) {
			result = String.format("[{'res':'yes'}, {'page':'%s'}]", page);
		}

		// @ResponseBody가 적용되어 있으므로
		// result에 no 또는 yes데이터는 콜백메서드로 돌아간다.
		return result;

	}

	@RequestMapping("/qna_modify_form.do")
	public String modify_form(Model model, int idx) {

		QnaVO vo = qna_dao.selectOne(idx);
		if (vo != null) {
			model.addAttribute("vo", vo);
		}
		return "/WEB-INF/views/qna/qna_modify_form.jsp";

	}

	// 게시글 수정
	@RequestMapping("/qna_modify.do")
	public String modify(QnaVO vo, int idx, int page) {
		int res = qna_dao.update(vo);
		return "redirect:qna_view.do?idx=" + idx + "&page=" + page;

	}

	// 댓글 작성을 위한 페이지로 전환
	@RequestMapping("/qna_reply_form.do")
	public String replyForm(Model model, int idx, int ref, int page) {
		System.out.println("등록확인");
		model.addAttribute("idx", idx);
		model.addAttribute("ref", ref);
		model.addAttribute("page", page);

		// model.addAttribute("page", page);

		return Util.Qna.VIEW_PATH + "qna_reply.jsp?page=" + page + "&idx=" + idx + "&ref=" + ref;

	}

	// 댓글쓰기
	@RequestMapping("/qna_reply.do")
	public String reply(QnaVO vo, String page) {

		// ip가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		QnaVO baseVO = qna_dao.selectOne(vo.getIdx());

		// 댓글작성을 위한 기준글의 step이상인 값은 +1처리를 해 주자
		qna_dao.update_step(baseVO);

		// 댓글이 들어갈 위치를 설정
		vo.setStep(baseVO.getStep() + 1);
		vo.setDepth(baseVO.getDepth() + 1);

		// 댓글추가
		qna_dao.reply(vo);

		return "redirect:qna_list.do?page=" + page;
	}

}