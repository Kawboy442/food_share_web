<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="../layout/app.jsp">
            <c:param name="content">
                <c:if test="${flush != null}">
                	<div class="alert alert-primary" role="alert">
                		<c:out value="${flush}"></c:out>
                	</div>
                </c:if>

                <div class="col-auto">
                <h2>ユーザー一覧</h2>
                <table class="table table-striped">
                	<thead class="thead-dark">
            			<tr><th>ユーザー名</th><th>操作</th></tr>
          			</thead>
                    <tbody>
                        <c:forEach var="user" items="${users}" varStatus="status">
                            <tr class="row${status.count % 2}">
                                <td>
                                    <c:out value="${user.user_name}" />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.delete_flag == 1}">
                                            <span class="text-danger">（削除済み）</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-outline-primary btn-sm" href="<c:url value='/users/show?id=${user.id}' />">詳細</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div id="pagination">
                    （全 ${users_count} 件）<br />
                    <c:forEach var="i" begin="1" end="${((users_count - 1) / 15) + 1}" step="1">
                        <c:choose>
                            <c:when test="${i == page}">
                                <c:out value="${i}" />&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/users/index?page=${i}' />">
                                    <c:out value="${i}" />
                                </a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <p><a href="<c:url value='/users/new' />">新規ユーザー登録</a></p>
                </div>

            </c:param>
        </c:import>