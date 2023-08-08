package co.micol.example.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.example.common.DataSources;
import co.micol.example.member.mapper.MemberMapper;
import co.micol.example.member.service.MemberVO;
import co.micol.example.member.service.MemberService;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);

	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

	@Override
	public MemberVO memberSelect(MemberVO vo) {
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

}
