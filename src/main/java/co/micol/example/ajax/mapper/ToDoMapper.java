package co.micol.example.ajax.mapper;

import java.util.List;

import co.micol.example.ajax.service.ToDoVO;

public interface ToDoMapper {
	public boolean insert(ToDoVO vo);
	public boolean update(ToDoVO vo);
	public boolean delete(int num);
	public List<ToDoVO> list();
}
