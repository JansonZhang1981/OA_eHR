<!doctype html>
<html lang="en">
<script language='javascript'>
function pageReload()
{
window.location.reload(); 
}
</script>
<script language=vbscript>
Dim fname
dim data 
    data=""
	data = data &  " <table width='980' border='1' cellspacing='0' cellpadding='0' class='pagetab' align='left'>"
	data = data &  "  <tr class='header'>" & _
		"<td align='center' width='80px' >员工号</td>" & _
		"<td align='center' width='80px'>员工姓名</td>" & _
		"<td align='center' width='80px'>月份</td>" & _
		"<td align='center 'width='80px'>基本工资</td>" & _
		"<td align='center' width='80px' >岗位工资</td>" & _
		"<td align='center' width='80px' >奖金</td>" & _
		"<td align='center'  width='80px'>加班费</td>" & _
		"<td align='center'  width='80px'>公积金</td>" & _
		"<td align='center'  width='100px'>个人所得税</td>" & _
		"<td align='center'  width='80px'>失业保险</td>" & _
		"<td align='center'  width='80px'>医疗保险</td>" & _
		"<td align='center'  width='80px'>商业险</td>" & _
		"<td align='center'  width='80px'>实发工资</td>" & _
		"</tr>" 

function blank(x)
    Dim s
	s=x
	If x="null" Then
	s=""
	End If
	Return s
End function
  

Function ado_xls()
	fname=document.getElementById("file1").value
	If fname <>"" Then
		constr  = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & fname & ";Extended Properties=""Excel 8.0;HDR=yes;IMEX=2"""
		sqlstr="select * from [Sheet1$] "
		Set adoconn = CreateObject("ADODB.connection")
		adoconn.Open constr

		dim rs
		set rs=CreateObject("ADODB.Recordset")
		rs.Open sqlstr,adoconn,2,2
		Do While Not rs.EOF
			data =data & "<tr height='22'>"
			data =data & "<td>" & rs("员工号").Value & "</td>"
			data =data & "<td>" & rs("员工姓名").Value & "</td>"
			data =data & "<td>" & rs("月份").Value & "</td>"
			data =data & "<td>" & rs("基本工资").Value & "</td>"
			data =data & "<td>" & rs("岗位工资").Value & "</td>"
			data =data & "<td>" & rs("奖金").Value & "</td>"
			data =data & "<td>" & rs("加班费").Value & "</td>"
			data =data & "<td>" & rs("公积金").Value & "</td>"
			data =data & "<td>" & rs("个人所得税").Value & "</td>"
			data =data & "<td>" & rs("失业保险").Value & "</td>"
			data =data & "<td>" & rs("医疗保险").Value & "</td>"
			data =data & "<td>" & rs("商业险").Value & "</td>"
			data =data & "<td>" & rs("实发工资").Value & "</td>"
			data =data & "</tr>"
			rs.moveNext()

		Loop

		data =data & "</table>"

		document.getElementById("div1").style.display = "block"
		document.getElementById("table1").innerHTML = data
		rs.close()
		adoconn.close()
	End if

'		rs=nothing
	'	adoconn=nothing
End function
  
Function domysql()
	 Dim Cnn
	Dim Rst
	Dim strCnn

	StrCnn="Provider=MSDASQL.1;Persist Security Info=True;Extended Properties='Driver=MySQL ODBC 5.1 Driver;SERVER=localhost;UID=root;PWD=3.1415926;DATABASE=stfoa;PORT=13306'"

	Set Cnn = CreateObject("ADODB.Connection")
	Cnn.Open strCnn

	'查看是否连接成功，成功状态值为1
	'msgbox Conn.state
	If Cnn.State = 0 Then
		 msgbox  "导入失败，请联系管理员！"
	Else
	    fname=document.getElementById("file1").value
	constr  = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & fname & ";Extended Properties=""Excel 8.0;HDR=yes;IMEX=2"""
	 sqlstr="select * from [Sheet1$] "
	 Set adoconn = CreateObject("ADODB.connection")
	 adoconn.Open constr

	 dim rs
	set rs=CreateObject("ADODB.Recordset")
	 rs.Open sqlstr,adoconn,2,2
     Do While Not rs.EOF
        sql="insert into stfoa.hr_ecool_salary(userid,username,ym,jbgz,gwgz,jj,jbf,gjj,grsds,sybx,ylbx,syx,sfgz) VALUES('" & _
		      rs("员工号").Value & "','" & _ 
			  rs("员工姓名").Value & "','" & _
			  rs("月份").Value & "','" & _
			  rs("基本工资").Value & "','" & _
			  rs("岗位工资").Value & "','" & _
			  rs("奖金").Value & "','" & _
			  rs("加班费").Value & "','" & _
			  rs("公积金").Value & "','" & _
			  rs("个人所得税").Value & "','" & _
			  rs("失业保险").Value & "','" & _
			  rs("医疗保险").Value & "','" & _
			  rs("商业险").Value & "','" & _
			  rs("实发工资").Value & "')"
			 Cnn.execute(sql)
	    rs.moveNext()
	 Loop
		rs.close()
		adoconn.close()
	'	rs=nothing
	'	adoconn=Nothing
		
		Cnn.close()
	'	Cnn=nothing
		
		msgbox "导入成功"
	
	End If 
End function
</script>
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
 </head>
<body scroll="yes">  
     <form id="addfrm" name="addfrm" action="" >  
	 <input id="file1" type="file" name="file" /> 
            <input type="hidden" name="subflag" value="1">  
            <input name="" type="button" value=" 打开 " class="buttton" onclick="ado_xls()"/>  
			 <input name="" type="submit" value=" 确认提交 " class="buttton" onclick="domysql()"/></br>  
            </br>  
			  <div id="errmsg" class="formmsg">提示信息</div></br> 
            <div id="div1" style="display: none" mce_style="display: none">  
            <div id="table1"></div>  
            </div>  
            </form>  
</body>  
</html>
