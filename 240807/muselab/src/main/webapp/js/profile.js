<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	// 프로필 이미지 추가/변경/삭제
	const profileImage = document.getElementById("profileImage"); // img 태그
	const deleteImage = document.getElementById("deleteImage"); // x 버튼
	const imageInput = document.getElementById("imageInput"); // input 태그
	
	let initCheck; // 초기 프로필 이미지 상태를 저장하는 변수
				   // false == 기본 이미지, true == 이전 업로드 이미지
	
	let deleteCheck = -1;
	// 프로필 이미지가 새로 업로드되거나 삭제되었음을 나타내는 변수
	// -1 == 초기값, 0 == 프로필 삭제(x버튼), 1 == 새 업로드 이미지
	
	let originalImage; // 초기 프로필 이미지 파일 경로 저장
	
	if(imageInput != null){ // 화면에 imageInput이 있을 경우

	// 프로필 이미지가 출력되는 img 태그의 src 속성을 저장
	originalImage = profileImage.getAttribute("src");

	// 회원 프로필 화면 진입 시 
	// 현재 회원의 프로필 이미지 상태를 확인
	if(originalImage == "${contextPath}/images/userprofile/profile.png"){
		// 기본 이미지인 경우
		initCheck = false;

	}
	else{
		initCheck = true;
	}

	// change 이벤트 : 값이 변했을 때
	// input값 입력 후 포커스를 잃었을 때 이전 값과 다르면 change 이벤트 발생
	imageInput.addEventListener("change", e => {
	// 2MB로 최대 크기 제한
	const maxSize = 1 * 1024 * 1024 * 2; // 파일의 최대 크기 지정(바이트 단위)

	console.log(e.target); // input
	console.log(e.target.value); // 업로드된 파일 경로
	console.log(e.target.files); // 업로드된 파일의 정보가 담긴 배열

	const file = e.target.files[0]; // 업로드한 파일의 정보가 담긴 객체

	// 파일을 한 번 선택한 후 취소했을 때
	if(file == undefined){
	console.log("파일 선택이 취소됨");
	deleteCheck = -1; // 취소 == 파일 없음 == 초기 상태

	// 취소 시 기존 프로필 이미지로 변경
	profileImage.setAttribute("src", originalImage);
	return;
	}

	if(file.size > maxSize){ // 선택된 파일의 크기가 최대 크기를 초과한 경우
	alert("2MB 이하의 이미지를 선택해 주세요.");
	imageInput.value = "";
	// input type="file" 태그에 대입할 수 있는 value는 ""(빈칸) 뿐

	deleteCheck = -1; // 취소 == 파일 없음 == 초기 상태

	// 기존 프로필 이미지로 변경
	profileImage.setAttribute("src", originalImage);

	return;
	}
	
	// JS에서 파일을 읽는 객체
	// 파일을 읽고 클라이언트 컴퓨터에 파일을 저장할 수 있음
	const reader = new FileReader();
	
	reader.readAsDataURL(file);
	// 매개변수에 작성된 파일을 읽어서 저장 후
	// 파일을 나타내는 URL을 result 속성으로 얻어올 수 있게 함
	
	// 다 읽었을 때
	reader.onload = e => {
	// console.log(e.target);
	// console.log(e.target.result); // 읽은 파일의 URL

	const url = e.target.result;

	// 프로필 이미지(img) 태그에 src 속성으로 추가
	profileImage.setAttribute("src", url);

	deleteCheck = 1;
	}
	});
	
	// x 버튼 클릭 시
	deleteImage.addEventListener("click", () =>{
		// 프로필 이미지를 기본 이미지로 변경
		profileImage.setAttribute("src", "${contextPath}/images/userprofile/profile.png");
	
		imageInput.value = ""; // input type="file"의 value 삭제
	
		deleteCheck = 0;
	});

	// #profileFrm이 제출되었을 때
	document.getElementById("profileFrm").addEventListener("submit", e=>{

	// let initCheck;
	// 초기 프로필 이미지 상태를 저장하는 변수
	// false == 기본 이미지, true == 이전 업로드 이미지
	
	// let deleteCheck = -1;
	// 프로필 이미지가 새로 업로드되거나 삭제되었음을 나타내는 변수
	// -1 == 초기값, 0 == 프로필 삭제(x버튼), 1 == 새 업로드 이미지
	
	let flag = true;
	
	// 프로필 이미지가 없다 -> 있다
	if(!initCheck && deleteCheck == 1) flag = false;
	
	// 이전 프로필 이미지가 있다 -> 삭제
	if(initCheck && deleteCheck == 0) flag = false;
	
	// 이전 프로필 이미지가 있다 -> 새 이미지
	if(initCheck && deleteCheck == 1) flag = false;
	
	if(flag) { // flag == true -> 제출하면 안 되는 경우
		e.preventDefault(); // form 기본 이벤트 제거
		alert('이미지 변경 후 클릭하세요.');
		}
	})
}