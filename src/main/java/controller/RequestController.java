package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.RequestDAO;
import util.Util;
import vo.RequestVO;

@Controller
public class RequestController {

	RequestDAO request_dao;

	public void setRequest_dao(RequestDAO request_dao) {
		this.request_dao = request_dao;
	}

	@RequestMapping("/request.do")
	public String request(Model model) {

		return Util.Request.VIEW_PATH + "request.jsp";
	}

	@RequestMapping("/request_insert.do")
	@ResponseBody
	public String request_insert(Model model, String id, String title, String authors, String isbn, String opinion) {

		RequestVO vo = new RequestVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setAuthors(authors);
		vo.setIsbn(isbn);
		vo.setOpinion(opinion);

		int res = request_dao.insert(vo);

		String result = "no";
		if (res == 1) {
			result = "yes";
		}

		return result;
	}

}
