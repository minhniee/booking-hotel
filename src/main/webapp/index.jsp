<%--
    Document   : index
    Created on : May 22, 2024, 9:22:42 AM
    Author     : minhl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <%@include file="layout/header.jsp" %>
    <style>
        img {
            width: 400px; /* You can set the dimensions to whatever you want */
            height: 450px;
            object-fit: cover;
        }

        slider img {
            width: 100%; /* You can set the dimensions to whatever you want */
            height: 500px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<!-- begin slider  -->
<div id="carouselExampleCaptions" class="carousel slide slider">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="assets/deluxe_room_kit.jpg" class="d-block w-100 " alt="deo co ">
            <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="assets/executive_suite_kit.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some representative placeholder content for the second slide.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="assets/premium_room_kit.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!-- begin slider  -->

<!-- cotainer -->
<div class="container mt-5">
    <div class="row">
        <div class="col-sm-4">
            <img src="assets/deluxe_room_kit.jpg" alt="alt"/>
        </div>
        <div class="col-sm-4">
            <img src="assets/executive_suite_kit.jpg" alt="alt"/>
        </div>
        <div class="col-sm-4">
            <img src="assets/premium_room_kit.jpg" alt="alt"/>
        </div>
    </div>

</div>
<%@include file="layout/footer.jsp" %>

</html>
