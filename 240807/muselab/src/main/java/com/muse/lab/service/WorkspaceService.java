package com.muse.lab.service;

import java.util.List;

import com.muse.lab.vo.MuseLabVO;

public interface WorkspaceService {
		// 작업실 목록 출력
		public List workspaceList() throws Exception;	
		
		// 작업실 상세 보기 
		public List workspaceDetail(int musicId) throws Exception;
		
		// 작업실 글쓰기
		public int workspaceWrite(MuseLabVO mlVO) throws Exception;

		// 작업실 수정
		public int workspaceMod(MuseLabVO mlVO) throws Exception;
						
		// 작업실 삭제
		public int workspaceDel(MuseLabVO mlVO) throws Exception;
		
		// 조회수 증가
		public int musicViewPlus(int musicId) throws Exception;
		
		// 좋아요 추가
		public int musicLikeInsert(MuseLabVO mlVO) throws Exception;
		
		// 좋아요 삭제
		public int musicLikeDel(MuseLabVO mlVO) throws Exception;
		
		// 좋아요 수 확인
		public List musicLikeCnt(int musicId) throws Exception;
	 
		// 댓글 추가
		public int musicCommentInsert(MuseLabVO mlVO) throws Exception;
		
		// 댓글 수정
		public int musicCommentMod(MuseLabVO mlVO) throws Exception;
		
		// 댓글 삭제
		public int musicCommentDel(MuseLabVO mlVO) throws Exception;
}
