<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2018/6/24
  Time: 下午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>每月销售额变化统计</title>

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">


    <style type="text/css">
        ${demo.css}
    </style>
    <script type="text/javascript">
        $(function () {
            $('#container').highcharts({
                title: {
                    text: '每月销售额变化统计',
                    x: -20 //center
                },
                subtitle: {
                    text: '',
                    x: -20
                },
                xAxis: {
                    categories: ['一月', '二月', '三月', '四月', '五月', '六月',
                        '七月', '八月', '九月', '十月', '十一月', '十二月']
                },
                yAxis: {
                    title: {
                        text: '销售额（元）'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '元'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: '书籍',
                    data: <%= session.getAttribute("book")%>
                }, {
                    name: '电子',
                    data: <%= session.getAttribute("digital")%>
                }, {
                    name: '生活用品',
                    data: <%= session.getAttribute("life")%>
                }, {
                    name: '化妆品',
                    data: <%= session.getAttribute("makeup")%>
                }, {
                    name: '零食小吃',
                    data: <%= session.getAttribute("snack")%>
                }, {
                    name: '服装',
                    data: <%= session.getAttribute("cloth")%>
                }, {
                    name: '总销售额',
                    data: <%= session.getAttribute("total")%>
                }]
            });
        });
    </script>
</head>
<body>
<script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>
<jsp:include page="../adminSidebar.jsp"/>
<div class="layui-body">

    <br><br><br><br><br><br>
    <br><br><br>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</div>

</body>
</html>