<%-- 
    Document   : DashBoard
    Created on : Mar 31, 2021, 7:54:26 PM
    Author     : ADMIN
--%>

<%@page import="DAL.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Favicon-->
        <link rel="icon" type="image/png" href="image/faviconLogo.png" />

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/Dashboard.css" rel="stylesheet" type="text/css"/>
        <title>Computer ERA</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>




        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
            <c:forEach var="o" items="${countProductByCategory}">
                    ['${o.name}', ${o.id}],
            </c:forEach>
                ]);

                var options = {
                    title: 'Percentage of product by category'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>    </head>
    <body>


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="background-color: #ebebf2">
                    <nav class="navbar navbar-expand-lg navbar-light flex-column">
                        <a class="navbar-brand" href="dashBoard"><img src="image/Other/Logo.jpg" width="200px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="productList"><i class="fas fa-home"></i>Home</a>
                                <hr class="line">
                            </li>
                            <c:if test="${sessionScope.acc == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login">Login</a>
                                </li>
                            </c:if>
                            <c:if test = "${sessionScope.acc != null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="profile"><i class="fas fa-user-circle"></i>Hello ${sessionScope.acc.user}</a>
                                    <hr class="line">
                                </li>

                                <c:if test="${sessionScope.acc.isSell == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="manager"><i class="fas fa-tasks"></i>Manager Product</a>
                                        <a class="nav-link" href="blogManager"><i class="fas fa-tasks"></i>Manager Blog</a>
                                        <a class="nav-link" href="manage-feedback"><i class="fas fa-tasks"></i>Manage Feedback</a>
                                        <hr class="line">
                                    </li> 
                                </c:if>

                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="accountManager"><i class="fas fa-tasks"></i>Manager Account</a>
                                        <hr class="line">
                                    </li> 
                                </c:if>
                                <li class="nav-item">
                                    <a class="nav-link" href="viewAllNotifications"><i class="fas fa-bell"></i>Notifications (${numberNoti})</a>
                                </li> 
                            </c:if>

                            <li class="nav-item">&nbsp;
                            </li> 
                        </ul>
                        <a class="nav-link" href="logout" style="position: fixed; right: 10px;">LogOut</a>
                    </nav>
                </div>

                <div class="col-md-10">
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-4" id="borderCard">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-12">
                                        <a href="accountManager" style="text-decoration: none;"><img src="image/Other/AccountDashboard.jpg" alt="" id="headerImage" width="250px"/></a>
                                    </div>
                                    <div class="col-md-12" id="dashboardCard">
                                        <div class="card-body">
                                            <a href="accountManager" style="text-decoration: none;"><h5 class="card-title" id="total">Total Accounts</h5></a>
                                            <a href="accountManager" style="text-decoration: none;"><h5 class="card-title" id="amount">${totalAccount}</h5></a>
                                            <a href="accountManager" style="text-decoration: none;"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4" id="borderCard">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-12">
                                        <a href="manager" style="text-decoration: none;"><img src="image/Other/ProductDashboard.jpg" alt="" id="headerImage" width="250px"/></a>
                                    </div>
                                    <div class="col-md-12" id="dashboardCard">
                                        <div class="card-body">
                                            <a href="manager" style="text-decoration: none;"><h5 class="card-title" id="total">Total Products</h5></a>
                                            <a href="manager" style="text-decoration: none;"><h5 class="card-title" id="amount">${totalProduct}</h5></a>
                                            <a href="manager" style="text-decoration: none;"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4" id="borderCard">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-12">
                                        <a href=""><img src="image/Other/InvoiceDashboard.jpg" alt="" id="headerImage" width="250px"/></a>
                                    </div>
                                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                                        <div class="col-md-12" id="dashboardCard">
                                            <div class="card-body">
                                                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><h5 class="card-title" id="total">Total Invoices</h5></a>
                                                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><h5 class="card-title" id="amount">${totalCart}</h5></a>
                                                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.isAdmin != 1}">
                                        <div class="col-md-12">
                                            <div class="card-body">
                                                <a style="text-decoration: none;" href ="viewInvoiceDetailAdmin?sellerId=${sessionScope.acc.id}&orderId=1"><h5 class="card-title">Total Invoices</h5></a>
                                                <a style="text-decoration: none;" href ="viewInvoiceDetailAdmin?sellerId=${sessionScope.acc.id}&orderId=1"><h5 class="card-title">${totalCart}</h5></a>
                                                <a style="text-decoration: none;" href ="viewInvoiceDetailAdmin?sellerId=${sessionScope.acc.id}&orderId=1"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-5">
<!--                            <canvas id="myChart3" style="width:100%;max-width:900px"></canvas>

                                                        <script>
                                                            var xValues = [""];
                                                            var yValues = [0];
                                                            let a = 0;
                            
                                                            while (a < 32) {
                            <c:forEach var="o" items="${recentOrder}">
                                xValues[a] = "${o.date}";
                                a++;
                            </c:forEach>
                            }

                            xValues[32] = "";
                            yValues[32] = 0;

                            let b = 0;
                            while (b < 32) {
                            <c:forEach var="o" items="${recentOrder}">
                                yValues[b] = "${o.id}";
                                b++;
                            </c:forEach>
                            }
                            var barColors = [];
                            var tempColors = ["#85deb4", "#cb97e6", "#97b5e6"];

                            for (let c = 0; c < 32; c++) {
                                if (c % 3 == 1) {
                                    barColors[c] = tempColors[0];
                                } else if (c % 3 == 2) {
                                    barColors[c] = tempColors[1];
                                } else if (c % 3 == 0) {
                                    barColors[c] = tempColors[2];
                                }
                            }

                            barColors[32] = "white";

                            new Chart("myChart3", {
                                type: "bar",
                                data: {
                                    labels: xValues,
                                    datasets: [{
                                            backgroundColor: barColors,
                                            data: yValues
                                        }]
                                },
                                options: {
                                    legend: {display: false},
                                    title: {
                                        display: true,
                                        text: "Recent Orders"
                                    }
                                }
                            });
                        </script>-->
                        </div>

                        <div class="col-7">
                            <div id="piechart" style="width: 900px; height: 500px;"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-5">
                            <h3>Most Selling Product</h3>
                            <c:forEach var="o" items="${top3MostSellD}">
                                <h6>${o.name}</h6>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-5">
                            <h3>Least Selling Product</h3>
                            <c:forEach var="o" items="${top3LeastSellD}">
                                <h6>${o.name}</h6>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                                </div>
                                <br>
                            </c:forEach>
                        </div>
                        <div class="col-1"></div>
                    </div>

                </div>
            </div>
        </div>







        <!--        <div class="container">
                    <div class="row">
                        <div class="col-3">
                            <nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
                                <a class="navbar-brand" href="dashBoard"><img src="image/MenuLogo.png" width="200px"></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
        
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link" href="home">Home</a>
                                    </li>
        <c:if test="${sessionScope.acc == null}">
            <li class="nav-item">
                <a class="nav-link" href="login">Login</a>
            </li>
        </c:if>
        <c:if test = "${sessionScope.acc != null}">
            <li class="nav-item">
                <a class="nav-link text-info" href="profile">Hello ${sessionScope.acc.user}</a>
            </li>
            <c:if test="${sessionScope.acc.isSell == 1}">
                <li class="nav-item">
                    <a class="nav-link" href="manager">Manager Product</a>
                </li> 
            </c:if>
            <c:if test="${sessionScope.acc.isAdmin == 1}">
                <li class="nav-item">
                    <a class="nav-link" href="accountManager">Manager Account</a>
                </li> 
            </c:if>
        </c:if>
    
        <li class="nav-item">&nbsp;
        </li> 
    </ul>
    </nav>
    </div>
    <div class="col-6">
    <section class="jumbotron text-center" style="background-color: white;">
    <div class="container">
        <h1 class="jumbotron-heading"><img src="image/MainLogo.png" alt="Main Logo" width="60%"/></h1>
        <p class="lead text-muted mb-0">Điện thoại, Tablet, Laptop, Phụ kiện chính hãng giá tốt...</p>
    </div>
    </section>
    </div>
    </div>
    <div class="row" style="margin-top: 20px;">
    <div class="col-4">
    <div class="card mb-3" style="max-width: 540px;">
    <div class="row g-0">
        <div class="col-md-4">
            <a href="accountManager" style="text-decoration: none;"><img src="image/AccountIcon.png" alt="..." width="70%;"></a>
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <a href="accountManager" style="text-decoration: none;"><h5 class="card-title">Total Accounts</h5></a>
                <a href="accountManager" style="text-decoration: none;"><h5 class="card-title">${totalAccount}</h5></a>
                <a href="accountManager" style="text-decoration: none;"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
            </div>
        </div>
    </div>
    </div>
    </div>
    <div class="col-4">
    <div class="card mb-3" style="max-width: 540px;">
    <div class="row g-0">
        <div class="col-md-4">
            <a href="manager" style="text-decoration: none;"><img src="image/ProductIcon.png" alt="..." width="70%;"></a>
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <a href="manager" style="text-decoration: none;"><h5 class="card-title">Total Products</h5></a>
                <a href="manager" style="text-decoration: none;"><h5 class="card-title">${totalProduct}</h5></a>
                <a href="manager" style="text-decoration: none;"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
            </div>
        </div>
    </div>
    </div>
    </div>
    <div class="col-4">
    <div class="card mb-3" style="max-width: 540px;">
    <div class="row g-0">
        <div class="col-md-4">
            <a href=""><img src="image/InvoiceIcon.png" alt="..." width="70%;" style="margin-top: 10px;"></a>
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><h5 class="card-title">Total Invoices</h5></a>
                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><h5 class="card-title">${totalCart}</h5></a>
                <a style="text-decoration: none;" href ="viewAllInvoicesAdmin"><p class="card-text"><small class="text-muted">Last updated 1 mins ago</small></p></a>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
        -->
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
