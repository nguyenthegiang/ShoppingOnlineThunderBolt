<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Favicon-->
        <link rel="icon" type="image/png" href="image/faviconLogo.png" />
        <title>Computer ERA</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .checked {
                color: orange;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                    <div class="col-sm-9">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="#"><img src="image/${detailBlog.imageLink}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <h3 style="color: red">${message}</h3>
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detailBlog.title}</h3>

                                         <!-- price-detail-wrap .// -->
                                        <!--                                        <dl class="item-property">
                                                                                    <dt>Description</dt>
                                                                                    <dd><p>
                                        ${detail.description}
                                    </p></dd>
                            </dl>
                                        -->
                                        <hr>
                                        <dl class="item-property">
                                            <dt>Lý do</dt>
                                            <dd><p>
                                                    ${detailBlog.content}
                                                </p></dd>
                                        </dl>
                                        
                                        <hr>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                            function addCart2(ProductID) {
            <c:if test="${sessionScope.acc != null}">
                                                var select_value = document.getElementById("select_id").value;
                                                //Sử dụng Ajax
                                                $.ajax({
                                                    url: "/Assignment_ElectronicShop_Pro/addMany",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        ProductID: ProductID,
                                                        Quantity: select_value
                                                    },
                                                    success: function (message) {
                                                        alert(message);
                                                    }
                                                });
            </c:if>
            <c:if test="${sessionScope.acc == null}">
                                                location.href = "login";
            </c:if>
                                            }

                                            function buy(ProductID) {
                                                var select_value = document.getElementById("select_id").value;
                                                location.href = "buyNow?ProductID=" + ProductID + "&Quantity=" + select_value;
                                            }
        </script>  
    </body>
</html>