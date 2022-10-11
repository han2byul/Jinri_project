package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.SearchDAO;
import util.Paging;
import util.Util;
import vo.SearchVO;

@Controller
public class SearchController {

	@Autowired
	HttpServletRequest request;

	SearchDAO search_dao;

	public void setSearch_dao(SearchDAO search_dao) {
		this.search_dao = search_dao;
	}

	@RequestMapping("/search.do")
	public String search(Model model, String page, String search, String select) {

		int nowPage = 1;

		if (page != null) {
			nowPage = Integer.parseInt(page);
		}

		int start = (nowPage - 1) * Util.Search.BLOCKLIST + 1;
		int end = start + Util.Search.BLOCKLIST - 1;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);

		List<SearchVO> list;

		// 검색 - map에 조회할 컬럼 넣기
		if (search != null) {
			if (select == null) {
				map.put("bname", "bname");
				map.put("author", "author");
			} else {
				if (select.equals("bname")) {
					map.put("bname", "bname");
				} else if (select.equals("author")) {
					map.put("author", "author");
				} else if (select.equals("all")) {
					map.put("all", "all");
				}
			}
			list = search_dao.selectList(map);
			model.addAttribute("list", list);

			// 전체게시물 수 조회
			int row_total = search_dao.getRowTotal(map);

			if (row_total > 0) {
				// 하단에 표기될 페이지 메뉴 생성
				String pageMenu = Paging.getPaging("search.do", nowPage, row_total, Util.Search.BLOCKLIST,
						Util.Search.BLOCKPAGE, search, select);

				model.addAttribute("pageMenu", pageMenu);
			}
		}

		return Util.Search.VIEW_PATH + "search.jsp";
	}

	@RequestMapping("/book_info.do")
	public String book_info(Model model, String search) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("bname", "bname");
		map.put("start", 1);
		map.put("end", 1);

		List<SearchVO> list = search_dao.selectList(map);
		model.addAttribute("list", list);

		return Util.Search.VIEW_PATH + "book_info.jsp";
	}

	@RequestMapping("/wish_insert.do")
	@ResponseBody
	public String wish(Model model, String id, String reginum) {
		SearchVO vo = new SearchVO();
		vo.setId(id);
		vo.setReginum(reginum);

		int res = search_dao.wish(vo);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}

}
