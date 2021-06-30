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
                                <img src="<c:url value=" ${post.user.thumbnailUrl} " />" />
                            </figure>
                            <div class="twitter__block-text">
                                <div class="name">
                                    <c:out value="${post.store_name}" /><span class="name_reply">@<c:out value="${post.user.user_name}" /></span>
                                </div>
                                <div class="date">1時間前</div>
                                <div class="text">
                                    <c:out value="${post.content}" />
                                    <div class="in-pict">
                                    	<c:if test="${post.photoUrl1 != null}">
                                        	<img src="<c:url value=" ${post.photoUrl1} " />" />
                                        </c:if>
                                        <c:if test="${post.photoUrl2 != null}">
                                        	<img src="<c:url value=" ${post.photoUrl2} " />" />
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