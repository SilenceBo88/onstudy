<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title></title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/front/bootstrap/bootstrap.min.css" />
</head>

<body class="gray-bg">

	<script src="js/plugins/simple-pie/echarts.common.min.js"></script>
	<div id="main" style="width: 600px;height:400px;"></div>
	<a class="J_menuItem"
		href="${APP_PATH }/course/findHavaVideoCou.action" data-index="82"><button
			type="button" class="btn btn-info">
			有视频的课程
			<fmt:formatNumber
				value="${statisticsvideo.havaVideoCouNum/statisticsvideo.courseNum}"
				type="currency" pattern="##.###%" />
		</button>
		<span class="label label-danger pull-right"></span> </a>
	<a class="J_menuItem"
		href="${APP_PATH }/course/findNotHavaVideoCou.action" data-index="82"><button
			type="button" class="btn btn-success">
			无视频的课程
			<fmt:formatNumber
				value="${statisticsvideo.notHavaVideoCouNum/statisticsvideo.courseNum}"
				type="currency" pattern="##.###%" />
		</button> <br /> <span class="label label-danger pull-right"></span> </a>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		option = {
			title : {
				text : '视频',
				subtext : '应有课程数${statisticsvideo.courseNum}',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : [ '拥有视频课程数', '无视频课程数' ]
			},
			series : [ {
				//name : '访问来源',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : [ {
					value : '${statisticsvideo.havaVideoCouNum}',
					name : '拥有视频课程数'
				}, {
					value : '${statisticsvideo.notHavaVideoCouNum}',
					name : '无视频课程数'
				} ],
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(255, 255, 255, 0.5)'
					}
				}
			} ]
		};
		myChart.setOption(option);
	</script>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>



</body>

</html>
