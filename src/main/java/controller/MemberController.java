package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MemberController {

	final String PATH = "/WEB-INF/views/";
	MemberDAO member_dao;

	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}

	@RequestMapping("/regi_form.do")
	public String regi_show(Model model) {

		return PATH + "member/regi_form.jsp";
	}

	// 아이디 중복 체크
	@RequestMapping("/id_check.do")
	@ResponseBody // return 값을 jsp 등으로 인식하지 않고, 콜백메서드로 전달하기 위한 키워드
	public String selectOne(Model model, String id) {
		MemberVO vo = member_dao.selectOne(id);

		String result = "no";
		if (vo != null) {
			result = "yes";
		}

		// @ResponseBody가 적용되어 있으므로
		// result에 no 또는 yes 데이터는 콜백 메서드로 돌아간다.
		return result;
	}

	@RequestMapping("/regi_insert.do")
	@ResponseBody
	public String insert(Model model, String name, String id, String pwd, String email, String tel, String addr) {
		int res = member_dao.insert(name, id, pwd, email, tel, addr);
		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}

	@RequestMapping("/login_form.do")
	public String login_show(Model model) {

		return PATH + "member/login_form.jsp";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public String loginCheck(MemberVO vo, HttpServletRequest request) {
		MemberVO baseVO = member_dao.select(vo);

		String resultStr = "";

		// id가 존재하지 않는 경우
		if (baseVO == null) {
			resultStr = "no_id";
			return resultStr; // no_id를 콜백 메서드로 전달
		}

		// 비밀번호 불일치
		if (!baseVO.getPwd().equals(vo.getPwd())) {
			resultStr = "no_pwd";
			return resultStr; // no_pwd를 콜백 메서드로 전달
		}

		// 아이디와 비밀번호에 문제가 없다면 세션에 MemberVO 객체로 저장
		// 세션에 저장된 데이터는 현재 프로젝트의 모든 jsp에서 사용이 가능
		HttpSession session = request.getSession();
		session.setAttribute("user", baseVO);
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		System.out.println("--member controller" + mvo.getId());
		resultStr = "clear";
		return resultStr; // 로그인 성공시 clear를 콜백 메서드로 전달
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// user로 저장해둔 데이터를 세션에서 제거
		session.removeAttribute("user");

		return "redirect:main.do";
	}

}
