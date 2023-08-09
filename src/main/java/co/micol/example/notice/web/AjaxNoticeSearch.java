package co.micol.example.notice.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.micol.example.notice.service.NoticeService;
import co.micol.example.notice.service.NoticeVO;
import co.micol.example.notice.serviceImpl.NoticeServiceImpl;

@WebServlet("/ajaxnoticesearch.do")
public class AjaxNoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxNoticeSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax를 이용해 검색결과를 json으로 보냄
		NoticeService dao = new NoticeServiceImpl();
		List<NoticeVO> notices = new ArrayList<NoticeVO>();
		
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		notices = dao.noticeSearchList(key, val);
		
		ObjectMapper objectmapper = new ObjectMapper(); // json객체를 만들기 위한 객체
		
		objectmapper.registerModule(new JavaTimeModule()); //LocalDate 처리
		objectmapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
		
		String data = objectmapper.writeValueAsString(notices); // json형태로 결과를 만들어 줌
		// 호출 결과를 호출한 곳으로 보내주는 역할
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
