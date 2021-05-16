<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <c:if test="${errors != null}">
                <div class="alert alert-danger" role="alert">
                    入力内容にエラーがあります。<br />
                    <c:forEach var="error" items="${errors}">
                        <c:out value="${error}" /><br />
                    </c:forEach>
                </div>
            </c:if>

            <div class="col-md-6">
                <label for="store_name">店名</label>
                <input type="text" class="form-control" name="store_name" placeholder="例: 天随飯店" value="${post.store_name}" required>
                <div class="invalid-feedback">
                    店名を入力してください。
                </div>
            </div>
            <br>

			<div class="col-md-6">
            <label for="evaluation">評価</label><br />
            <select name="evaluation">
                <option value="0" <c:if test="${post.evaluation == 0}"> selected</c:if>>選択してください</option>
                <option value="1" <c:if test="${post.evaluation == 1}">
                    </c:if>>⭐</option>
                <option value="2" <c:if test="${post.evaluation == 2}">
                    </c:if>>⭐⭐</option>
                <option value="3" <c:if test="${post.evaluation == 3}">
                    </c:if>>⭐⭐⭐</option>
                <option value="4" <c:if test="${post.evaluation == 4}">
                    </c:if>>⭐⭐⭐⭐</option>
                <option value="5" <c:if test="${post.evaluation == 5}">
                    </c:if>>⭐⭐⭐⭐⭐</option>
            </select>
            <br /><br />

            <input hidden id="user_name" value="${sessionScope.login_user.user_name}" />

            <label for="images1">写真その1</label><br />
            <div class="container page-header">
                <div class="col-sm-4">
                    <div class="imagePreview"></div>
                    <div class="input-group">
                        <label class="input-group-btn">
                            <span class="btn btn-primary">
                                Choose File<input type="file" id="images1" accept=".png, .jpg, .jpeg"
                                    style="display:none" class="uploadFile" onchange="uploadPhoto1()">
                            </span>
                        </label>
                        <input type="text" class="form-control" readonly>
                    </div>
                </div>
            </div>

            <label for="images2">写真その2</label><br />
            <div class="container page-header">
                <div class="col-sm-4">
                    <div class="imagePreview"></div>
                    <div class="input-group">
                        <label class="input-group-btn">
                            <span class="btn btn-primary">
                                Choose File<input type="file" id="images2" accept=".png, .jpg, .jpeg"
                                    style="display:none" class="uploadFile" onchange="uploadPhoto2()">
                            </span>
                        </label>
                        <input type="text" class="form-control" readonly>
                    </div>
                </div>
            </div>

            <input hidden id="photoUrl1" name="photoUrl1" />
            <input hidden id="photoUrl2" name="photoUrl2" />

            <div class="col-md-6">
                <label for="title">タイトル</label>
                <input type="text" class="form-control" name="title" placeholder="おすすめの担々麺!" value="${post.title}" required>
                <div class="invalid-feedback">
                    タイトルを入力してください。
                </div>
            </div>
            <br>

            <div class="col-md-6">
                <label for="content">内容</label>
                <textarea name="content" class="form-control" rows="10" cols="50">${post.content}</textarea>
            </div>
            <br>

			<div class="col-md-6">
            <input type="hidden" name="_token" value="${_token}" />
            <button class="form-control" type="submit" id="post">投稿</button>
            </div>
            <br>

            <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
            <script src='https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js'></script>
            <script src="/food_share_web/js/uploadPhoto.js"></script>