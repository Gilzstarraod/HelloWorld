package co.micol.example.notice.service;

import java.util.List;

public interface NoticeService {
	List<NoticeVO> noticeSelectList();
	List<NoticeVO> noticeSelectList(String key, String val);
	
	List<NoticeVO> noticeSearchList(String key, String val);
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	
	void noticeUpdateHit(int id);
}
