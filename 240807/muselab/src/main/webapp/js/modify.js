function checkUser(){
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var regExpPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	
	var email = form.userEmail.value;
	var nickname = form.userNickname.value;
	var phone = form.userPhone.value;
	
	if(nickname.length == 0){
		alert("닉네임을 입력해 주세요.");
		form.userNickname.select();
		return false;
	}
	
	else if(email.length == 0){
		alert("메일주소를 입력해 주세요.");
		form.userEmail.select();
		return false;
	}
	else if(!regExpEmail.test(email)){
		alert("이메일 형식에 맞게 입력해 주세요.");
		form.userEmail.select();
		return false;
	}
	
	else if(phone.length == 0){
		alert("전화번호를 입력해 주세요.");
		form.userPhone.select();
		return false;
	}
	else if(!regExpPhone.test(phone)){
		alert("전화번호 형식에 맞게 입력해 주세요.");
		form.userPhone.select();
		return false;
	}
	
	return true;
}

// 닉네임 중복
function nicknameCheck(){
	var form = document.userModfrm;
	var nickname = form.userNickname.value;
	
	$.ajax({
		url : '/user/nicknameCheck.do',
		type : 'post',
		data : {userNickname : nickname},
		success : function(result){ // 컨트롤러에서 넘어온 result값 받기
			if(result == 0){
				$(".nickname_ok").css("display", "inline-block");
				$('.nickname_already').css("display", "none");
			}
			else if(result == 1){
				$(".nickname_already").css("display", "inline-block");
				$(".nickname_ok").css("display", "none");
				form.userNickname.select();
				return false;
			}
		},
		error:function(){
			alert("에러입니다.");
		}
	})
}