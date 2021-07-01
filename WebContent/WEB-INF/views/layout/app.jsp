<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ja">

        <head>
            <meta charset="UTF-8">
            <title>食べ物シェア</title>
            <meta name="viewport" content="width=device-width">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
            <link rel="stylesheet" href="<c:url value='/css/lightbox.min.css' />">
            <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
            <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        </head>

        <body class="text-left">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand " href="<c:url value='/' />">食べ物シェア</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/search' />">検索</a>
                            </li>
                            <c:if test="${sessionScope.login_user != null}">
                                <c:if test="${sessionScope.login_user.admin_flag == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<c:url value='/users/index' />">ユーザー管理</a>
                                    </li>
                                </c:if>
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/users/edit?id=${sessionScope.login_user.id}' />">ユーザー情報管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/posts/index?id=${sessionScope.login_user.id}' />">投稿管理</a>
                                </li>
                            </c:if>
                        </ul>

                        <ul class="navbar-nav">
                            <c:if test="${sessionScope.login_user != null}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <c:out value="${sessionScope.login_user.user_name}" />さん
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="<c:url value='/logout' />">ログアウト</a>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.login_user == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/users/new' />">会員登録</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/login' />">ログイン</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Ryosuke Ito.
            </div>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
            <script src="/food_share_web/js/lightbox.min.js"></script>
        </body>

        </html>