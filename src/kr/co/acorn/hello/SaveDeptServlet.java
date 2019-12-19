package kr.co.acorn.hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.acorn.dao.DeptDao;
import kr.co.acorn.dto.DeptDto;


@WebServlet("/SaveDeptServlet")
public class SaveDeptServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 파라미터가 한글일 경우에는 반드시 해줘야함
		
		int no = Integer.parseInt(request.getParameter("no")); // 파라미터
		String name = request.getParameter("name");
		String loc = request.getParameter("loc");
		
		DeptDto dto = new DeptDto(no,name,loc); // 객체 생성
		DeptDao dao = DeptDao.getInstance();
		
		boolean isSuccess = dao.insert(dto);  //다오 객체 생성
		
		if(isSuccess) {
			response.sendRedirect("/dept_success.html"); // 이동
		}else {
			response.sendRedirect("/dept.html");
		}
	}
}
