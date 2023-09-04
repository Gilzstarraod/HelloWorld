package co.micol.example.ajax.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.example.ajax.mapper.AjaxMapper;
import co.micol.example.ajax.service.ToDoService;
import co.micol.example.ajax.service.ToDoVO;
import co.micol.example.common.DataSources;

public class ToDoServiceImpl implements ToDoService {
	private SqlSession session = DataSources.getInstance().openSession(true);
	private AjaxMapper map = session.getMapper(AjaxMapper.class); 
	
	@Override
	public boolean addToDo(ToDoVO vo) {
		return map.insert(vo) == 1;
	}

	@Override
	public boolean editToDo(ToDoVO vo) {
		return map.update(vo) == 1;
	}

	@Override
	public boolean delToDo(int num) {
		return map.delete(num) == 1;
	}

	@Override
	public List<ToDoVO> listToDo() {
		return map.list();
	}

}
