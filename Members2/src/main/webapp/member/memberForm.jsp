<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script type="text/javascript">
	function checkID(){
		//alert("test");
		let memberId = $('#memberId').val();
		if(memberId === ""){
			alert("아이디를 입력해주세요");
			return false;
		}
		$.ajax({
			type: "post", 
			url: "checkid",
			dataType: "text",
			data: {id: memberId},	//서블릿으로 id를 보냄
			success: function(data){
				console.log(data);
				console.log($('#btnChk').val());
				if($.trim(data) == "usable"){	//trim()은 앞뒤 공백 제거(필수)
					
					$('#btnChk').attr('value', 'Y');	//중복 버튼을 누름
					$('#check').text("사용가능한 ID입니다.")
							   .css({'color': 'red', 'padding-top': '5px'})
				} else{
					$('#check').text("이미 가입된 ID입니다.")
							   .css({'color': 'red', 'padding-top': '5px'})
				}
			},
			error: function(){
				alert("에러 발생!");	
			}
		});
		
	}
	
	function checkMember(){
		//alert("test");
		let form = document.member;
		let id = form.memberId.value;
		let pw1 = form.passwd1.value;
		let pw2 = form.passwd2.value;
		let name = form.name.value;
		let btnChk = form.btnChk.value;	//'Y' or 'N'
		
		//정규표현식
		let pw_pat1 = /[0-9]+/	//숫자만
		let pw_pat2 = /[a-zA-Z]+/	//영어만
		let pw_pat3 = /[~!@#$%^&*()_=]+/	//특수문자만
		let pw_pat4 = /[가-힣]+/		//한글만
		
		if(id.length < 4 || id.length > 15){
			alert("아이디는 4~15자까지 입력 가능합니다.");
			form.id.focus();
			return false;
		} else if(pw1.length < 8 || !pw_pat1.test(pw1) || !pw_pat2.test(pw1) || !pw_pat3.test(pw1)){
			alert("비밀번호는 영문자,숫자,특수문자 포함 8자 이상입니다.");
			form.pw1.focus();
			return false;
		} else if(pw1 != pw2){
			alert("비밀번호가 일치하지 않습니다.");
			form.pw2.focus();
			return false;
		} else if(name=="" ||pw_pat1.test(name) || pw_pat3.test(name)){
			alert("이름은 한글과 영어만 가능합니다.(자음,모음 X)");
			form.name.focus();
			return false;
		} else if(btnChk == 'N'){
			alert("아이디 중복을 확인해 주세요.");
			return false;
		}
			
		else{
			form.submit();
			
		}
		
	}

</script>
</head>
<body>
<jsp:include page="../header.jsp" />
   <div id="container">
      <section id="register">
         <h2>회원 가입</h2>
         <form action="/addMember.do" method="post" name="member">
            <fieldset>
               <ul>
                  <li>
                     <label for="memberId">아이디 </label>
                     <input type="text" id="memberId" name="memberId"
                     		placeholder="아이디는 4~15자까지 입력 가능합니다">
                     <button type="button" onclick="checkID()" id="btnChk" value="N" class="btn_check">중복체크</button>
                     <p id="check"></p>
                  </li>
                  <li>
                     <label for="passwd1">비밀번호</label>
                     <input type="password" id="passwd1" name="passwd1"
                     		placeholder="영문자,숫자,특수문자 포함 8자 이상입니다">
                  </li>
                  <li>
                     <label for="passwd2">비밀번호 확인</label>
                     <input type="password" id="passwd2" name="passwd2"
                     		placeholder="다시 한번 입력해 주세요">
                  </li>
                  <li>
                     <label for="name">이름 </label>
                     <input type="text" id="name" name="name"
                     		placeholder="한글과 영어만 가능합니다(자음,모음 X)">
                  </li>
                  <li>
                     <label for="gender">성별</label>
                     <label class="radio">
                        <input type="radio" name="gender" value="남" checked>남   
                     </label>
                     <label class="radio">
                        <input type="radio" name="gender" value="여">여
                     </label>               
                  </li>                  
               </ul>
            </fieldset>
            <div class="button">
               <input type="button" value="가입하기" onclick="checkMember()">
               <input type="reset" value="취소">
            </div>
         </form>
      </section>
   </div>
	<jsp:include page="../footer.jsp" />
</body>
</html>