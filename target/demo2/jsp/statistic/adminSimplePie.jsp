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
    <title>商品分类销售占比</title>
    <script src="${pageContext.request.contextPath}/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">

    <script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
    <style type="text/css">
        ${demo.css}
    </style>
    <script type="text/javascript">
        $(function () {

            $(document).ready(function () {

                // Build the chart
                $('#container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: '商品分类销售数量占比'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        name: '销售占比',
                        colorByPoint: true,
                        data: [{
                            name: '书籍 ' + <%= session.getAttribute("bookNum") %> + "件",
                            y: <%= session.getAttribute("book") %>
                        }, {
                            name: '电子 ' + <%= session.getAttribute("digitalNum") %>+ "件",
                            y: <%= session.getAttribute("digital") %>,
                            sliced: true,
                            selected: true
                        }, {
                            name: '生活用品 ' + <%= session.getAttribute("lifeNum") %>+ "件",
                            y: <%= session.getAttribute("life") %>
                        }, {
                            name: '化妆品 ' + <%= session.getAttribute("makeupNum") %>+ "件",
                            y: <%= session.getAttribute("makeup") %>
                        }, {
                            name: '零食小吃 ' + <%= session.getAttribute("snackNum") %>+ "件",
                            y: <%= session.getAttribute("snack") %>
                        }, {
                            name: '服装 ' + <%= session.getAttribute("clothNum") %>+ "件",
                            y: <%= session.getAttribute("cloth") %>
                        }]
                    }]
                });


                var  chart = Highcharts.chart('container2', {
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '商品分类销售额占比'
                    },
                    tooltip: {
                        headerFormat: '{series.name}<br>',
                        pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            },
                            states: {
                                hover: {
                                    enabled: false
                                }
                            },
                            slicedOffset: 20,         // 突出间距
                            point: {                  // 每个扇区是数据点对象，所以事件应该写在 point 下面
                                events: {
                                    // 鼠标滑过是，突出当前扇区
                                    mouseOver: function() {
                                        this.slice();
                                    },
                                    // 鼠标移出时，收回突出显示
                                    mouseOut: function() {
                                        this.slice();
                                    },
                                    // 默认是点击突出，这里屏蔽掉
                                    click: function() {
                                        return false;
                                    }
                                }
                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: '商品分类销售额占比',
                        data: [
                            ['书籍 ￥'+ <%= session.getAttribute("bookPrice") %>,   <%= session.getAttribute("book2") %>],
                            ['电子 ￥' + <%= session.getAttribute("digitalPrice") %>,       <%= session.getAttribute("digital2") %>],
                            {
                                name: '生活用品 ￥'+<%= session.getAttribute("lifePrice") %>,
                                y: <%= session.getAttribute("life2") %>,
                                sliced: true, // 突出显示这个点（扇区），用于强调。
                            },
                            ['化妆品 ￥'+ <%= session.getAttribute("makeupPrice") %>,    <%= session.getAttribute("makeup2") %>],
                            ['零食小吃 ￥' + <%= session.getAttribute("snackPrice") %>,     <%= session.getAttribute("snack2") %>],
                            ['服装 ￥' + <%= session.getAttribute("clothPrice") %>,   <%= session.getAttribute("cloth2") %>]
                        ]
                    }]
                });

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
<div id="container" style="min-width: 600px; height: 600px; max-width: 800px; margin: 0 auto"></div>

<div id="container2" style="min-width: 600px; height: 600px; max-width: 800px; margin: 0 auto"></div>
</div>


</body>
</html>