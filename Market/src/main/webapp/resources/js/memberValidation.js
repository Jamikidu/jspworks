function checkMember(){
		//alert("test");
		let form = document.newMember;
		let id = form.mid.value;
		let pw1 = form.passwd1.value;
		let pw2 = form.passwd2.value;
		let name = form.mname.value;
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
			form.mname.focus();
			return false;
		} else if(btnChk == 'N'){
			alert("아이디 중복을 확인해 주세요.");
			return false;
		}
			
		else{
			form.submit();
			
		}
		
	}
	