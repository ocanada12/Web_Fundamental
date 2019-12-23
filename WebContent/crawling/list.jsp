
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>

<!--breadcum start-->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Library</li>
	</ol>
</nav>
<!--breadcum end-->
<!--main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">

			<h3>Crawling</h3>

		<%
		int year = 2019;
		int month = 12;
		int day = 31;
		int syear = 2019;
		int smonth = 12;
		int sday = 2;
		int eyear = 2019;
		int emonth = 12;
		int eday = 10;
				
		
		%>

			<form name="f" method="post" action="list.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label">코인선택</label>
					<div class="form-group col-sm-9">
						<select id="coin" name="coin" class="form-control">
							<option selected>Coin...</option>
							<option value="bitcoin">비트코인</option>
							<option value="ethereum">이더리움</option>
							<option value="xrp">리플</option>
							<option value="bitcoin-cash">비트코인캐쉬</option>
							<option value="litecoin">라이트코인</option>
						</select>
					</div>

				</div>
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label">시작날짜</label>
					<div class="form-group col-sm-3">
						<select id="startYear" name="startYear" class="form-control">
							<option selected>Year...</option>
							<%for(int i= 2010;i<=year;i++){ %>
							<option value="<%=i%>" ><%=i%></option>
							<%} %>
						</select>
					</div>

					<div class="form-group col-sm-3">
						<select id="startMonth" name="startMonth" class="form-control">
							<option selected>Month...</option>
							<%for(int i= 1;i<=month;i++){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
					</div>

					<div class="form-group col-sm-3">
						<select id="startDay" name="startDay" class="form-control">
							<option selected>Day...</option>
							<%for(int i= 1;i<=day;i++){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<label for="endYear" class="col-sm-3 col-form-label">끝날짜</label>

					<div class="form-group col-sm-3">
						<select id="endYear" name="endYear" class="form-control">
							<option selected>Year...</option>
							<%for(int i= 2010;i<=year;i++){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
					</div>

					<div class="form-group col-sm-3">
						<select id="endMonth" name="endMonth" class="form-control">
							<option selected>Month...</option>
							<%for(int i= 1;i<=month;i++){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
					</div>

					<div class="form-group col-sm-3">
						<select id="endDay" name="endDay" class="form-control">
							<option selected>Day...</option>
							<%for(int i= 1;i<=day;i++){ %>
							<option value="<%=i%>"><%=i%></option>
							<%} %>
						</select>
					</div>
				</div>

			</form>
			<div class="text-right">
				<button type="button" id="searchCoin"
					class="btn btn-outline-success">검색</button>
			</div>
			<div class="table-responsive-lg">
				<table class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">Date</th>
							<th scope="col">Open</th>
							<th scope="col">High</th>
							<th scope="col">Low</th>
							<th scope="col">Close</th>
							<th scope="col">Volume</th>
							<th scope="col">Market Cap</th>
						</tr>
					</thead>
					<tbody>
								<%
			
				FileWriter fw = null;
				BufferedWriter bw = null;
				PrintWriter pw = null;
			
		
				StringBuffer startdate = new StringBuffer();
				startdate.append(syear);
				startdate.append(String.format("%02d", smonth));
				startdate.append(String.format("%02d", sday));

				StringBuffer enddate = new StringBuffer();
				enddate.append(eyear);
				enddate.append(String.format("%02d", emonth));
				enddate.append(String.format("%02d", eday));
				
				StringBuffer sql = new StringBuffer();
				sql.append("https://coinmarketcap.com/currencies/bitcoin/historical-data/?start=");
				sql.append(startdate);
				sql.append("&end="+enddate);				
				
				String url = sql.toString();
		
				Document doc = null;
				

				try {
					doc = Jsoup.connect(url).get();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Elements elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");
			    %>
						<%for(int i = 0; i < elements.size(); i++){ %>
						<%
			    Element trElement = elements.get(i);
				String date = trElement.child(0).text();
				String open = trElement.child(1).text();
				String high = trElement.child(2).text();
				String low = trElement.child(3).text();
				String close = trElement.child(4).text();
				String volume = trElement.child(5).text();
				String cap = trElement.child(6).text();
			    %>
						<tr>
							<td><%=date %></td>
							<td><%=open %></td>
							<td><%=high %></td>
							<td><%=low %></td>
							<td><%=close %></td>
							<td><%=volume %></td>
							<td><%=cap %></td>
						</tr>
				<%} %>	
	
					</tbody>
				</table>
			</div>


		</div>
	</div>
</div>
<!--main end-->

<!-- footer start-->
<footer class="bg-dark bd-footer"
	style="color: white; padding: 1em; margin-top: 1em;">
	<div class="container-fluid text-center">
		<p>Since 2019-12-13</p>
	</div>
</footer>
<!-- footer end-->
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</body>

</html>

<script>
	$("#searchCoin").click(function() {
		f.submit();
	});
</script>