<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ja">

        <head>
            <meta charset="UTF-8">
            <title>食べ物シェア</title>
            <meta name="viewport" content="width=device-width">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css" integrity="sha512-oc9+XSs1H243/FRN9Rw62Fn8EtxjEYWHXRvjS43YtueEewbS6ObfXcJNyohjHqVKFPoXXUxwc+q1K7Dee6vv9g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.css" integrity="sha512-Woz+DqWYJ51bpVk5Fv0yES/edIMXjj3Ynda+KWTIkGoynAMHrqTcDUQltbipuiaD5ymEo9520lyoVOo9jCQOCA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                                        <a class="nav-link" href="<c:url value='/develop' />">開発者モード</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<c:url value='/users/index' />">全ユーザー管理</a>
                                    </li>
                                </c:if>
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/posts/new' />">新規投稿</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/users/edit?id=${sessionScope.login_user.id}' />">ユーザー情報</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<c:url value='/posts/index?id=${sessionScope.login_user.id}' />">投稿一覧</a>
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
            <div class="text-center" id="footer">
                <span onclick="GuestLogin();">by</span> Ryosuke Ito.
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js" integrity="sha512-k2GFCTbp9rQU412BStrcD/rlwv1PYec9SNrkbQlo6RZCf75l6KcC3UwDY8H5n5hl4v77IDtIPwOk9Dqjs/mMBQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.min.js" integrity="sha512-8qmis31OQi6hIRgvkht0s6mCOittjMa9GMqtK9hes5iEQBQE/Ca6yGE5FsW36vyipGoWQswBj/QBm2JR086Rkw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="/food_share_web/js/guestLogin.js"></script>
        </body>

        </html>