package co.micol.example.ajax.service;

import java.util.List;

public interface ToDoService {
	public boolean addToDo(ToDoVO vo);
	public boolean editToDo(ToDoVO vo);
	public boolean delToDo(int num);
	public List<ToDoVO> listToDo();
}
