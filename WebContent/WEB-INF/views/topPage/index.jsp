<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <c:import url="../layout/app.jsp">
                <c:param name="content">
                    <c:if test="${flush != null}">
                        <div class="alert alert-primary" role="alert">
                            <c:out value="${flush}"></c:out>
                        </div>
                    </c:if>
                    <c:forEach var="post" items="${posts}" varStatus="status">
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
                                            <c:when test="${post.evaluation == 1}"><img src="<c:url value='/images/star/star.png'  />" height=12 /></c:when>
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
                                                <%@ page import="java.time.LocalDateTime" %>
                                                    <%@ page import="java.sql.Timestamp" %>

                                                        <% String format="yyyy-MM-dd HH:mm:ss.S" ; String
                                                            today=TimestampUtil.localDateTimeToString(LocalDateTime.now(),
                                                            format); Post
                                                            post=(Post)(pageContext.findAttribute("post")); String
                                                            postDate=TimestampUtil.timestampToString(post.getCreated_at(),
                                                            format); String timeDiff=TimestampUtil.TimestampDiff(today,
                                                            postDate, format); %>
                                                            <%= timeDiff %>
                                    </div>
                                    <div class="text">
                                        <c:out value="${post.content}" />
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
                        </div>
                    </c:forEach>


                    <div id="pagination">
                        （全 ${posts_count} 件）<br />
                        <c:forEach var="i" begin="1" end="${((posts_count - 1) / 15) + 1}" step="1">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/posts/index?page=${i}' />">
                                        <c:out value="${i}" />
                                    </a>&nbsp;
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <p><a href="<c:url value='/posts/new' />">新規投稿</a></p>
                </c:param>
            </c:import>