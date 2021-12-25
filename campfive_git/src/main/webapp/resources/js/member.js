$(document).ready(() => {
	$("#checkDuplicate").on("click", () => {
		let userId = $("#newId").val().trim();
			
		$.ajax({
			type: "post",
			url: "../../member/idCheck",
			dataType: "json",
			data: {
				userId
			},
			success: (data) => {
				console.log(data);
					
				if(data.duplicate === true){
					alert("이미 사용 중인 아이디입니다.");
				} else {
					alert("사용 가능한 아이디입니다.");
				}
			},
			error: (error) => {
				console.log(error);
			}
		});
	});
	
	$("#updatePwd").on("click", () => {
		const url = "../member/updatePwd";
		const status = "left=500px,top=300px,width=500px,height=250px";
			
		open(url, "", status);
	});
	
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 탈퇴하시겠습니까?")){
			location.replace("../member/delete")
		}
	});
	
});

function enrollCheck(){
	var pass1 = document.getElementById("pass1");
	var pass2 = document.getElementById("pass2");
	var email = document.getElementById("email");
	var companyName = document.getElementById("companyName");
	var businessNo = document.getElementById("businessNo");
	var ceoName = document.getElementById("ceoName");
	var enrollAgree = document.getElementById("enrollAgree");
	var phone = document.getElementById("phone");
	var bNoReg = /^[0-9]{10}/g;
	var reg = /^[0-9]/g;
	
	if(pass1.value != pass2.value){
		alert("입력하신 비밀번호가 일치하지 않습니다.");
		pass2.focus();
		return false;
	}
	
	if(email.value == "") {
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	}
	
	if(!reg.test(phone.value)) {
		alert("전화번호는 숫자만 입력해주세요.");
		phone.focus();
		return false;
	}
	
	if(!bNoReg.test(businessNo.value)) {
		alert("사업자등록번호는 숫자 10자리를 입력해주세요.");
		businessNo.focus();
		return false;
	}
	
	if(companyName.value == "") {
		alert("회사명을 입력해주세요.");
		companyName.focus();
		return false;
	}
	
	if(ceoName.value == "") {
		alert("대표명을 입력해주세요.");
		ceoName.focus();
		return false;
	}
	
	if(!enrollAgree.checked) {
		alert("이용약관에 동의해주세요.");
		enrollAgree.focus();
		return false;
	}
	
}

function validate() {
	let newPass1 = $("#newPass1").val();
	let newPass2 = $("#newPass2").val();
			
	if(newPass1.trim() != newPass2.trim()){
		alert("비밀번호가 일치하지 않습니다.");
		$("#newPass1").val("");
		$("#newPass2").val("");
		$("#newPass1").focus();
				
		return false;
	}
}