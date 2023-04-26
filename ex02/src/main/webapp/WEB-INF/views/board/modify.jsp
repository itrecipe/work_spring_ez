<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>modify</title>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=chrome"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>

</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="container mt-4 mb-4" id="mainContent">
		<div class="col-md-2">
		<h4 class="wordArtEffect text-success pl-4">메뉴</h4>
			<nav class="navbar bg-dark navbar-dark container">
				<!-- RWD의 화면 축소시 나타나는 메뉴 버튼(상병 계급장 모양) -->
				<!-- d-md-none은 메뉴가 감춰지지 않고 펼쳐지는 것을 예방한다. -->
				<button class="navbar-toggler d-md-none" type="button" data-toggle="collapse"
				data-target="#collapsibleVertical">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse babvar-collapese d-md-block" id="collapsibleVertical">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="#">
								<i class="fas fa-home" style="font-size: 30px; color: white;"></i>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="list">게시판 목록</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="col-md-10">
			<div id="submain">
				<h4 class="text-center wordArtEffect text-success">게시글 수정</h4>
				<form id="mform" name="mform" action="modify" method="post">
					<div class="form-group">
						<label for="bno">번호 : </label>
						<input type="text" class="form-control" id="bno" name="bno" readonly value='<c:out value="${board.bno}"/>'/>
					</div>
					<div class="form-group">
						<label for="title">제목 : </label>
						<input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.title}"/>'/>
					</div>
					<div class="form-group">
						<label for="content">내용 : </label>
						<textarea class="form-control" id="content" name="content" rows="10">
							<c:out value="${board.content}"/>
						</textarea>
					</div>
					<div class="form-group">
						<label for="writer">작성자 : </label>
						<input type="text" class="form-control" id="writer" name="writer" value='<c:out value="${board.writer}"/>'/>
					</div>
					<div class="form-group">
						<label for="regDate">게시일 : </label>
						<input type="text" class="form-control" id="regDate" name="regDate"
						 	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regDate}" />' readonly/>
					</div>
					<div class="form-group">
						<label for="updateDate">수정일 : </label>
						<input type="text" class="form-control" id="updateDate" name="updateDate"
						 	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />' readonly/>
					</div>
					<button type="submit" data-oper="modify" class="btn btn-info">수정</button>&nbsp;&nbsp;
					<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>&nbsp;&nbsp;
					<button type="submit" data-oper="list" class="btn btn-success">목록</button>
				</form>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>

<script>
$(function(){
	let formObj = ${"#mform"};
	
	$("button").on("click", function(e) {
		e.preventDefault(); //이벤트가 일어난 버튼의 기본 동작을 제거한다.
		let operation = $(this).data("oper");
		//data(data-의 뒷이름) 메서드는 속성이 html5에서 새롭게 추가된 data-속성값을 참조하여 값을 반환한다.
		console.log("operation : " + operation);
		if(operation == "remove") {
			formObj.attr("action", "remove");
		}
		else if(operation == "list") {
			formObj.attr("action", "list").attr("method", "get");
			formObj.empty(); //formObj의 자식 엘리먼트를 모두 제거한다.
		}
		formObj.submit();
	});
});
</script>
</body>
</html>