<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <c:import url="/WEB-INF/views/layout/app.jsp">
                <c:param name="content">
                    <c:choose>
                        <c:when test="${post != null}">
                            <p hidden>"${post.id}"</p>
                            <div class="twitter__container">
                                <div class="twitter__block">
                                    <figure>
                                        <c:if test="${post.user.thumbnailUrl == null}">
                                            <img src="<c:url value='/images/thumbnail/human.png'/>" />
                                        </c:if>
                                        <c:if test="${post.user.thumbnailUrl != null}">
                                            <a href="<c:url value='/posts/index?id=${post.user.id}' />"><img
                                                    src="<c:url value=" ${post.user.thumbnailUrl} " />" /></a>
                                        </c:if>
                                    </figure>
                                    <div class="twitter__block-text">
                                        <div class="name">
                                            <a href="<c:url value='/posts/show?id=${post.id}' />">
                                                <c:out value="${post.store_name}" />
                                            </a>
                                            <c:choose>
                                                <c:when test="${post.evaluation == 1}"><img src="<c:url value='/images/star/star.png'  />" height=12 />
                                                </c:when>
                                                <c:when test="${post.evaluation == 2}"><img src="<c:url value='/images/star/star_double.png'  />" height=12 />
                                                </c:when>
                                                <c:when test="${post.evaluation == 3}"><img src="<c:url value='/images/star/star_triple.png'  />" height=12 />
                                                </c:when>
                                                <c:when test="${post.evaluation == 4}"><img src="<c:url value='/images/star/star_fourfold.png'  />" height=12 />
                                                </c:when>
                                                <c:when test="${post.evaluation == 5}"><img src="<c:url value='/images/star/star_fivetimes.png'  />" height=12 />
                                                </c:when>
                                            </c:choose>
                                            <span class="name_reply"><a
                                                    href="<c:url value='/posts/index?id=${post.user.id}' />">@
                                                    <c:out value="${post.user.user_name}" />
                                                </a></span>
                                        </div>
                                        <div class="date">
                                            <%@ page import="utils.TimestampUtil" %>
                                                <%@ page import="models.Post" %>

                                                    <% String format="yyyy年MM月dd日 HH時mm分" ; Post
                                                        post=(Post)(pageContext.findAttribute("post")); String
                                                        postDateDisplay=TimestampUtil.timestampToString(post.getCreated_at(),
                                                        format); %>
                                                        <%= postDateDisplay %>
                                        </div>
                                        <div class="text">
                                            <c:out value="${post.content}" />
                                        </div>
                                        <div class="in-pict">
                                            <c:if test="${post.photoUrl1 != null}">
                                                <a href="<c:url value=" ${post.photoUrl1} " />" data-lightbox="${post.id}" data-title="${post.title}"><img
                                                        src="<c:url value=" ${post.photoUrl1}" />"></a>
                                            </c:if>
                                            <c:if test="${post.photoUrl2 != null}">
                                                <a href="<c:url value=" ${post.photoUrl2} " />" data-lightbox="${post.id}" data-title="${post.title}"><img
                                                        src="<c:url value=" ${post.photoUrl2}" />"></a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${sessionScope.login_user != null}">
                                <c:if test="${sessionScope.login_user.id == post.user.id}">
                                    <p><a href="#" onclick="confirmDestroy();">この投稿を削除する</a></p>
                                    <form method="POST" action="<c:url value='/posts/destroy' />">
                                        <input type="hidden" name="_token" value="${_token}" />
                                        <input type="hidden" name="id" value="${post.id}" />
                                    </form>
                                    <script>
                                        function confirmDestroy() {
                                            if (confirm("本当に削除してよろしいですか？")) {
                                                document.forms[0].submit();
                                            }
                                        }
                                    </script>
                                </c:if>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h2>お探しのデータは見つかりませんでした。</h2>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${sessionScope.login_user.id == post.user.id}">
                        <p><a href="<c:url value="/posts/index?id=${sessionScope.login_user.id}"/>">自分の投稿一覧に戻る</a></p>
                    </c:if>
                    <c:if test="${sessionScope.login_user.id != post.user.id}">
                        <p><a href="<c:url value="/posts/index?id=${post.user.id}"/>">ユーザーのタイムラインに戻る</a></p>
                    </c:if>
                    <p><a href="<c:url value="/index.html"/>">トップに戻る</a></p>
                </c:param>
            </c:import>