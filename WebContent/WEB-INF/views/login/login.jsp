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
                        <a href="mailto:kawboy442@gmail.com?subject=%E3%83%91%E3%82%B9%E3%83%AF%E3%83%BC%E3%83%89%E5%86%8D%E8%A8%AD%E5%AE%9A%E3%81%AE%E5%95%8F%E3%81%84%E5%90%88%E3%82%8F%E3%81%9B&amp;body=%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E5%90%8D%E3%82%92%E8%A8%98%E5%85%A5%E3%81%97%E3%81%A6%E9%80%81%E4%BF%A1%E3%81%97%E3%81%A6%E3%81%8F%E3%81%A0%E3%81%95%E3%81%84%E3%80%82%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E5%90%8D%3A%20">パスワードを忘れた場合はこちらへ</a>
                    </form>
                </body>
            </c:param>
        </c:import>