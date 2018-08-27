<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2018/6/24
  Time: 下午10:18
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
            var jsonMap;

            $(document).ready(
                $.ajax({
                    url: "/demo2/salesppImpl",
                    data: {
                    },
                    method: "post",
                    success: function (result) {

                        categories = result.sellerList;
                        var colors = Highcharts.getOptions().colors;

                        var data = [];

                        for(i=0; i< result.sellerList.length;i++){
                            data[i]={};
                            data[i].y=result.sellerRate[i];
                            data[i].color=colors[i];
                            data[i].drilldown={};
                            data[i].drilldown.name=result.sellerList[i];
                            data[i].drilldown.categories=result.productList[i];
                            data[i].drilldown.data=result.productRate[i];
                            data[i].drilldown.color=colors[i];
                        }
                        alert(JSON.stringify(data));


                        /*for(i=0; i< result.sellerList.length;i++){
                            var dic = new Array();
                            dic["y"]=result.result.sellerRate[i]

                            data[i]['y']=result.sellerRate[i];
                            data[i].color=colors[i];
                            data[i].drilldown.name=result.sellerList[i];
                            data[i].drilldown.categories=result.productList[i];
                            data[i].drilldown.data=result.productRate[i];
                            data[i].drilldown.color=colors[i]


                            data.push(dic);
                        }*/

                            // data = [{
                            //     y: result.sellerRate[0],
                            //     color: colors[0],
                            //     drilldown: {
                            //         name: result.sellerList[0],
                            //         categories: result.productList[0],
                            //         data: result.productRate[0],
                            //         color: colors[0]
                            //     }
                            // }, {
                            //     y: result.sellerRate[1],
                            //     color: colors[1],
                            //     drilldown: {
                            //         name: result.sellerList[1],
                            //         categories: result.productList[1],
                            //         data: result.productRate[1],
                            //         color: colors[1]
                            //     }
                            // }, {
                            //     y: result.sellerRate[2],
                            //     color: colors[2],
                            //     drilldown: {
                            //         name: result.sellerList[2],
                            //         categories: result.productList[2],
                            //         data: result.productRate[2],
                            //         color: colors[2]
                            //     }
                            // }, {
                            //     y: result.sellerRate[3],
                            //     color: colors[3],
                            //     drilldown: {
                            //         name: result.sellerList[3],
                            //         categories: result.productList[3],
                            //         data: result.productRate[3],
                            //         color: colors[3]
                            //     }
                            // }, {
                            //     y: result.sellerRate[4],
                            //     color: colors[4],
                            //     drilldown: {
                            //         name: result.sellerList[4],
                            //         categories: result.productList[4],
                            //         data: result.productRate[4],
                            //         color: colors[4]
                            //     }
                            // }, {
                            //     y: result.sellerRate[5],
                            //     color: colors[5],
                            //     drilldown: {
                            //         name: result.sellerList[5],
                            //         categories: result.productList[5],
                            //         data: result.productRate[5],
                            //         color: colors[5]
                            //     }
                            // }, {
                            //     y: result.sellerRate[6],
                            //     color: colors[6],
                            //     drilldown: {
                            //         name: result.sellerList[6],
                            //         categories: result.productList[6],
                            //         data: result.productRate[6],
                            //         color: colors[6]
                            //     }
                            // }, {
                            //     y: result.sellerRate[7],
                            //     color: colors[7],
                            //     drilldown: {
                            //         name: result.sellerList[7],
                            //         categories: result.productList[7],
                            //         data: result.productRate[7],
                            //         color: colors[7]
                            //     }
                            // }, {
                            //     y: result.sellerRate[8],
                            //     color: colors[8],
                            //     drilldown: {
                            //         name: result.sellerList[8],
                            //         categories: result.productList[8],
                            //         data: result.productRate[8],
                            //         color: colors[8]
                            //     }
                            // }, {
                            //     y: result.sellerRate[9],
                            //     color: colors[9],
                            //     drilldown: {
                            //         name: result.sellerList[9],
                            //         categories: result.productList[9],
                            //         data: result.productRate[9],
                            //         color: colors[9]
                            //     }
                            // }, {
                            //     y: result.sellerRate[10],
                            //     color: colors[10],
                            //     drilldown: {
                            //         name: result.sellerList[10],
                            //         categories: result.productList[10],
                            //         data: result.productRate[10],
                            //         color: colors[10]
                            //     }
                            // },{
                            //     y: result.sellerRate[11],
                            //     color: colors[11],
                            //     drilldown: {
                            //         name: result.sellerList[11],
                            //         categories: result.productList[11],
                            //         data: result.productRate[11],
                            //         color: colors[11]
                            //     }
                            // }],
                            browserData = [],
                            versionsData = [],
                            i,
                            j=0,
                            dataLen = data.length,
                            drillDataLen=0,
                            brightness=0;
                        // 构建数据数组
                        for (i = 0; i < dataLen; i += 1) {
                            // 添加浏览器数据
                            browserData.push({
                                name: categories[i],
                                y: data[i].y,
                                color: data[i].color
                            });
                            // 添加版本数据
                            drillDataLen = data[i].drilldown.data.length;
                            for (j = 0; j < drillDataLen; j += 1) {
                                brightness = 0.2 - (j / drillDataLen) / 5;
                                versionsData.push({
                                    name: data[i].drilldown.categories[j],
                                    y: data[i].drilldown.data[j],
                                    color: Highcharts.Color(data[i].color).brighten(brightness).get()
                                });
                            }
                        }
                        // 创建图表
                        $('#container').highcharts({
                            chart: {
                                type: 'pie'
                            },
                            title: {
                                text: '商城各卖家、商品销售额比例'
                            },
                            subtitle: {
                                text: '内环为卖家销售额占比，外环为具体的商品'
                            },
                            yAxis: {
                                title: {
                                    text: '总百分比市场份额'
                                }
                            },
                            plotOptions: {
                                pie: {
                                    shadow: false,
                                    center: ['50%', '50%']
                                }
                            },
                            tooltip: {
                                valueSuffix: '%'
                            },
                            series: [{
                                name: '卖家占比',
                                data: browserData,
                                size: '60%',
                                dataLabels: {
                                    formatter: function () {
                                        return this.y > 5 ? this.point.name : null;
                                    },
                                    color: 'white',
                                    distance: -30          // 距离值为负时显示在在扇区里面
                                }
                            }, {
                                name: '商品占比',
                                data: versionsData,
                                size: '80%',
                                innerSize: '60%',
                                dataLabels: {
                                    softConnector: false,   // 是否使用曲线
                                    connectorColor: 'red', // 连接线颜色，默认是扇区颜色
                                    distance: 20, // 数据标签与扇区距离
                                    connectorPadding: 20,  // 数据标签与连接线的距离
                                    formatter: function () {
                                        // 通过函数判断是否显示数据标签，为了防止数据标签过于密集
                                        return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y + '%'  : null;
                                    }
                                }
                            }]
                        });
                    },
                    error: function (result) {
                        alert("erroe");
                    }
                })



            );
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

    <div id="container" style="width: 900px; height: 900px; margin: 0 auto"></div>
</div>
</body>
</html>