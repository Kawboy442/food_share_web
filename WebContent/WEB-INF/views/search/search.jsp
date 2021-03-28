<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
            <form method="POST" action="<c:url value='/search/result' />" id="search_form" name="search_form">
			<label for="store_name">店名</label><br />
			<input type="text" name="store_name" value="${post.store_name}" id="store_name" name="store_name"/>
			<br /><br />

			<label for="user_name">ユーザー名</label><br />
			<input type="text" name="user_name" value="${post.user_name}" id="user_name" name="user_name"/>
			<br /><br />

			<label for="evaluation">評価</label><br />
			<select id="user_name" name="evaluation">
    			<option value="0"<c:if test="${post.evaluation == 0}"> selected</c:if>>選択してください</option>
    			<option value="1"<c:if test="${post.evaluation == 1}"> selected</c:if>>⭐</option>
    			<option value="2"<c:if test="${post.evaluation == 2}"> selected</c:if>>⭐⭐</option>
    			<option value="3"<c:if test="${post.evaluation == 3}"> selected</c:if>>⭐⭐⭐</option>
    			<option value="4"<c:if test="${post.evaluation == 4}"> selected</c:if>>⭐⭐⭐⭐</option>
    			<option value="5"<c:if test="${post.evaluation == 5}"> selected</c:if>>⭐⭐⭐⭐⭐</option>
			</select>
			<br /><br />
			<script>
			$(function(){
				// 1.フォーム要素の取得
				var search_form = $("#search_form");
				// 2.フォームのsubmitイベントを取得
				search_form.submit(function(){
					// 3.入力されているキーワードを取得し、正規表現により未入力かどうかを判別する
					var storeName = $('input[id=store_name]').val();
					var userName = $('input[id=user_name]').val();
					var evaluation = $('input[id=evaluation]').val();
					if(storeName.match(/^[ 　\r\n\t]*$/) && userName.match(/^[ 　\r\n\t]*$/) && evaluation == 0){
						return false;
					}
				});
			});
			</script>

			<button type="submit">検索</button>
		    </form>
    </c:param>
</c:import>