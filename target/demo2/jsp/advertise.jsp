<%--
  Created by IntelliJ IDEA.
  User: lmy
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>商城-${goodsInfo['product'].productname}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- all css here -->
    <!-- bootstrap v3.3.6 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">

    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">--%>
    <!-- style css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link href="${pageContext.request.contextPath}/css/shopdetail.css" rel="stylesheet">
    <!-- <script src="./detail/js/jquery.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>

    <%--<script src="${pageContext.request.contextPath}/js/sort.js"></script>--%>

    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/detail.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.raty.js"></script>


    <style>
        .head{
            width: 45px !important;
            background: rgba(0,0,0,.0001) none repeat scroll 0 0 !important;
            border: 1px solid rgba(0,0,0,.075) !important;
        }
        .span-block{
            display: block !important;
            padding:5px;
        }
        #headPic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 5px;
        }
        #commentPic {
            width: 80px;
            height: 80px;
            border-radius: 80%;
        }

        .jumbotron{
            background-color: #fafafa;
        }
    </style>

</head>

<body>


<div class="elavator_area">
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div class="shop_menu shop_menu_2 main-detail-div">
            <ul class="cramb_area cramb_area_5 main-detail-nav">
                <li><a href="/demo2/main">首页 /</a></li>
                <%--<li><a href="index.html">Shop /</a></li>
                <li><a href="index.html">Headlight/</a></li>
                <li><a href="index.html">Hats /</a></li>--%>
                <li class="br-active">${advertise.advertisename}</li>
            </ul>
        </div>
        <div class="row-fluid">
            <div class="text-center" class="span12">
                <h1 >${advertise.advertisename}</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                <%--<div class="shopdetails">--%>
                <%--<div id="leftbox">--%>
                    <%--<div id="showbox">--%>
                        <%--&lt;%&ndash;<c:forEach items="${productInfo['image']}" var="path">&ndash;%&gt;--%>
                        <%--<img src="/upload/${productInfo['product'].imagepath}" width="300" height="300"/>--%>
                        <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                    <%--</div></div>--%>

                <%--</br>--%>
                <%--</br>--%>
                <%--</br>--%>
                <%--</br>--%>

            <%--</div>--%>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="elav_titel">
                    <div class="elv_heading">
                        <br/>
                        <br/>

                        <h4>广告发布时间：${advertise.uptime}</h4>
                    </div>
                </div>
            </div>
        <div class="col-lg-2 col-md-2 ">
            &nbsp;
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">

                    <form  action="${pageContext.request.contextPath}/addCart" method="post">
                        <input type="hidden" value="${productInfo['product'].productid}" name="productid"/>
                        <div class="elav_titel">
                            <div class="elv_heading">
                                <h4><a href="/demo2/sellerMain?sellerId=${seller.sellerid}"><img id="headPic" src="/upload/${seller.imagepath}"></a>
                                    卖家：${seller.sellername}</h4>
                            </div>
                        </div>
                        <%--<button class="add-tocart cart_zpf" type="submit">访问卖家主页</button>--%>
                        <input type="number" value="1" name="goodsnum" class="invisible">
                    </form>




        </div>

        </div>
            <div class="container">
                <div class="shop_menu shop_menu_2 main-detail-div">
                    <div class="jumbotron">
                        ${advertise.addetail}
                    </div>
                </div>
            </div>
        </div>

<!--zoom elavator area one end-->
<!--tab area start-->


<!--tab area end-->
<!-- jquery latest version -->
<!-- <script src="js/vendor/jquery-1.12.0.min.js"></script> -->
<!-- bootstrap js -->
<!-- <script src="js/bootstrap.min.js"></script> -->

</body>

</html>


