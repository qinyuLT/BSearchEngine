<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>百度网盘搜索引擎</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="网盘搜索" />
<meta name="description" content="百度网盘搜索" />
<link href="css/base2.css" rel="stylesheet" type="text/css" />


<style>
	b{
		color: red;
	}
</style>
<script type="text/javascript">
	function checkForm(){
		var q=document.getElementById("q");
		if(q.value==null || q.value==""){
			alert("请输入需要搜索的信息！");
			return false;
		}
		return true;
	}
	function loadData(q,start){
		$.getJSON("http://localhost:8080/BaiduYun/BaiduYunServlet?jsoncallback=?",{q:q,start:start},function(result){
			if(result.length==null){
				alter("未搜索到结果，请换个关键字！");
			}else{
				$("#result").children().remove();
				$("#result").append("<font>搜索结果：</font><hr style='margin-top:2px;margin-bottom:10px;'></hr>");
				$.each(result,function(i,val){
					var di=$("<p>"+"<a style='font-size:16px;color:#1f4fcd;text-decoration:underline;' target='_blank' href='"+val.unescapedUrl+"'>"+val.title+"</a></br>"+
							  "<span style='font-size:14px'>"+val.content+"</span></br>"+
							  "<p style='color:black;font-size:13px;width:500px;word-break:break-word'>人工复制后面地址,然后在新的页面打开：<font color=red>"+val.unescapedUrl+"</font></p>"+
							"</p><br/>");
					$("#result").append(di);
					$("#cse2").remove();
					$("#pa").show();
				});
	
			}
		},"json");
	}

	loadData("java",0);

</script>



</head>
<body >
<div align="center" style="padding-top: 10px;">
<table width="960px" align="center"   cellpadding="5px">
	<tr>
		<td colspan="2">
		<div class="nav center">
		<div class="box_outer">
		<div class="box_body">
		<table class="sch" >
			<tbody>
				<tr id='test'>
					<td class="first_td">
						<a href="index.html" ><img src="images/logo2.png"/></a>
					</td>
					<form id="cse-search-box" name=f action="result.jsp" method="get" onsubmit="return checkForm()">

					<td width="373px" style="padding-bottom: 12px; padding-left: 10px;">
					<br/>
					<input type="hidden" name="wp" id="wp" value="0" />
				    <input type="hidden" name="op" id="op" value="0" />
				    <input type="hidden" name="ty" id="ty" value="gn" />
					<div id="sugOut"><input   id="q" name="q"  value="${param.q }"  maxlength=100
						 autocomplete="off">
						<br>
					<div id="sug"></div>
					</div>
					</td>
					<td style="padding-bottom: 12px; ">
					<br/>
					<button type="submit">网盘搜索</button>
					</td>
					</form>
					<td align=right id="hao_search_content" width="360px"></td>
					<td class="last_td"></td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="box_b"><span class="box_p"></span></div>
		</div>
		</div>
		</td>
	</tr>
	<tr>
		<td width="1000px">
			<div id="search_result">
			         <div id="cse2"><div id="loading" style="text-align:center; font-size:15px; width:auto; height:60px; width:100%;"><img src="images/loading.gif" /> 正在加载数据，请稍后....请不要离开...</div></div>
				     <div id="result">
				     	
				     </div>
				   <div id="pa" class="pagination" style="display: none;">
						  <ul >
						    <li><a href="javascript:loadData('${param.q }',0)">第1页</a></li>
						    <li><a href="javascript:loadData('${param.q }',10)">第2页</a></li>
						    <li><a href="javascript:loadData('${param.q }',20)">第3页</a></li>
						    <li><a href="javascript:loadData('${param.q }',30)">第4页</a></li>
						    <li><a href="javascript:loadData('${param.q }',40)">第5页</a></li>
						    <li><a href="javascript:loadData('${param.q }',50)">第6页</a></li>
						    <li><a href="javascript:loadData('${param.q }',60)">第7页</a></li>
						    <li><a href="javascript:loadData('${param.q }',70)">第8页</a></li>
						    <li><a href="javascript:loadData('${param.q }',80)">第9页</a></li>
						    <li><a href="javascript:loadData('${param.q }',90)">第10页</a></li>
						  </ul>
					</div>
			    </div>
		</td>
		<td width="260px" valign="top">
			
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<p align="center" style="padding: 10px;">
				免责声明：本站搜索结果来自Google自定义搜索，不存储任何网盘内容，只提供信息检索服务。<br />
				Copyright&copy;2016-2017  百度网盘资源搜索引擎<br />
			</p>
			
		</td>
	</tr>
</table>
</div>

</body>
</html>
<script type="text/javascript" src="js/base.js"></script>
