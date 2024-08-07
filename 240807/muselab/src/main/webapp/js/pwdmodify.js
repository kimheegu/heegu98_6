// 비밀번호 변경
function pwdMod(){
	$(".same_no").css("display", "none");
	$(".pwd_no").css("display", "none");
	$("origin_no").css("display", "none");
	
	var regExpPw = /^[a-zA-Z0-9]+$/;
	
	var form = document.userPwdModfrm;
	
	var origin = form.originPwd.value;
	var new1 = form.newPwd1.value;
	var new2 = form.newPwd2.value;
	
	if(origin == ""){
		alert("비밀번호를 입력해 주세요.")
		form.originPwd.select();
		return false;
	}
	else if(!regExpPw.test(origin)){
		alert("비밀번호는 영문·숫자만 입력해 주세요.");
		form.originPwd.select();
		return false;
	}
	
	else if(new1 == ""){
		alert("비밀번호를 입력해 주세요.")
		form.newPwd1.select();
		return false;
	}
	else if(!regExpPw.test(new1)){
		alert("비밀번호는 영문·숫자만 입력해 주세요.");
		form.newPwd1.select();
		return false;
	}
	
	else if(origin == new1){
		$(".same_no").css("display", "inline-block");
		form.newPwd1.select();
		return false;
	}
	else if(new1 != new2){
		$(".pwd_no").css("display", "inline-block");
		form.newPwd1.select();
		return false;
	}
}

// 기존 비밀번호 일치 확인
function pwdCheck(){
	var form = document.userPwdModfrm;
	
	var id = form.userId.value;
	var origin = form.originPwd.value;
	
	$.ajax({
		url : '/user/pwdCheck.do',
		type : 'post',
		data : {userId : id},
		success : function(result){ // 컨트롤러에서 넘어온 result값 받기
			if(result != origin){
				$("origin_no").css("display", "inline-block");
				form.originPwd.select();
				return false;
			}
			else if(result == origin){
				$("origin_no").css("display", "none");
				return false;
			}
		},
		error:function(){
			alert("에러입니다.");
		}
	})
}