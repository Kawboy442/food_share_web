<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <c:import url="/WEB-INF/views/layout/app.jsp">
                <c:param name="content">
                    <form method="POST" action="<c:url value='/search/result' />" id="search_form" name="search_form">

                    <div class="col-md-6">
                        <label for="store_name">店名</label>
                        <input type="text" class="form-control" id="store_name" name="store" placeholder="例: 天随飯店" value="${post.store_name}">
                    </div>
                    <br>

                    <div class="col-md-6">
                        <label for="username">ユーザー名</label>
                        <input type="text" class="form-control" id="user_name" name="user" placeholder="例: kawboy442" value="${user.user_name}">
                    </div>
                    <br>

                    <div class="col-md-6">
                        <label for="evaluation">評価</label><br />
                        <select class="form-control" id="evaluation" name="evaluation">
                            <option value=0 <c:if test="${post.evaluation == 0}"> selected</c:if>>選択してください</option>
                            <option value=1 <c:if test="${post.evaluation == 1}">
                                </c:if>>⭐</option>
                            <option value=2 <c:if test="${post.evaluation == 2}">
                                </c:if>>⭐⭐</option>
                            <option value=3 <c:if test="${post.evaluation == 3}">
                                </c:if>>⭐⭐⭐</option>
                            <option value=4 <c:if test="${post.evaluation == 4}">
                                </c:if>>⭐⭐⭐⭐</option>
                            <option value=5 <c:if test="${post.evaluation == 5}">
                                </c:if>>⭐⭐⭐⭐⭐</option>
                        </select>
                    </div>
                    <br>

                    <div class="col-md-6">
                        <button class="form-control" type="submit" id="search_btn" disabled>検索</button>
                    </div>
                    <br>

                    <script src="/food_share_web/js/search.js"></script>
                    </form>
                </c:param>
            </c:import>