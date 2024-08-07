package com.muse.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.muse.lab.dao.WorkspaceDAO;
import com.muse.lab.vo.MuseLabVO;

@Service("workspaceService")
@Transactional(propagation = Propagation.REQUIRED)
public class WorkspaceServiceImpl implements WorkspaceService{

	@Autowired
	private WorkspaceDAO workspaceDAO;

	// 작업실 목록 출력
	@Override
	public List workspaceList() throws Exception {
		List workspaceList = null;
		workspaceList = workspaceDAO.workspaceList();
		return workspaceList;		
	}
	
	// 작업실 상세 보기
	@Override
	public List workspaceDetail(int musicId) throws Exception {
		List workspaceList = null;
		workspaceList = workspaceDAO.workspaceDetail(musicId);
		return workspaceList;		

	}
	
	// 작업실 글쓰기
	@Override
	public int workspaceWrite(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.workspaceWrite(mlVO);
	}

	// 작업실 글 수정
	@Override
	public int workspaceMod(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.workspaceMod(mlVO);
	}

	// 작업실 글 삭제
	@Override
	public int workspaceDel(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.workspaceDel(mlVO);
	}

	// 작업실 글 조회수 증가
	@Override
	public int musicViewPlus(int musicId) throws Exception {
		return workspaceDAO.musicViewPlus(musicId);
	}

	// 작업실 좋아요 추가
	@Override
	public int musicLikeInsert(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.musicLikeInsert(mlVO);
	}

	// 작업실 좋아요 삭제
	@Override
	public int musicLikeDel(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.musicLikeDel(mlVO);
	}

	// 작업실 좋아요 수 확인
	@Override
	public List musicLikeCnt(int musicId) throws Exception {
		List workspaceList = null;
		workspaceList = workspaceDAO.musicLikeCnt(musicId);
		return workspaceList;	
	}

	// 작업실 댓글 추가
	@Override
	public int musicCommentInsert(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.musicCommentInsert(mlVO);
	}

	// 작업실 댓글 수정
	@Override
	public int musicCommentMod(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.musicCommentMod(mlVO);
	}

	// 작업실 댓글 삭제
	@Override
	public int musicCommentDel(MuseLabVO mlVO) throws Exception {
		return workspaceDAO.musicCommentDel(mlVO);
	}
	
	
}
