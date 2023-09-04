package co.micol.example.ajax.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.example.ajax.mapper.ToDoMapper;
import co.micol.example.ajax.service.ToDoService;
import co.micol.example.ajax.service.ToDoVO;
import co.micol.example.common.DataSources;

public class ToDoServiceImpl implements ToDoService {
	private SqlSession session = DataSources.getInstance().openSession(true);
	private ToDoMapper map = session.getMapper(ToDoMapper.class); 
	
	@Override
	public boolean insert(ToDoVO vo) {
		return map.insert(vo) == 1;
	}

	@Override
	public boolean update(ToDoVO vo) {
		return map.update(vo) == 1;
	}

	@Override
	public boolean delete(int num) {
		return map.delete(num) == 1;
	}

	@Override
	public List<ToDoVO> list() {
		return map.list();
	}

}
