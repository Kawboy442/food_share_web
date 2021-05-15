<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="/WEB-INF/views/layout/app.jsp">
            <c:param name="content">

                <body class="text-center">
                    <c:if test="${hasError}">
                        <div class="alert alert-danger" role="alert">
                            ユーザIDとパスワードが一致しません。
                        </div>
                    </c:if>
                    <c:if test="${flush != null}">
                        <div class="alert alert-primary" role="alert">
                            <c:out value="${flush}"></c:out>
                        </div>
                    </c:if>

                    <!-- レイアウト: https://loglog.xyz/programming/bootstrap_login -->
                    <!-- CSS: https://getbootstrap.jp/docs/4.3/examples/sign-in/ -->
                    <form class="form-signin" action="<c:url value='/login' />" method="post">
                    <h1 class="h3 mt-2 mb-3 font-weight-normal">ログイン</h1><br><br>
                        <label for="code" class="sr-only"></label>
                        <input class="form-control" id="username" type="text" name="user_name" value="${user_name}" placeholder="ユーザ名" required autofocus />
                        <label for="password" class="sr-only"></label>
                        <input class="form-control" id="password" type="password" name="password" placeholder="パスワード" required />
                        <input type="hidden" name="_token" value="${_token}" />
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    </form>
                </body>
            </c:param>
        </c:import>