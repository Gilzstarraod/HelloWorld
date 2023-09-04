package co.micol.example.ajax.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.micol.example.ajax.service.ToDoService;
import co.micol.example.ajax.service.ToDoVO;
import co.micol.example.ajax.serviceImpl.ToDoServiceImpl;

@WebServlet("/AjaxToDoList.do")
public class AjaxToDoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ToDoService svc = new ToDoServiceImpl();
		List<ToDoVO> list = svc.listToDo();
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
