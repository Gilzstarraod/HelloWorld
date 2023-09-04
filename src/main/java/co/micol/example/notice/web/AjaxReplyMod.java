package co.micol.example.notice.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.micol.example.notice.service.ReplyService;
import co.micol.example.notice.service.ReplyVO;
import co.micol.example.notice.serviceImpl.ReplyServiceImpl;

@WebServlet("/AjaxReplyMod.do")
public class AjaxReplyMod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rno = request.getParameter("rno");
		String reply = request.getParameter("reply");
		String replyer = request.getParameter("replyer");
		
		ReplyVO vo = new ReplyVO();
		vo.setReplyId(Integer.parseInt(rno));
		vo.setReply(reply);
		vo.setReplyer(replyer);
		
		ReplyService dao = new ReplyServiceImpl();
		
		Map<String, Object> map = new HashMap<>();
		
		if(dao.editReply(vo)) {
			map.put("retCode", "Success");
			map.put("data", vo);
		} else {
			map.put("retCode", "Fail");
			map.put("data", "error");
		}
		
		Gson gson = new GsonBuilder().create();
		//String json = gson.toJson(list);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(gson.toJson(map));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
