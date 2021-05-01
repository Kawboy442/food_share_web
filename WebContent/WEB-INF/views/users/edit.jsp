<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="/WEB-INF/views/layout/app.jsp">
            <c:param name="content">
                <c:choose>
                    <c:when test="${user.id != sessionScope.login_user.id && sessionScope.login_user.admin_flag == 0}">
                        <h2>異なるユーザー情報にはアクセスできません。</h2>
                    </c:when>
                    <c:when test="${user != null}">
                        <h2>${user.user_name}のユーザー情報編集ページ</h2>
                        <p hidden>${user.id} </p>
                        <p hidden>${sessionScope.login_user.id} </p>
                        <p>（パスワードは変更する場合のみ入力してください）</p>
                        <form method="POST" action="<c:url value='/users/update' />">
                            <c:import url="_form.jsp" />
                        </form>

                        <p><a href="#" onclick="confirmDestroy();">このユーザーを削除する</a></p>
                        <form method="POST" action="<c:url value='/users/destroy' />">
                            <input type="hidden" name="_token" value="${_token}" />
                        </form>
                        <script>
                            function confirmDestroy() {
                                if (confirm("本当に削除してよろしいですか？")) {
                                    document.forms[1].submit();
                                }
                            }
                        </script>
                    </c:when>
                    <c:otherwise>
                        <h2>お探しのデータは見つかりませんでした。</h2>
                    </c:otherwise>
                </c:choose>

                <p><a href="<c:url value='/index.html' />">トップに戻る</a></p>
            </c:param>
        </c:import>