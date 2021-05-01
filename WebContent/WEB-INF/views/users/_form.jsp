<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${errors != null}">
            <div id="flush_error">
                入力内容にエラーがあります。<br />
                <c:forEach var="error" items="${errors}">
                    ・
                    <c:out value="${error}" /><br />
                </c:forEach>
            </div>
        </c:if>

        <label for="thumbnail">ユーザー画像</label><br />
        <input type="file" id="thumbnailPhoto" accept=".png, .jpg, .jpeg" onchange="uploadthumbnail(this)" onclick="this.value = '';" />
        <br /><br />

        <img id="thumbnail" class="imgPreview">
        <br /><br />

        <input hidden id="thumbnailUrl" name="thumbnailUrl" />

        <label for="username">ユーザー名</label><br />
        <input type="text" name="user_name" value="${user.user_name}" />
        <br /><br />

        <label for="password">パスワード</label><br />
        <input type="password" name="password" />
        <br /><br />

        <label for="password_again">パスワード(再入力)</label><br />
        <input type="password" name="password_again" />
        <br /><br />

        <input type="hidden" name="_token" value="${_token}" />
        <button type="submit">作成/変更</button>

        <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
        <script src='https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js'></script>
        <script src="/food_share_web/js/uploadthumbnail.js"></script>