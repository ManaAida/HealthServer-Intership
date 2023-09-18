<%@ page import="HealthServer.Weight" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%
  List<Weight> ONE = (List<Weight>) request.getAttribute("bodyweight");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>体重记录</title>

  <!-- 引入 Bootstrap CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <!-- 自定义 CSS 样式 -->
  <style>
    @media (max-width: 1080px) {
      .container {
        max-width: 100%;
      }
    }
  </style>

  <!-- 引入 Chart.js 库 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
</head>
<body>
<div class="container">
  <h1 class="mt-4">体重记录</h1>
  <div>
    <canvas id="chart"></canvas>
  </div>
</div>
<div class="text-center mt-4">
    <button class="btn btn-primary" onclick="goBack()">点击返回上一页</button>
  </div>
</div>

<!-- 引入 Bootstrap JS 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var data1=[<% for (int x = 0; x < ONE.size(); x++) { %>
      <%= ONE.get(x).getWeight() %>,
      <% if (x < ONE.size() - 1 && ONE.get(x+1).getDate().getDate()!=ONE.get(x).getDate().getDate()+1) { %>
      null,
      <% } %>
      <% } %>]
    var data = [
      <% for (int i = 0; i < ONE.size(); i++) { %>
      { month: "<%= 1900+ONE.get(i).getDate().getYear()+"."+ONE.get(i).getDate().getMonth()+"."+ONE.get(i).getDate().getDate() %>", weight: <%= ONE.get(i).getWeight() %> },
      <% } %>
    ];

    var ctx = document.getElementById("chart").getContext("2d");

    var labels = data.map(function(item) {
      return item.month;
    });

    var weights = data.map(function(item) {
      return item.weight;
    });

    new Chart(ctx, {
      type: "line",
      data: {
        labels: labels,
        datasets: [{
          label: "体重",
          data: weights,
          borderColor: "rgba(255,153,0,0.89)",
          fill: false
        }]
      },
      options: {
        responsive: true,
        scales: {
          x: {
            display: true,
            title: {
              display: true,
              text: "月"
            }
          },
          y: {
            display: true,
            title: {
              display: true,
              text: "体重 (kg)"
            }
          }
        }
      }
    });
  });
</script>
<script>
  function goBack() {
    history.back();
  }
</script>
</body>
</html>