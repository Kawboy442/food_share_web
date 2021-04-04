<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>新規投稿ページ</h2>

        <form method="POST" action="<c:url value='/posts/create' />">
            <c:import url="_form.jsp" />
            <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
            <script src='https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js'></script>
 			<script src="/food_share_web/js/photoUpload.js"></script>
        </form>

        <p><a href="<c:url value='/posts/index' />">投稿一覧に戻る</a></p>
    </c:param>
</c:import>