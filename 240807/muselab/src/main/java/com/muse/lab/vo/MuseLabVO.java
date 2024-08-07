package com.muse.lab.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component("mlVO")
public class MuseLabVO {
	// user
	private String userId;
	private String userPwd;
	private String originPwd;
	private String newPwd1;
	private String newPwd2;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userEmail1;
	private String userEmail2;
	private String userNickname;
	private String userProfile;
	private String userInfo;
	private String userPostcode;
	private String userAddress;
	private String userDetailAddress;
	private String userNote;
	private String userGrade;
	private String userBank;
	private String userAccount;
	
	// music
	private int musicId;
	private String musicTitle;
	private String musicInfo;
	private String musicGenre;
	private String musicAlbum;
	private Date musicDate;
	private String musicFile;
	private String musicImage;
	private int musicViews;
	
	// music comment
	private int musicCommentId;
	private String musicCommentContent;
	private Date musicCommentDate;
	
	// music like
	private int musicLikeId;
	
	// playlist
	private int playlistId;
	private String playlistFolder;
	
	// community
	private int communityId;
	private String communityCategory;
	private String communityTitle;
	private String communityContent;
	private Date communityDate;
	private String communityImage1;
	private String communityImage2;
	private String communityImage3;
	private String communityImage4;
	private String communityImage5;
	private String communityViews;
	
	// comm comment
	private int commCommentId;
	private String commCommentContent;
	private Date commCommentDate;
	
	// comm like
	private int commLikeID;
	
	// market
	private int marketId;
	private String marketTitle;
	private String marketContent;
	private String marketImage1;
	private String marketImage2;
	private String marketImage3;
	private String marketImage4;
	private String marketImage5;
	private int marketPrice;
	private String marketCategory;
	private String marketViews;
	private String marketStock;
	private String marketStatus;
	
	// market review
	private int mkReviewId;
	private String mkReviewContent;
	private Date mkReviewDate;
	private Double mkReviewScore;
	
	// market like
	private int mkLikeId;
	
	// user msg
	private int userMsgId;
	private String userMsgTitle;
	private String userMsgContent;
	private Date userMsgDate;
	
	// notice
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImage1;
	private String noticeImage2;
	private String noticeImage3;
	private String noticeImage4;
	private String noticeImage5;
	private int noticeViews;
	
	// operation
	private int operationId;
	
	// event
	private int eventId;
	
	// article
	private int articleId;
	private String articleTitle;
	private String articleContent;
	private String articleImage1;
	private String articleImage2;
	private String articleImage3;
	private String articleImage4;
	private String articleImage5;
	private int articleViews;
	
	// ad
	private int adId;
	private String adTitle;
	private Date adStart;
	private Date adEnd;
	private String adImage;
	private String adMemo;
	private String adPosition;
	
	// buy
	private int buyId;
	private String orderId;
	private int buyCount;
	private String buyStatus;
	private Date buyDate;
	
	// admin
	private String adminId;
	private String adminPwd;
	private String adminName;
	
	// kakao
	private String kakaoId;
	private String kakaoName;
	private String kakaoNickname;
	private String kakaoEmail;
	private String kakaoPhone;
} 
