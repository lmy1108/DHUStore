<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2018/6/24
  Time: 下午11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>每类商品销售统计</title>
    <script src="${pageContext.request.contextPath}/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>

    <style type="text/css">
        ${demo.css}
    </style>
    <script type="text/javascript">


        $(function () {
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '每类商品销售额统计'
                },
                subtitle: {
                    text: '统计时长：一个月'
                },
                xAxis: {
                    categories: [
                        '书籍',
                        '电子',
                        '生活用品',
                        '化妆品',
                        '零食小吃',
                        '服装'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '单位：元'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: '销售总额',
                    data: <%=session.getAttribute("sellsList") %>

                }
                // , {
                //     name: '当月',
                //     data: [830.6, 781.8, 982.5, 933.4, 1064.0, 845.5]
                //
                // }
                ]
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

