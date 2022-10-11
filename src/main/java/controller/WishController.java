package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.WishDAO;
import vo.MemberVO;
import vo.WishVO;

@Controller
public class WishController {
	WishDAO wish_dao;

	public void setWish_dao(WishDAO wish_dao) {
		this.wish_dao = wish_dao;
	}

	// 목록 전체 조회
	@RequestMapping("/wish.do")
	public String list(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("user");

		List<WishVO> wlist = wish_dao.selectList(vo.getId());
		model.addAttribute("wlist", wlist);

		return "/WEB-INF/views/wish/wish.jsp";
	}

	// 삭제 메서드
	@RequestMapping("/wish_delete.do")
	@ResponseBody
	public String delete(String id, String reginum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("reginum", reginum);

		int res = wish_dao.delete(map);
		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}

}
