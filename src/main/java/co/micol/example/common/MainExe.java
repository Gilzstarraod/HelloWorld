package co.micol.example.common;

import co.micol.example.notice.service.ReplyService;
import co.micol.example.notice.service.ReplyVO;
import co.micol.example.notice.serviceImpl.ReplyServiceImpl;

public class MainExe {
	public static void main(String[] args) {
		ReplyService service = new ReplyServiceImpl();
		
		ReplyVO reply = new ReplyVO();
		reply.setNoticeId(6);
		reply.setReply("mappertest");
		reply.setReplyer("user1");
		reply.setReplyId(31);
		
		reply = service.getReply(1);
		System.out.println(reply);
		
		service.replyList(6).forEach((vo) -> {
			System.out.println(vo);
		});
	}
}
