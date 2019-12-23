<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String tempPage = request.getParameter("page");
	
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.delete(name);
	if(isSuccess){
%>
	<script>
	alert('사원정보가 삭제 되었습니다.');
	location.href="list.jsp?page=<%=tempPage%>";
	</script>
<%	}else{ %>
	<script>
	alert('DB Error');
	history.back(-1);
	</script>
<%	} %>