<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<title>User list</title>
<jsp:include page="../header.jsp"/>

<body>
    <jsp:include page="../navigation.jsp"/>
    <div class="container xd-container">
        <spring:url value="/users" var="findUsers"/>
        <form:form modelAttribute="user" action="${findUsers}" method="get" class="form-horizontal"
                           id="search-user-form">
            <div>
                <div>
                    <label for="userName">Last name </label>
                    <form:input class="form-control" path="lastName" size="30" maxlength="80" id="userName"/>
                    <span class="help-inline"><form:errors path="*"/></span>
                </div>
                <div>
                <label for="userGroup">Group name </label>
                    <form:input class="form-control" path="group.name" size="30" maxlength="80"   id = "userGroup"/>
                    <span class="help-inline"><form:errors path="*"/></span>
                </div>
            </div>
            <div>
                <div>
                    <button class="btn btn-default" type="submit">Find users</button>
                    <a class="btn btn-default" href='<spring:url value="/users/add" htmlEscape="true"/>'>Add User</a>
                </div>
            </div>
        </form:form>
    
        <c:if test="${searchResult != null}">
            <spring:url value="/users/delete" var="deleteUsers"/>
            <form:form
            modelAttribute="usersToDelete"
            action="${deleteUsers}"
            method="post"
            class="form-horizontal"
            id="remove-users-form">

                <table class="table table-stripped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Group name</th>
                            <th>
                                <input type="checkbox" id="check-all" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${searchResult}">
                            <tr>
                                <td><c:out value="${user.lastName} ${user.middleName} ${user.firstName}"/></td>
                                <td>
                                    <c:out value="${user.group.name}"/>
                                </td>
                                <td>
                                    <form:checkbox class="check-user" path="ids" value="${user.id}" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-default btn-sm">
                    <span class="glyphicon glyphicon-trash"></span> Trash 
                </button>
            </form:form>
        </c:if>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/users/usersList.js" />"></script>
</body>