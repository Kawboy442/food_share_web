<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <c:import url="/WEB-INF/views/layout/app.jsp">
                <c:param name="content">
                    <c:if test="${flush != null}">
                        <div class="alert alert-primary" role="alert">
                            <c:out value="${flush}"></c:out>
                        </div>
                    </c:if>
                    <h2>自分の投稿一覧</h2>
                    <table id="post_list">
                        <tbody>
                            <tr>
                                <th class="post_store_name">店名</th>
                                <th class="post_created_at">投稿日時</th>
                                <th class="post_evaluation">評価</th>
                                <th class="post_title">タイトル</th>
                                <th class="post_photo">写真</th>
                                <th class="post_action">操作</th>
                            </tr>
                            <c:forEach var="post" items="${posts}" varStatus="status">
                                <tr class="row${status.count % 2}">
                                    <td class="post_store_name">
                                        <c:out value="${post.store_name}" />
                                    </td>
                                    <td class="post_created_at">
                                        <fmt:formatDate value='${post.created_at}' pattern='yyyy-MM-dd HH:mm' />
                                    </td>
                                    <td class="post_evaluation">
                                        <c:choose>
                                            <c:when test="${post.evaluation == 1}"><img src="<c:url value='/images/star.png'  />" height=25 /></c:when>
                                            <c:when test="${post.evaluation == 2}"><img src="<c:url value='/images/star_double.png'  />" height=25 />
                                            </c:when>
                                            <c:when test="${post.evaluation == 3}"><img src="<c:url value='/images/star_triple.png'  />" height=25 />
                                            </c:when>
                                            <c:when test="${post.evaluation == 4}"><img src="<c:url value='/images/star_fourfold.png'  />" height=25 />
                                            </c:when>
                                            <c:when test="${post.evaluation == 5}"><img src="<c:url value='/images/star_fivetimes.png'  />" height=25 />
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="post_title">${post.title}</td>
                                    <td class="post_photo"><img class="imgPreview" src="<c:url value=" ${post.photoUrl1} " />" /></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${post.delete_flag == 1}">
                                                （削除済み）
                                            </c:when>
                                            <c:otherwise>
                                                <a href="<c:url value='/posts/show?id=${post.id}' />">詳細を表示</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

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