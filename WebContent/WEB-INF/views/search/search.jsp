<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
            <form method="POST" action="<c:url value='/search/result' />" id="search_form" name="search_form">
			<label for="store_name">店名</label><br />
			<input type="text" id="store_name" name="store_name"/>
			<br /><br />

			<label for="user_name">ユーザー名</label><br />
			<input type="text" id="user_name" name="user_name"/>
			<br /><br />

			<label for="evaluation">評価</label><br />
			<select id="user_name" id="evaluation" name="evaluation">
    			<option value="0"<c:if test="${post.evaluation == 0}"> selected</c:if>>選択してください</option>
    			<option value="1"<c:if test="${post.evaluation == 1}"> selected</c:if>>⭐</option>
    			<option value="2"<c:if test="${post.evaluation == 2}"> selected</c:if>>⭐⭐</option>
    			<option value="3"<c:if test="${post.evaluation == 3}"> selected</c:if>>⭐⭐⭐</option>
    			<option value="4"<c:if test="${post.evaluation == 4}"> selected</c:if>>⭐⭐⭐⭐</option>
    			<option value="5"<c:if test="${post.evaluation == 5}"> selected</c:if>>⭐⭐⭐⭐⭐</option>
			</select>
			<br /><br />

			<button type="submit" id="search_btn" disabled>検索</button>
		    </form>
    </c:param>
</c:import>