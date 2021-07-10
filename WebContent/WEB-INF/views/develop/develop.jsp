<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:import url="/WEB-INF/views/layout/app.jsp">
            <c:param name="content">
                <dl>
                    <dt>Servlet Engine</dt>
                    <dd>
                        <%= session.getServletContext().getMajorVersion() %>.
                            <%= session.getServletContext().getMinorVersion() %>
                    </dd>
                    <dt>JSP Engine</dt>
                    <dd>
                        <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
                    </dd>
                    <dt>Application Server</dt>
                    <dd>
                        <%= application.getServerInfo() %>
                    </dd>
                </dl>
            </c:param>
        </c:import>