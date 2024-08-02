<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.muse.lab.dao.MuseMarketDAO">
<resultMap id="marketResult" type="MuseLabVO">
		<!-- user -->
		<result property="userId" column="user_id" />
		<result property="userPwd" column="user_pwd" />
		<result property="userPhone" column="user_phone" />
		<result property="userEmail" column="user_email" />
		<result property="userNickname" column="user_nickname" />
		<result property="userProfile" column="user_profile" />
		<result property="userInfo" column="user_info" />
		<result property="userAddress" column="user_address" />
		<result property="userGrade" column="user_grade" />
		<result property="userBank" column="user_bank" />
		<result property="userAccount" column="user_account" />
		
		<!-- music -->
		<result property="musicId" column="music_id" />
		<result property="musicTitle" column="music_title" />
		<result property="musicInfo" column="music_info" />
		<result property="musicGenre" column="music_genre" />
		<result property="musicAlbum" column="music_album" />
		<result property="musicDate" column="music_date" />
		<result property="musicFile" column="music_file" />
		<result property="musicImage" column="music_image" />
		<result property="musicViews" column="music_views" />
		
		<!-- music comment -->
		<result property="musicCommentId" column="music_comment_id" />
		<result property="musicCommentContent" column="music_comment_content" />
		<result property="musicCommentDate" column="music_comment_date" />
		
		<!-- music like -->
		<result property="musicLikeId" column="music_like_id" />
		
		<!-- playlist -->
		<result property="playlistId" column="playlist_id" />
		<result property="playlistFolder" column="playlist_folder" />

		<!-- commuity -->
		<result property="communityId" column="community_id" />
		<result property="communityCategory" column="community_category" />
		<result property="communityTitle" column="community_title" />
		<result property="communityContent" column="community_content" />
		<result property="communityDate" column="community_date" />
		<result property="communityImage1" column="community_image1" />
		<result property="communityImage2" column="community_image2" />
		<result property="communityImage3" column="community_image3" />
		<result property="communityImage4" column="community_image4" />
		<result property="communityImage5" column="community_image5" />
		<result property="communityViews" column="community_views" />

		<!-- commuity comment -->
		<result property="commCommentId" column="comm_comment_id" />
		<result property="commCommentContent" column="comm_comment_content" />
		<result property="commCommentDate" column="comm_comment_date" />

		<!-- commuity like -->
		<result property="commLikeId" column="comm_like_id" />

		<!-- market -->
		<result property="marketId" column="market_id" />
		<result property="marketTitle" column="market_title" />
		<result property="marketContent" column="market_content" />
		<result property="marketImage1" column="market_image1" />
		<result property="marketImage2" column="market_image2" />
		<result property="marketImage3" column="market_image3" />
		<result property="marketImage4" column="market_image4" />
		<result property="marketImage5" column="market_image5" />
		<result property="marketPrice" column="market_price" />
		<result property="marketCategory" column="market_category" />
		<result property="marketViews" column="market_views" />
		<result property="marketStock" column="market_stock" />
		<result property="marketStock1" column="market_stock1"/>
		<result property="marketStatus" column="market_status" />
		<result property="marketUser" column="market_user"/>
		<result property="marketDescription" column="market_description"/>

		<!-- market comment -->
		<result property="mkReviewId" column="mk_review_id" />
		<result property="mkReviewContent" column="mk_review_content" />
		<result property="mkReviewDate" column="mk_review_date" />
		<result property="mkReviewScore" column="mk_review_score" />

		<!-- market like -->
		<result property="mkLikeId" column="mk_like_id" />

		<!-- user msg -->
		<result property="userMsgId" column="user_msg_id" />
		<result property="userMsgTitle" column="user_msg_title" />
		<result property="userMsgContent" column="user_msg_content" />
		<result property="userMsgDate" column="user_msg_date" />

		<!-- notice -->
		<result property="noticeId" column="notice_id" />
		<result property="noticeTitle" column="notice_title" />
		<result property="noticeContent" column="notice_content" />
		<result property="noticeImage1" column="notice_image1" />
		<result property="noticeImage2" column="notice_image2" />
		<result property="noticeImage3" column="notice_image3" />
		<result property="noticeImage4" column="notice_image4" />
		<result property="noticeImage5" column="notice_image5" />
		<result property="noticeViews" column="notice_views" />
	
		<!-- operation -->
		<result property="operationId" column="operation_id" />
		
		<!-- event -->
		<result property="eventId" column="event_id" />
		
		<!-- article -->
		<result property="articleId" column="article_id" />
		<result property="articleTitle" column="article_title" />
		<result property="articleContent" column="article_content" />
		<result property="articleImage1" column="article_image1" />
		<result property="articleImage2" column="article_image2" />
		<result property="articleImage3" column="article_image3" />
		<result property="articleImage4" column="article_image4" />
		<result property="articleImage5" column="article_image5" />
		<result property="articleViews" column="article_views" />

		<!-- ad -->
		<result property="adId" column="ad_id" />
		<result property="adTitle" column="ad_title" />
		<result property="adStart" column="ad_start" />
		<result property="adEnd" column="ad_end" />
		<result property="adImage" column="ad_image" />
		<result property="adMemo" column="ad_memo" />
		<result property="adPosition" column="ad_position" />

		<!-- buy -->
		<result property="buyId" column="buy_id" />
		<result property="orderId" column="order_id" />
		<result property="buyCount" column="buy_count" />
		<result property="buyStatus" column="buy_status" />
		<result property="buyDate" column="buy_date" />
		<result property="buyUserId" column="buy_user_id" />
		<result property="buyMarketId" column="buy_market_id" />
		<result property="buyPrice" column="buy_price" />
		
		<!-- admin -->
		<result property="adminId" column="admin_id" />
		<result property="adminPwd" column="admin_pwd" />
		<result property="adminName" column="admin_name" />		
	</resultMap>
	
	
	<!-- 관리자 -->
	
	<!-- 관리자 판매 요청 게시글 목록 보기 -->
	<select id="listCriteria" resultMap="marketResult">
		SELECT * FROM market WHERE market_id > 0 ORDER BY market_id DESC LIMIT #{pageStart}, #{perPageNum}
	</select>
	
	<!-- 관리자 판매 게시글 개수 -->
	<select id="count" resultType="int" parameterType="MuseLabVO">
		SELECT COUNT(*) AS market_count FROM market where market_id > 0
	</select>
	
	<!-- 관리자 판매 요청 게시글 세부 정보-->
	<select id="sellView" parameterType="String" resultMap="marketResult">
		SELECT * FROM market WHERE market_id = #{marketId}
	</select>
	
	<!-- 관리자 승인 요청 수정-->
	<update id="statusMod" parameterType="MuseLabVO">
		UPDATE market
		SET market_status = #{marketStatus}
		WHERE market_id = #{marketId}
	</update>
	
	
	
	<!-- 사용자 -->

	<!-- 판매 게시 요청 -->
	<insert id="marketInsert" parameterType="MuseLabVO">
	INSERT INTO market(market_title,market_description,market_content,market_image1,market_image2,market_image3,market_image4,market_image5,market_price,market_category,market_user,market_views,market_stock,market_status,market_stock1)
	VALUES(#{marketTitle},#{marketDescription},#{marketContent},#{marketImage1},#{marketImage2},#{marketImage3},#{marketImage4},#{marketImage5},#{marketPrice},#{marketCategory},#{userId},0,#{marketStock},#{marketStatus},#{marketStock1})
	</insert>

	<!-- 판매 승인 게시글 출력 -->
	<select id="mkList" resultMap="marketResult">
		SELECT * 
		FROM market 
		WHERE market_status = '판매승인' 
		ORDER BY market_id DESC
	</select>

	<!-- 판매 승인 게시글 세부 내용 출력 -->
	<select id="mkListView" parameterType="String" resultMap="marketResult">
		SELECT * 
		FROM market 
		WHERE market_id = #{marketId}
	</select>
	
	<!-- 재고 확인 -->
	<select id="findStock" parameterType="String" resultMap="marketResult">
		SELECT market_stock
		FROM market 
		WHERE market_id = #{marketId}
	</select>
	
	<!--구매 내역 -->
	<insert id="buyInsert" useGeneratedKeys="true" keyProperty="buyId" parameterType="MuseLabVO">	
		INSERT INTO buy(order_id,buy_count,buy_status,buy_date,buy_user_id,buy_market_id,buy_price)
		VALUES(lpad(floor(rand()*100000000), 8, '0'),#{buyCount},'구매대기',now(),#{userId},#{marketId},#{buyPrice})
	</insert>
	
	<!-- 구매 창 출력 -->
	<select id="buyList" parameterType="int" resultMap="marketResult">
		SELECT * FROM market LEFT JOIN buy
		ON buy_market_id = market_id
		LEFT JOIN user
        ON market_user = user_id
		WHERE buy.buy_id = #{buyId}
	</select>
</mapper>