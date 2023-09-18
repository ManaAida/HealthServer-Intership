<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 引入 Bootstrap CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <title>思源健康数据总览</title>
</head>
<body>

<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="#">My Website</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#services">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#portfolio">Portfolio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#contact">Contact</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- 主页内容 -->
<section id="home" class="py-5 text-center">
  <div class="container">
    <h1>Welcome to Our Website</h1>
    <p class="lead">Experience the best in web design and development.</p>
  </div>
</section>

<!-- 关于我们 -->
<section id="about" class="py-5 bg-light">
  <div class="container">
    <h2>About Us</h2>
    <p>This is a Health data VIEWING SYSTEM MADE BY HUSIYUAN, LIUQIANZHE, SHENLISHAI, FEIYANFEI FROM THE SCHOOL OF INFORMATION ENGINEERING</p>
  </div>
</section>

<!-- 服务 -->
<section id="services" class="py-5">
  <div class="container">
    <h2>Our Services</h2>
    <div class="row">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <img src="service1.jpg" class="card-img-top" alt="Service 1">
          <div class="card-body">
            <h5 class="card-title">Service 1</h5>
            <p class="card-text">Description of Service 1.</p>
            <a href="#" class="btn btn-primary">Read More</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <img src="service2.jpg" class="card-img-top" alt="Service 2">
          <div class="card-body">
            <h5 class="card-title">Service 2</h5>
            <p class="card-text">Description of Service 2.</p>
            <a href="#" class="btn btn-primary">Read More</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <img src="service3.jpg" class="card-img-top" alt="Service 3">
          <div class="card-body">
            <h5 class="card-title">Service 3</h5>
            <p class="card-text">Description of Service 3.</p>
            <a href="#" class="btn btn-primary">Read More</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 作品集 -->
<section id="portfolio" class="py-5 bg-light">
  <div class="container">
    <h2>Portfolio</h2>
    <div class="row">
      <div class="col-lg-4 col-md-6 mb-4">
        <img src="project1.jpg" class="img-fluid" alt="Project 1">
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <img src="project2.jpg" class="img-fluid" alt="Project 2">
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <img src="project3.jpg" class="img-fluid" alt="Project 3">
      </div>
    </div>
  </div>
</section>

<!-- 联系我们 -->
<section id="contact" class="py-5">
  <div class="container">
    <h2>Contact Us</h2>
    <form>
      <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Enter your name">
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" placeholder="Enter your email">
      </div>
      <div class="mb-3">
        <label for="message" class="form-label">Message</label>
        <textarea class="form-control" id="message" rows="5" placeholder="Enter your message"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</section>

<!-- 页脚 -->
<footer class="bg-light text-center py-4">
  <p>© 2023 My Website. All rights reserved.</p>
</footer>

<!-- 引入 Bootstrap JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>