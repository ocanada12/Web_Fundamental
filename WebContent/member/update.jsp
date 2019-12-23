<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>
<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String password = request.getParameter("phone");
	String regdate = request.getParameter("regdate");
	String tempPage = request.getParameter("page");


	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(email,name,password,phone,regdate);
	boolean isSuccess = dao.update(dto);
	if (isSuccess) {
%>
<script>
	alert('사원정보가 수정되었습니다.');
	location.href="view.jsp?page=<%=tempPage%>&name=<%=name%>";
</script>
<%
	} else {
%>
<script>
	alert('DB Error');
	history.back(-1);
</script>
<%
	}
%>