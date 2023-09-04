package co.micol.example.ajax.service;

import java.util.List;

public interface ToDoService {
	public boolean insert(ToDoVO vo);
	public boolean update(ToDoVO vo);
	public boolean delete(int num);
	public List<ToDoVO> list();
}
