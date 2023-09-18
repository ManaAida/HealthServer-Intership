<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Apple</title>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Apple</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Mac</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">iPad</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">iPhone</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Watch</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">TV</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Music</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Support</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 主要内容 -->
<header class="bg-dark text-white text-center py-5">
    <h1 class="display-4">Welcome to Apple</h1>
    <p class="lead">Experience the best in technology and innovation.</p>
    <a class="btn btn-primary" href="#" role="button">Learn More</a>
</header>

<section class="container my-5">
    <h2 class="text-center mb-4">Latest Products</h2>
    <div class="row">
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card">
                <img src="product1.jpg" class="card-img-top" alt="Product 1">
                <div class="card-body">
                    <h5 class="card-title">Product 1</h5>
                    <p class="card-text">Description of Product 1.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card">
                <img src="product2.jpg" class="card-img-top" alt="Product 2">
                <div class="card-body">
                    <h5 class="card-title">Product 2</h5>
                    <p class="card-text">Description of Product 2.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card">
                <img src="product3.jpg" class="card-img-top" alt="Product 3">
                <div class="card-body">
                    <h5 class="card-title">Product 3</h5>
                    <p class="card-text">Description of Product 3.</p>
                    <a href="#" class="btn btn-primary">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="bg-light text-center py-4">
    <p>© 2023 Apple Inc. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>