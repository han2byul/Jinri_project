package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.EventDAO;
import dao.NoticeDAO;
import dao.QnaDAO;
import vo.EventVO;
import vo.NoticeVO;
import vo.QnaVO;

@Controller
public class MainController {
	final String PATH = "/WEB-INF/views/";
	NoticeDAO notice_dao2;
	QnaDAO qna_dao2;
	EventDAO event_dao2;

	public void setNotice_dao2(NoticeDAO notice_dao2) {
		this.notice_dao2 = notice_dao2;
	}

	public void setQna_dao2(QnaDAO qna_dao2) {
		this.qna_dao2 = qna_dao2;
	}

	public void setEvent_dao2(EventDAO event_dao2) {
		this.event_dao2 = event_dao2;
	}

	@RequestMapping(value = { "/", "/main.do" })
	public String main(Model model) {

		List<NoticeVO> nlist = notice_dao2.list_main();
		model.addAttribute("n_list", nlist);

		List<QnaVO> qlist = qna_dao2.list_main();
		model.addAttribute("q_list", qlist);

		List<EventVO> elist = event_dao2.list_main();
		model.addAttribute("e_list", elist);

		return PATH + "main.jsp";
	}

}
