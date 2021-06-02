<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>MINGW's Library</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles2.css" rel="stylesheet" />
</head>

<body>
    <!-- Responsive navbar-->
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg bg-light static-top ">
        <div class="container px-5">
            <a class="navbar-brand" href="/">MINGW's Library</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <%
					// 세션값 가져오기
					String id = (String) session.getAttribute("loginMemberName"); // Object 타입이므로 다운캐스팅
					if (id == null){%>
						<li class="nav-item"><a class="nav-link" href="/member/register">Register</a></li>
	                    <li class="nav-item"><a class="nav-link" href="/member/login">Login</a></li>
					<%}else{%>
						<li class="nav-item"><a class="nav-link" href="/member/my_page">MyPage</a></li>
                    <li class="nav-item"><a class="nav-link" href="/member/logout">Logout</a></li>
					<%}
					%>
   
                </ul>
            </div>
        </div>
    </nav>

    <!-- Navigation-->
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container">
                <a class="btn" style="background-color: #e3f2fd; color: dodgerblue;" href="/book/unified_search">자료 검색</a>

                <div class="dropdown show">
                    <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        신청 / 참여
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    	<%
						// 세션값 가져오기
						if (id == null){%>
							<a class="dropdown-item disabled" href="/member/member_hope">희망 도서 신청</a>
							<a class="dropdown-item" href="/board/unified_search">자유 게시판</a>
						<%}else{%>
							<a class="dropdown-item" href="/member/member_hope">희망 도서 신청</a>
							<a class="dropdown-item" href="/board/unified_search">자유 게시판</a>
						<%}
						%>
                    </div>
                </div>

                <div class="dropdown show">
                    <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        도서관 이용
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#">사서 추천 도서</a>
                        <a class="dropdown-item" href="#">신작 도서</a>
                    </div>
                </div>

                <div class="dropdown show">
                    <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        도서관 정보
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="/library_introduce">도서관 소개</a>
                        <a class="dropdown-item" href="/notice/unified_search">공지 사항</a>
                    </div>
                </div>
            </div>
        </nav>
    
    
    
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Heading Row-->

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">희망 도서 신청</h1>

                    <!--                    도서 목록-->
                    <div class="card mb-4">
                        <div class="card-body">현재 신청 하고자 하는 도서가 존재하는지 미리 확인하세요!</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i> 도서 목록
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>ISBN10</th>
                                        <th>제목</th>
                                        <th>저자</th>
                                        <th>출판사</th>
                                        <th>장르</th>
                                    </tr>
                                </thead>
                                <!-- <tfoot>
									<tr>
										<th>ISBN10</th>
										<th>제목</th>
										<th>저자</th>
										<th>출판사</th>
										<th>장르</th>
									</tr>
								</tfoot> -->
                                <tbody>
                                    <c:forEach var="bookDTO" items="${bookList}">
                                        <tr>
                                            <td>${bookDTO.bookISBN}</td>
                                            <td>${bookDTO.bookTitle}</td>
                                            <td>${bookDTO.bookAuthor}</td>
                                            <td>${bookDTO.bookPublisher}</td>
                                            <td>${bookDTO.bookGenre}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!--                도서 추가 파트-->
                <div class="container px-4 px-lg-5">
                    <div class="row justify-content-center">
                        <div class="card shadow-lg border-5 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">희망 도서 신청</h3>
                            </div>
                            <div class="card-body">
                                <form action="/member/member_hope" method="POST">

                                    <!--                                    ISBN10 & 제목-->
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputBookISBN" type="text" placeholder="ISBN 코드를 입력해주세요." name="inputBookISBN" /> <label for="inputBookISBN">ISBN10 코드</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                               <input class="form-control" id="inputBookTitle" type="text" placeholder="제목 명을 입력해주세요." name="inputBookTitle" /> <label for="inputBookTitle">도서 제목</label>
                                            </div>
                                        </div>
                                    </div>


                                    <!--                                    링크-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputBookLink" type="text" placeholder="해당 도서에 대한 링크를 입력해주세요." name="inputBookLink" /> <label for="inputBookLink">도서 링크</label>
                                    </div>
                                    


                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <input type="submit" class="btn btn-primary btn-block" value="해당 도서를 신청합니다." />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
            <!-- Footer-->
            <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                    <ul class="list-inline mb-2">
                        <li class="list-inline-item"><a href="#!">About</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">Contact</a></li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; MinGW's
						Library 2021. All Rights Reserved.</p>
                </div>
                <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item me-4"><a href="#!"><i class="bi-facebook fs-3"></i></a></li>
                        <li class="list-inline-item me-4"><a href="#!"><i class="bi-twitter fs-3"></i></a></li>
                        <li class="list-inline-item"><a href="#!"><i class="bi-instagram fs-3"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
				
				<!-- Bootstrap core JS-->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="js/scripts.js"></script>
			<!--    회원 정의 추가용-->
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>-->
			<!--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet" />-->

			<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">-->
			<!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->

			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="/js/scripts.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
				crossorigin="anonymous"></script>
			<script src="/js/dataTables.js"></script>
			<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
			<script
				src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
			<script
				src="https://cdn.datatables.net/fixedheader/3.1.8/js/dataTables.fixedHeader.min.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
				
				
        </div>
    </div>
</body>

</html>
