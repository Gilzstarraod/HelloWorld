package co.micol.example.ajax.mapper;

import java.util.List;

import co.micol.example.ajax.service.ToDoVO;

public interface AjaxMapper {
	public int insert(ToDoVO vo);
	public int update(ToDoVO vo);
	public int delete(int num);
	public List<ToDoVO> list();
}
