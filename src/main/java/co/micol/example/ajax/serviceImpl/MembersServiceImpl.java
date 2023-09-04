package co.micol.example.ajax.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.example.ajax.mapper.AjaxMapper;
import co.micol.example.ajax.service.MembersService;
import co.micol.example.ajax.service.MembersVO;
import co.micol.example.common.DataSources;

public class MembersServiceImpl implements MembersService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private AjaxMapper map = sqlSession.getMapper(AjaxMapper.class);

	@Override
	public boolean addMember(MembersVO vo) {
		return map.insert(vo) == 1;
	}

	@Override
	public boolean editMember(MembersVO vo) {
		return map.update(vo) == 1;
	}

	@Override
	public boolean delMember(int mbrId) {
		return map.delete(mbrId) == 1;
	}

	@Override
	public List<MembersVO> listMember() {
		return map.list();
	}


}
