package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CheckoutDAO;
import vo.CheckoutVO;

@Controller
public class CheckoutController {
	
	CheckoutDAO checkout_dao;
	public void setCheckout_dao(CheckoutDAO checkout_dao) {
		this.checkout_dao = checkout_dao;
	}
	
	// 목록 전체 조회
	@RequestMapping("checkout.do")
	public String list(Model model) {
		
		
		List<CheckoutVO> blist = checkout_dao.selectList();
		model.addAttribute("blist", blist);

		return "/WEB-INF/views/checkout/checkout.jsp";
	}
	
	// 반납 일자 수정
	@RequestMapping("/modify.do")
	public String modify(String id, String reginum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("reginum", reginum);
		
		int res = checkout_dao.update(map);
		
		return "redirect:checkout.do";
		
	}
}