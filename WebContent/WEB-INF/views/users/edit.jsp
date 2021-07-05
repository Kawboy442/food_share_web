<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="/WEB-INF/views/layout/app.jsp">
            <c:param name="content">
                <c:choose>
                    <c:when test="${user.id != sessionScope.login_user.id && sessionScope.login_user.admin_flag == 0}">
                        <div class="alert alert-primary" role="alert">
                            異なるユーザー情報にはアクセスできません。
                        </div>
                    </c:when>
                    <c:when test="${user != null}">
                        <h2>${user.user_name}のユーザー情報編集ページ</h2>
                        <p>（パスワードは変更する場合のみ入力してください）</p>
                        <form method="POST" action="<c:url value='/users/update' />">
                            <c:if test="${errors != null}">
                                <div class="alert alert-danger" role="alert">
                                    入力内容にエラーがあります。<br />
                                    <c:forEach var="error" items="${errors}">
                                        <c:out value="${error}" /><br />
                                    </c:forEach>
                                </div>
                            </c:if>

                            <label for="thumbnail">ユーザー画像</label><br />
                            <div class="container page-header">
                                <div class="col-sm-6">
                                    <div class="thumbnailPreview" style="background-image:url(${user.thumbnailUrl});"></div>
                                    <div class="input-group">
                                        <label class="input-group-btn">
                                            <span class="btn btn-primary">
                                                Choose File<input type="file" id="thumbnailPhoto"
                                                    accept=".png, .jpg, .jpeg" style="display:none" class="uploadFile"
                                                    onchange="uploadthumbnail()">
                                            </span>
                                        </label>
                                        <input type="text" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>

                            <input hidden id="thumbnailUrl" name="thumbnailUrl" />

                            <div class="col-md-6">
                                <label for="username">ユーザー名</label>
                                <input type="text" class="form-control" name="user_name" placeholder="例: kawboy442" value="${user.user_name}" required>
                                <div class="invalid-feedback">
                                    ユーザー名を入力してください。
                                </div>
                            </div>
                            <br>

                            <div class="col-md-6">
                                <label for="password">パスワード</label>
                                <input type="password" class="form-control" name="password" required>
                                <div class="invalid-feedback">
                                    パスワードを入力してください。
                                </div>
                            </div>
                            <br>

                            <div class="col-md-6">
                                <label for="password_again">パスワード(再入力)</label>
                                <input type="password" class="form-control" name="password_again" required>
                                <div class="invalid-feedback">
                                    パスワードを入力してください。
                                </div>
                            </div>
                            <br>

                            <div class="col-md-6">
                                <input type="hidden" name="_token" value="${_token}" />
                                <button class="form-control" type="submit" id="post">変更</button>
                            </div>
                            <br>

                            <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
                            <script src='https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js'></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.1.7/chance.min.js" integrity="sha512-dELYIOEzIECWdvsEdoywFOB4qKDmtQee33yD0dQnzAE7eBGKJ984VQXRLs/vlsP4Sb3VchbQL7iAy4NWqetCsw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                            <script src="/food_share_web/js/uploadthumbnail.js"></script>
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