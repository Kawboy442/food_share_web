<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <c:if test="${errors != null}">
                <div id="flush_error">
                    入力内容にエラーがあります。<br />
                    <c:forEach var="error" items="${errors}">
                        ・
                        <c:out value="${error}" /><br />
                    </c:forEach>

                </div>
            </c:if>
            <label for="store_name">店名</label><br />
            <input type="text" name="store_name" value="${post.store_name}" />
            <br /><br />

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
                                    style="display:none" class="uploadFile" onchange="uploadPhoto1(this)">
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
                                    style="display:none" class="uploadFile" onchange="uploadPhoto1(this)">
                            </span>
                        </label>
                        <input type="text" class="form-control" readonly>
                    </div>
                </div>
            </div>

            <input hidden id="photoUrl1" name="photoUrl1" />
            <input hidden id="photoUrl2" name="photoUrl2" />

            <label for="title">タイトル</label><br />
            <input type="text" name="title" value="${post.title}" />
            <br /><br />

            <label for="content">内容</label><br />
            <textarea name="content" rows="10" cols="50">${post.content}</textarea>
            <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit" id="post">投稿</button>

            <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
            <script src='https://www.gstatic.com/firebasejs/8.3.2/firebase-storage.js'></script>
            <script src="/food_share_web/js/uploadPhoto.js"></script>