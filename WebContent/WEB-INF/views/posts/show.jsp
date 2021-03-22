<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${post != null}">
                <h2>タイトル: <c:out value="${post.title}" />の投稿詳細ページ</h2>
				<p hidden>"${post.id}"</p>
                <table>
                    <tbody>
                        <tr>
                            <th>店名</th>
                            <td><c:out value="${post.store_name}" /></td>
                        </tr>
                        <tr>
                            <th>投稿日時</th>
                            <td>
                            	<fmt:formatDate value="${post.created_at}" pattern="yyyy-MM-dd HH:mm" />
                            </td>
                        </tr>
                        <tr>
                            <th>評価</th>
                            <td>
                               <c:choose>
                                    <c:when test="${post.evaluation == 1}"><img src="<c:url value='/images/star.png'  />" height=30/></c:when>
                                    <c:when test="${post.evaluation == 2}"><img src="<c:url value='/images/star_double.png'  />" height=30/></c:when>
                                    <c:when test="${post.evaluation == 3}"><img src="<c:url value='/images/star_triple.png'  />" height=30/></c:when>
                                    <c:when test="${post.evaluation == 4}"><img src="<c:url value='/images/star_fourfold.png'  />" height=30/></c:when>
                                    <c:when test="${post.evaluation == 5}"><img src="<c:url value='/images/star_fivetimes.png'  />" height=30/></c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${post.title}" /></td>
                        </tr>
                        <tr>
                            <th>内容</th>
                            <td>
                                <pre><c:out value="${post.content}" /></pre>
                            </td>
                        </tr>
                    </tbody>
               </table>
			  <c:if test="${sessionScope.login_user != null}">
			  	<c:if test="${sessionScope.login_user.id == post.user.id}">
                	<p><a href="#" onclick="confirmDestroy();">この投稿を削除する</a></p>
                	<form method="POST" action="<c:url value='/posts/destroy' />">
                    	<input type="hidden" name="_token" value="${_token}" />
                    	<input type="hidden" name="id" value="${post.id}" />
                	</form>
                	<script>
                    	function confirmDestroy() {
                        	if(confirm("本当に削除してよろしいですか？")) {
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

        <p><a href="<c:url value="/posts/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>