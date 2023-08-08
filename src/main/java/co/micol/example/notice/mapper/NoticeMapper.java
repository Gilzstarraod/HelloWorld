package co.micol.example.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.micol.example.notice.service.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> noticeSelectList();
	List<NoticeVO> noticeSelectList(@Param("key") String key,@Param("val") String val);
	
	List<NoticeVO> noticeSearchList(@Param("key") String key,@Param("val") String val);
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	
	void noticeUpdateHit(int id); //mapper 에서는 두개 이상의 매개변수가 있다면 어노테이션param을 사용해야함
}
