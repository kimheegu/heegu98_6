package com.muse.lab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.muse.lab.vo.MuseLabVO;

@Mapper
@Repository("workspaceDAO")
public interface WorkspaceDAO {
	// 작업실 목록 출력
	public List<MuseLabVO> workspaceList() throws DataAccessException;	
	
	// 작업실 상세 보기 
	public List<MuseLabVO> workspaceDetail(int musicId) throws DataAccessException;	
	
	// 작업실 글쓰기
	public int workspaceWrite(MuseLabVO mlVO) throws DataAccessException;

	// 작업실 수정
	public int workspaceMod(MuseLabVO mlVO) throws DataAccessException;
					
	// 작업실 삭제
	public int workspaceDel(MuseLabVO mlVO) throws DataAccessException;
	
	// 조회수 증가
	public int musicViewPlus(int musicId) throws DataAccessException;
	
	// 좋아요 추가
	public int musicLikeInsert(MuseLabVO mlVO) throws DataAccessException;
	
	// 좋아요 삭제
	public int musicLikeDel(MuseLabVO mlVO) throws DataAccessException;
	
	// 좋아요 수 확인
	public List<MuseLabVO> musicLikeCnt(int musicId) throws DataAccessException;	
 
	// 댓글 추가
	public int musicCommentInsert(MuseLabVO mlVO) throws DataAccessException;
	
	// 댓글 수정
	public int musicCommentMod(MuseLabVO mlVO) throws DataAccessException;
	
	// 댓글 삭제
	public int musicCommentDel(MuseLabVO mlVO) throws DataAccessException;
	
}
