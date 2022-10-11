package controller;

import java.util.ArrayList;
import java.util.Calendar;
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

import dao.ReviewDAO;
import util.Paging;
import util.Util;
import vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	HttpServletRequest request;

	final String PATH = "/WEB-INF/views/";
	ReviewDAO review_dao;

	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}

	// 한줄평 메인 페이지 보이기
	@RequestMapping("/review.do")
	public String review(Model model, String page, String search, String select) {

		int nowPage = 1;

		if (page != null) {
			nowPage = Integer.parseInt(page);
		}

		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		// ?page=1
		int start = (nowPage - 1) * Util.Review.BLOCKLIST + 1;
		int end = start + Util.Review.BLOCKLIST - 1;

		// 검색 - map에 시작번호와 끝번호를 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 검색 - map에 search 값 넣기
		if (search == null) {
			search = "all";
		}
		map.put("search", search);

		// 검색 - map에 조회할 컬럼 넣기
		if (select == null) {
			map.put("title", "title");
			map.put("subject", "subject");
			map.put("content", "content");
		} else {
			if (select.equals("title")) {
				map.put("title", "title");
			} else if (select.equals("subject")) {
				map.put("subject", "subject");
			} else if (select.equals("content")) {
				map.put("content", "content");
			}
		}

		List<ReviewVO> list = review_dao.selectList(map);
		model.addAttribute("list", list);

		// 전체게시물 수 조회
		int row_total = review_dao.getRowTotal(map);

		System.out.println("nowPage" + nowPage);
		System.out.println("row_total" + row_total);

		// 하단에 표기될 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("review.do", nowPage, row_total, Util.Review.BLOCKLIST,
				Util.Review.BLOCKPAGE, search, select);

		model.addAttribute("pageMenu", pageMenu);

		// 그래프 - 달 구하기
		Calendar now = Calendar.getInstance();
		int[] months = new int[6];
		int test = 12;
		List<Integer> count_list = new ArrayList<Integer>();
		;

		for (int i = 0; i < 6; i++) {

			int month = now.get(Calendar.MONTH) + 1;

			months[i] = month - i;
			if (months[i] <= 0) {
				months[i] = test--;
			}
		}

		// 최근 6개월 간 한줄평 작성 수 구하기
		for (int i = 0; i < 6; i++) {
			int count = review_dao.monthCount(months[i]);
			count_list.add(count);

		}
		model.addAttribute("count_list", count_list);

		// show라는 이름으로 저장된 값을 제거
		request.getSession().removeAttribute("show");

		return PATH + "review/review.jsp";
	}

	// 한줄평 작성 페이지로 이동
	@RequestMapping("/review_write.do")
	public String review_write(Model model) {

		return PATH + "review/review_write.jsp";
	}

	// 책 검색하기
	@RequestMapping("/book_search.do")
	public String book_search(Model model) {

		return PATH + "review/book_search.jsp";
	}

	// 한줄평 조회하기
	@RequestMapping("/review_view.do")
	public String review_view(Model model, int idx) {

		ReviewVO vo = review_dao.selectOne(idx);
		model.addAttribute("vo", vo);

		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			// 조회수 증가를 위한 업데이트 메서드 호출
			review_dao.update_readhit(idx);
			session.setAttribute("show", "");
		}

		return PATH + "review/review_view.jsp";
	}

	// 내용 작성하기
	@RequestMapping("/review_insert.do")
	public String review_insert(ReviewVO vo) {

		// ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		int res = review_dao.insert(vo);

		return "redirect:review.do";
	}

	// 수정폼 이동하기
	@RequestMapping("/review_modify.do")
	public String review_modify(Model model, int idx) {

		ReviewVO vo = review_dao.selectOne(idx);
		model.addAttribute("vo", vo);

		return PATH + "review/review_modify.jsp";
	}

	// 수정하기
	@RequestMapping("/review_update.do")
	public String review_update(ReviewVO vo, String page) {

		// ip 가져오기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);

		int res = review_dao.update(vo);

		return "redirect:review_view.do?idx=" + vo.getIdx() + "&page=" + page;
	}

	// 삭제 메서드
	@RequestMapping("/review_delete.do")
	@ResponseBody // return 값을 jsp 등으로 인식하지 않고, 콜백메서드로 전달하기 위한 키워드
	public String delete(int idx) {

		int res = review_dao.delete(idx);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		// @ResponseBody가 적용되어 있으므로
		// result에 no 또는 yes 데이터는 콜백 메서드로 돌아간다.
		return result;
	}
}
