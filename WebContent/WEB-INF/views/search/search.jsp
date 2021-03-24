<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>食べ物シェア</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <script type='text/javascript' src='//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js?ver=1.11.3'></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="header_menu">
                    <h1><a href="<c:url value='/' />">食べ物シェア</a></h1>&nbsp;&nbsp;&nbsp;
                    <a href="<c:url value='/search' />">検索</a>&nbsp;
                    <c:if test="${sessionScope.login_user != null}">
                    	<c:if test="${sessionScope.login_user.admin_flag == 1}">
                        	<a href="<c:url value='/users/index' />">ユーザー管理</a>&nbsp;
                        </c:if>
                        <a href="<c:url value='/users/edit?id=${sessionScope.login_user.id}' />">ユーザー情報管理</a>
                        <a href="<c:url value='/posts/index' />">投稿管理</a>&nbsp;
                    </c:if>
                </div>
                <c:if test="${sessionScope.login_user != null}">
                    <div id="right_header_menu">
                        <c:out value="${sessionScope.login_user.user_name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">ログアウト</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.login_user == null}">
                    <div id="right_header_menu">
                    	<a href="<c:url value='/users/new' />">会員登録</a>
                        <a href="<c:url value='/login' />">ログイン</a>
                    </div>
                </c:if>
            </div>
            <div id="content">
            <form method="POST" action="<c:url value='/search/result' />">
			<label for="store_name">店名</label><br />
			<input type="text" name="store_name" value="${post.store_name}" />
			<br /><br />

			<label for="user_name">ユーザー名</label><br />
			<input type="text" name="user_name" value="${post.user_name}" />
			<br /><br />

			<label for="evaluation">評価</label><br />
			<select name="evaluation">
    			<option value="0"<c:if test="${post.evaluation == 0}"> selected</c:if>>選択してください</option>
    			<option value="1"<c:if test="${post.evaluation == 1}"> selected</c:if>>⭐</option>
    			<option value="2"<c:if test="${post.evaluation == 2}"> selected</c:if>>⭐⭐</option>
    			<option value="3"<c:if test="${post.evaluation == 3}"> selected</c:if>>⭐⭐⭐</option>
    			<option value="4"<c:if test="${post.evaluation == 4}"> selected</c:if>>⭐⭐⭐⭐</option>
    			<option value="5"<c:if test="${post.evaluation == 5}"> selected</c:if>>⭐⭐⭐⭐⭐</option>
			</select>
			<br /><br />

			<button type="submit">検索</button>
		    </form>
            </div>
            <div id="footer">
                by Ryosuke Ito.
            </div>
        </div>
    </body>
</html>