package kr.co.acorn.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */

/*
 * 1. Servlet Annotation ==> @WebServlet("/hello") 
 * 2. Servlet Annotation으로 지정된
 * 이름을 서블릿을 호출할수있다. 
 * 3. 만약 Servlet Annotation을 사용하지 않고 서블릿을 호출하려면 web.xml
 * 파일(DD파일)에 서블릿 정보를 추가해야 한다. 
 * 4. url-pattern 지정하는 방법 3가지 1) extention matching
 * => *.do , *.nhn, *.acorn 2) exact matching => /test, /acorn, /test/acorn 3)
 * wildcard matching => /test/*, /acorn/* 2),3) 반드시 /로 시작해야 하고 1) /로 시작하면 안됨
 */

@WebServlet("/acorn")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HelloServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 응답 MIME 타입과 문자 인코딩을 지정한다.
		response.setContentType("text/html;charset=utf-8");
		// 클라이언트에게 응답할 출력객체를 생성한다.
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Hello World!</h1>");
		String id = request.getParameter("id");
		String age = request.getParameter("age");
		out.println(id + "," + age);
		out.println("</body>");
		out.println("</html>");

	}
}