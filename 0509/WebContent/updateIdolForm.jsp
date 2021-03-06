<%@page import="java.sql.Date"%>
<%@page import="dao.IdolsDAO"%>
<%@page import="vo.Idol"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 날짜 얻어오기
	Calendar now = Calendar.getInstance();
	// System.out.println(now.get(Calendar.YEAR));
	
	// 올해 년도 얻기
	int year = now.get(Calendar.YEAR); // now.get(1);와 같음
	// System.out.println(year);
	
	// 그룹 목록 얻기
	List<Group> list = GroupsDAO.groupList();
	
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	Idol idol = IdolsDAO.selectOne(no);
	
	Date birthDate = idol.getBirthDate();
	
	Calendar birthday = Calendar.getInstance();
	birthday.setTime(birthDate);
	int birthYear = birthday.get(Calendar.YEAR);
	int month = birthday.get(Calendar.MONTH)+1;
	int date = birthday.get(Calendar.DATE);
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이돌 수정</title>
	</head>
	<body>
		<h1>아이돌 수정</h1>
		<form action=" updateIdol.jsp" method="post" >
		<input type="hidden" name="no" value="<%=no%>" />
			<fieldset>
				<legend>아이돌 수정 폼</legend>
				<p>
					<label for="name">이름</label>
					<input id="name" type="text" name="name" value="<%=idol.getName()%>" placeholder="이름" />
				</p>
				<p>
					<label for="height">키</label>
					<input id="height" type="text" name="height" value="<%=idol.getHeight()%>" placeholder="키" /> cm
				</p>
				<p>
					<label for="weight">몸무게</label>
					<input id="weight" type="text" name="weight" value="<%=idol.getWeight()%>" placeholder="몸무게" /> kg
				</p>
				<p>
					<span>생일</span>
					<select name="year">
						<%for(int i=year; i>1904; i--) { 
							if(i==birthYear) {%>
								<option selected><%=i %></option>
							<%} else { %>
								<option><%=i %></option>
							<%} %>
						<% } %>
					</select>년
					<select name="month">
						<%for(int i=1; i<13; i++) { %>
							<option
							<%if(i==month) { %>
								selected
							<% } %>
							><%=i %></option>
						<% } %>
					</select>월
					<select name="date">
						<%for(int i=1; i<32; i++) { %>
							<option
							<% if(i==date) { %>
								selected
							<% } %>
							><%=i %></option>
						<% } %>
					</select>일
				</p>
				<p>
					<label for="group">그룹</label>
					<select id="group" name="groupNo">
						<%for(Group group : list) { %>
							<option <% if(group.getNo()==idol.getGroupNo()) {%> selected <% } %> value="<%=group.getNo()%>"><%=group.getName()%></option>
						<% } %>
					</select>
				</p>
				<p>
					<button type="reset">입력 리셋</button>
					<button type="submit">아이돌 수정</button>
				</p>
			</fieldset>
		</form>
		<a href="listIdol.jsp">이전으로</a>
	</body>
</html>