<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
            <form method="POST" action="<c:url value='/search/result' />" id="search_form" name="search_form">
			<label for="store_name">店名</label><br />
			<input type="text" id="store_name" name="store"/>
			<br /><br />

			<label for="user_name">ユーザー名</label><br />
			<input type="text" id="user_name" name="user"/>
			<br /><br />

			<label for="evaluation">評価</label><br />
			<select id="evaluation" name="eval">
    			<option value="0"<c:if test="${post.evaluation == 0}">selected</c:if>>選択してください</option>
    			<option value="1"<c:if test="${post.evaluation == 1}"></c:if>>⭐</option>
    			<option value="2"<c:if test="${post.evaluation == 2}"></c:if>>⭐⭐</option>
    			<option value="3"<c:if test="${post.evaluation == 3}"></c:if>>⭐⭐⭐</option>
    			<option value="4"<c:if test="${post.evaluation == 4}"></c:if>>⭐⭐⭐⭐</option>
    			<option value="5"<c:if test="${post.evaluation == 5}"></c:if>>⭐⭐⭐⭐⭐</option>
			</select>
			<br /><br />

			<button type="submit" id="search_btn" disabled>検索</button>
			<script>
			//各種タグの取得
			const storeName = document.querySelector("#store_name");
			const userName = document.querySelector("#user_name");
			const evaluation = document.querySelector("#evaluation");
			const button = document.querySelector("#search_btn");

			storeName.addEventListener('keydown', () => {
				button.disabled = false
			});

			userName.addEventListener('keydown', () => {
				button.disabled = false
			});

			evaluation.addEventListener('change', function () {
				  const form = document.search_form.evaluation;
				  const options = evaluation.selectedIndex;
				  const value = form.options[options].value;
				  if(value != 0) {
					  button.disabled = false
				  }
			});
			</script>
		    </form>
    </c:param>
</c:import>