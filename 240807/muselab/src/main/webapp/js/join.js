	function checkUser(){
		var regExpId = /^[a-zA-Z0-9]+$/;
		var regExpPw = /^[a-zA-Z0-9]+$/;
		var regExpPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		var form = document.userJoinfrm;
		
		var id = form.userId.value;
		var pwd = form.userPwd.value;
		var pwd1 = form.userPwd1.value;
		var nickname = form.userNickname.value;
		var email = form.userEmail1.value;
		var phone = form.userPhone.value;
		var idChk = form.idChk.value;
		
		
		if(id == ""){
			alert("아이디를 입력해 주세요.")
			form.userId.select();
			return false;
		}
		else if(!regExpId.test(id)){
			alert("아이디는 영문·숫자만 입력해 주세요.");
			form.userId.select();
			return false;
		}
		else if( idChk == "N"){
			alert("아이디 중복 확인을 체크해 주세요.");
			form.userId.select();
			return false;
		}
		
		else if(pwd == ""){
			alert("비밀번호를 입력해 주세요.")
			form.userPwd.select();
			return false;
		}
		else if(!regExpPw.test(pwd)){
			alert("비밀번호는 영문·숫자만 입력해 주세요.");
			form.userPwd.select();
			return false;
		}
		else if(pwd != pwd1){
			$(".pwd_no").css("display", "inline-block");
			form.userPwd1.select();
			return false;
		}
		
		else if(nickname.length == 0){
			alert("닉네임을 입력해 주세요.");
			form.userNickname.select();
			return false;
		}
		
		else if(email.length == 0){
			alert("이메일을 입력해 주세요.");
			form.userEmail1.select();
			return false;
		}
		else if(codeBtn == "N"){
			alert("이메일 본인 인증을 완료해 주세요.");
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
		
		else if(pwd == pwd1){
			$(".pwd_no").css("display", "none");
			form.userPwd1.select();
			return true;
		}
		return true;
	}
	
	// 아이디 중복 확인
	function idCheck(){
		var form = document.userJoinfrm;
		var id = form.userId.value;
		
		$.ajax({
			url : '/user/idCheck.do',
			type : 'post',
			data : {userId : id},
			success : function(result){ // 컨트롤러에서 넘어온 result 값
				if(result == 0){
					$(".id_ok").css("display", "inline-block");
					$('.id_already').css("display", "none");
					form.idChk.value = "Y"; // 중복 검사 했다는 표시
				}
				else if(result == 1){
					$(".id_already").css("display", "inline-block");
					$(".id_ok").css("display", "none");
					form.userId.select();
					return false;
				}
			},
			error:function(){
				alert("에러입니다.");
			}
		})
	}

	// 닉네임 중복
	function nicknameCheck(){
		var form = document.userJoinfrm;
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
	
	function mailCheck(){
		var form = document.userJoinfrm;
		var email1 = form.userEmail1.value;
		var email2 = form.userEmail2.value;
		
		$("#mailNumber").css("display","block");
		$.ajax({
			url:"/user/emailCheck.do",
			type:"post",
			dataType:"json",
			data:{email : email1 + email2},
			success: function(data){
				alert("인증번호 발송");
				$("#confirm").attr("value",data);
			}
		});
	}
	
	function confirmNumber(){
		var number1 = $("#codeNumber").val();
		var number2 = $("#confirm").val();
		
		if(number1 == number2){
			$(".email_ok").css("display", "inline-block");
			$('.email_no').css("display", "none");
			form.codeBtn.value = "Y"; // 중복 검사 했다는 표시
		}
		else{
			$(".email_ok").css("display", "none");
			$('.email_no').css("display", "inline-block");
		}
	}
