<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%> 
<%@ page contentType="text/html;charset=utf-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%> 
<%response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();%> 
<html> 
<body> 
<script language='javascript'>
function pageReload()
{
window.location.reload(); 
}
</script>
<table width="960" cellpadding="0" cellspacing="0" border="1" bordercolor="#000000">
  <thead>
  <tr >
  	<td >月份</td>
	<td >员工姓名</td>
	<td >基本工资</td>
	<td >岗位工资</td>
	<td >奖金</td>
	<td >加班费</td>
	<td >公积金</td>
	<td >个人所得税</td>
	<td >失业保险</td>
	<td >医疗保险</td>
	<td >商业险</td>
	<td >实发工资</td>
  </tr>
  </thead>
  <tbody>
<% 
Connection con=null; 
String DBUser = "root"; //mysql用户名 
String DBPasswd = "3.1415926"; //mysql密码 
String DBName = "stfoa"; //数据库名 
String url = "jdbc:mysql://localhost:13306/" + DBName + "??useUnicode=true&characterEncoding=utf-8&user=" + DBUser + "&password=" + DBPasswd; 

Class.forName("org.gjt.mm.mysql.Driver").newInstance();//新建实例 
Connection conn= DriverManager.getConnection(url);//建立连接 
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
String sql="select * from hr_ecool_salary where userid in(select EmpNo from hr_tbl_employeefile where EmpID='"+request.getSession().getAttribute("empid")+"' ) and userid <> '' order by YM DESC"; 
 
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next()) {
%> 
  <tr>
     <td class="sort" >&nbsp;<%=rs.getString("ym")%></td>
     <td class="sort" >&nbsp;<%=rs.getString("username")%></td>
     <td class="sort" >&nbsp;<%=rs.getString("jbgz")%></td>
     <td class="sort">&nbsp;<%=rs.getString("gwgz")%></td>
     <td class="sort">&nbsp;<%=rs.getString("jj")%></td>
     <td class="sort">&nbsp;<%=rs.getString("jbf")%></td>
     <td class="sort">&nbsp;<%=rs.getString("gjj")%></td>
     <td class="sort">&nbsp;<%=rs.getString("grsds")%></td>
     <td class="sort">&nbsp;<%=rs.getString("sybx")%></td>
     <td class="sort">&nbsp;<%=rs.getString("ylbx")%></td>
     <td class="sort">&nbsp;<%=rs.getString("syx")%></td>
     <td class="sort">&nbsp;<%=rs.getString("sfgz")%></td>
  </tr>
<%}
rs.close(); 
stmt.close(); 
conn.close(); 
%> 
   </tbody>
  </table>
</body> 
</html> 

