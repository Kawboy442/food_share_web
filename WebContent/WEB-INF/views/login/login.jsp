<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="/WEB-INF/views/layout/app.jsp">
            <c:param name="content">
                <c:if test="${hasError}">
                    <div id="flush_error">
                        ユーザー名かパスワードが間違っています。
                    </div>
                </c:if>
                <c:if test="${flush != null}">
                    <div id="flush_success">
                        <c:out value="${flush}"></c:out>
                    </div>
                </c:if>
                <!-- レイアウト: https://loglog.xyz/programming/bootstrap_login -->
                <h1 class="h3 mt-2 mb-3 font-weight-normal">ログイン</h1>
                <form class="w-25 mx-auto" th:action="<c:url value='/login' />" method="post">
                    <label for="code" class="sr-only"></label>
                    <input class="form-control" id="username" type="text" name="user_name" value="${user_name}" placeholder="ユーザID" required autofocus />
                    <label for="password" class="sr-only"></label>
                    <input class="form-control" id="password" type="password" name="password" placeholder="パスワード" required />
                    <input type="hidden" name="_token" value="${_token}" />
                    <input class="btn btn-outline-primary my-1" type="submit" value="Sign In" />
                </form>
                </body>
            </c:param>
        </c:import>