package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Util;

@Controller
public class StaticController {

	@RequestMapping("/recommend.do")
	public String recommend() {

		return Util.Static.VIEW_PATH + "recommend.jsp";
	}

	@RequestMapping("/mbti.do")
	public String mbti() {

		return Util.Static.VIEW_PATH + "mbti.jsp";
	}

	@RequestMapping("/library_guide.do")
	public String library_guide() {
		return Util.Static.VIEW_PATH + "library_guide.jsp";
	}

	@RequestMapping("/checkout_guide.do")
	public String checkout_guide() {
		return Util.Static.VIEW_PATH + "checkout_guide.jsp";
	}

	@RequestMapping("/map.do")
	public String map() {
		return Util.Static.VIEW_PATH + "map.jsp";
	}

	@RequestMapping("/membership.do")
	public String membership() {
		return Util.Static.VIEW_PATH + "membership.jsp";
	}

	@RequestMapping("/often.do")
	public String often() {
		return Util.Static.VIEW_PATH + "often.jsp";
	}

	@RequestMapping("/footer1.do")
	public String footer1() {
		return Util.Static.VIEW_PATH + "footer1.jsp";
	}

	@RequestMapping("/footer2.do")
	public String footer2() {
		return Util.Static.VIEW_PATH + "footer2.jsp";
	}

	@RequestMapping("/footer3.do")
	public String footer3() {
		return Util.Static.VIEW_PATH + "footer3.jsp";
	}

}
