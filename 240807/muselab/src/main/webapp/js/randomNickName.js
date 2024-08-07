	// 닉네임 랜덤 생성기
	window.onload=function randomNickName(){

		const First = ["귀여운", "배고픈", "밥먹는", "잠자는", "여유로운", "졸린", "심심한", "외로운", "행복한", "즐거운", "화난"];
		const Second = ["강아지", "고양이", "말", "사자", "호랑이", "늑대", "여우", "돌고래", "고래", "상어", "오징어", "문어", "조랑말", "당나귀", 
				"닭", "돼지", "하마", "소", "쥐", "햄스터", "외계인", "토끼", "뱀", "용", "양", "원숭이", "곰", "맷돼지", "기린", "코알라", "카멜레온", "두더지", "개구리", "박쥐"];
		var number =parseInt((Math.random() * 99) + 1 + "");
		
		const FirstIndex = Math.floor(Math.random() * First.length);
		const SecondIndex = Math.floor(Math.random() * Second.length);
		
		var first = First[FirstIndex];
		var second = Second[SecondIndex];

		document.getElementById("userNickname").value = first + second + number;
	}