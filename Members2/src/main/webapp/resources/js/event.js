function play() {
		
		document.getElementById("display").style.display = "block";
		let name = [ "가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카",
				"타", "파", "하" ]
		let numbers = new Array(5); //랜덤 번호 5개를 저장할 배열을 선언

		for (let i = 0; i < numbers.length; i++) {
			let num = Math.floor(Math.random() * name.length); //랜덤번호
			numbers[i] = num;

			//중복 제거
			for (let j = 0; j < i; j++) {
				if (numbers[j] == numbers[i]) {
					i--;
				}
			}
		}
		
		let winners = new Array(5);
		for (let i = 0; i < winners.length; i++) {
			winners[i] = name[numbers[i]];
		}

		document.getElementById("display").innerHTML = winners;
		}