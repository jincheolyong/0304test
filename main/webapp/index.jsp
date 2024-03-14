<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>my web</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/ie.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .jumbotron {
            position: relative;
            background: url('img/visual.jpg') no-repeat center center;
            background-size: cover;
            color: #fff;
            padding: 100px 0;
            overflow: hidden;
        }
        .jumbotron video {
            position: absolute;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
        }
        .jumbotron h1 {
            font-size: 2.5rem; /* 변경된 부분: 글꼴 크기를 2.5rem으로 줄임 */
        }
        .jumbotron p {
            font-size: 1rem; /* 변경된 부분: 글꼴 크기를 1rem으로 줄임 */
        }
        .card {
            border: none;
            transition: all 0.3s;
            height: 100%;
        }
        .card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-title{
            text-align: center;
            font-size: 1.2rem;
        }
        .card-text {
            text-align: center;
            font-size: 0.8rem; /* 변경된 부분: 카드의 제목과 텍스트 크기를 1.1rem으로 조정 */
        }
        .card-text {
            margin-top: 10px;
        }
    </style>
      <script>
    function LoginButton() {
        var loginButton = document.getElementById('loginButton');
       // var joinButton = document.getElementById('joinButton');
        
        <% if (session.getAttribute("MEMBERID") != null && !session.getAttribute("MEMBERID").equals("")) { %>
            // 세션에 정보가 있는 경우
            loginButton.innerHTML = 'LogOut';
            loginButton.onclick = logout; //logout
        <% } else { %>
            // 세션에 정보가 없는 경우
            loginButton.innerHTML = 'LogIn';
            loginButton.href = 'sessionLoginForm.jsp'; 
        <% } %>
    }

    // 새로고침시 LoginButton 메소드 호출
    window.onload = LoginButton;

    function logout() {
        fetch('sessionLogout.jsp').then(response => {
                if (response.ok) {
                    window.location.reload();
                } else {
                    console.error('로그아웃 실패');
                }
            })
            
    }
</script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">DCODLAB</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">DEPARTMENT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">GALLERY</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">YOUTUBE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">COMMUNITY</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blist.jsp">BOARD</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" id="loginButton" href="sessionLoginForm.jsp" onclick="login()">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="logoutButton" href="sessionLogout.jsp" onclick="logout()" style="display: none;">Log Out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="memberForm.jsp">Join</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="list.jsp">Member Management</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


    <section class="jumbotron text-center">
        <video src="img/visual.mp4" autoplay muted loop></video>
        <div class="container">
            <h1 class="display-3">INNOVATION</h1>
            <p class="lead">We are a company that leads the future with innovative thinking and ideas. We provide new value to our customers and lead continuous growth.</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">RECENT NEWS</h2>
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="img/news1.jpg" class="card-img-top" alt="1st content image">
                        <div class="card-body">
                            <h5 class="card-title"><a href="#">Supporting customer success with our passion and technology.</a></h5>
                            <p class="card-text">We are a company that strives for the success of our customers with passionate teams and state-of-the-art technology.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="img/news2.jpg" class="card-img-top" alt="2nd content image">
                        <div class="card-body">
                            <h5 class="card-title"><a href="#">Providing technology and services that change the world.</a></h5>
                            <p class="card-text">We are a company that provides technology and services that change the world by leading change.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="img/news3.jpg" class="card-img-top" alt="3rd content image">
                        <div class="card-body">
                            <h5 class="card-title"><a href="#">Leading the global market with quality and innovation.</a></h5>
                            <p class="card-text">We are a company that leads the global market based on quality and innovation.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="img/news4.jpg" class="card-img-top" alt="4th content image">
                        <div class="card-body">
                            <h5 class="card-title"><a href="#">Making the world a better place with trust and creativity.</a></h5>
                            <p class="card-text">We are a company that strives to make the world a better place based on trust and creativity.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark text-white py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>DCODELAB</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Policy</a></li>
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Family Site</a></li>
                        <li><a href="#">Sitemap</a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <address>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas, facere.<br>
                        TEL : 031-111-1234 C.P : 010-1234-5678
                    </address>
                    <p>2020 DOCDELAB &copy; copyright all right reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>






