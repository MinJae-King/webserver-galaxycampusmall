function validateJoinForm() {
	const form = document.forms["joinForm"];
	const id = form["id"].value.trim();
	const password = form["password"].value.trim();
	const name = form["name"].value.trim();
	const email = form["email"].value.trim();

	if (!id || !password || !name || !email) {
		alert("모든 항목을 입력해주세요.");
		return false;
	}

	if (password.length < 6) {
		alert("비밀번호는 6자 이상이어야 합니다.");
		return false;
	}

	// 이메일이 @skuniv.ac.kr로 끝나는지 확인
	const skunivRegex = /^[^\s@]+@skuniv\.ac\.kr$/;
	if (!skunivRegex.test(email)) {
		alert("이메일은 '@skuniv.ac.kr' 형식으로 입력해주세요.");
		return false;
	}

	return true;
}
