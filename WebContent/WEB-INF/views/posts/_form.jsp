<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="store_name">店名</label><br />
<input type="text" name="store_name" value="${post.store_name}" />
<br /><br />

<label for="evaluation">評価</label><br />
<select name="evaluation">
    <option value="0"<c:if test="${post.evaluation == 0}"> selected</c:if>>選択してください</option>
    <option value="1"<c:if test="${post.evaluation == 1}"> selected</c:if>>評価: 1</option>
    <option value="2"<c:if test="${post.evaluation == 2}"> selected</c:if>>評価: 2</option>
    <option value="3"<c:if test="${post.evaluation == 3}"> selected</c:if>>評価: 3</option>
    <option value="4"<c:if test="${post.evaluation == 4}"> selected</c:if>>評価: 4</option>
    <option value="5"<c:if test="${post.evaluation == 5}"> selected</c:if>>評価: 5</option>
</select>
<br /><br />

<label for="title">タイトル</label><br />
<input type="text" name="title" value="${post.title}" />
<br /><br />

<label for="content">内容</label><br />
<textarea name="content" rows="10" cols="50">${post.content}</textarea>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>