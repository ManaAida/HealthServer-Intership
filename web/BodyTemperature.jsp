<%--
  Created by IntelliJ IDEA.
  User: tabin
  Date: 13/7/2023
  Time: 下午3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>体温数据折线图</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    @media (max-width: 1080px) {
      .container {
        max-width: 100%;
      }
    }
  </style>

</head>
<body>
<div class="container">
  <h2>体温数据折线图</h2>
  <canvas id="chart"></canvas>
  <div class="text-center">
  </div>
</div>
<!-- <div class="card">
   <div class="card-body text-center">
       <button id="prev-btn" class="btn btn-primary zoom-in-btn flex-grow-1">&lt; 上一天</button>
       <button id="next-btn" class="btn btn-primary zoom-in-btn flex-grow-1">下一天 &gt;</button>

       <p class="card-text">点击返回上一页</p>
       <button type="button" class="btn btn-primary zoom-in-btn flex-grow-1" onclick="goBack()">返回</button>
   </div>
 </div> -->
<div class="footer">
    <div class="text-center">
    <div class="d-flex justify-content-between align-items-center">
        <button id="prev-btn" class="btn btn-primary">上一天</button>
          <span id="chart-day"></span>
        <button id="next-btn" class="btn btn-primary">下一天</button>
    </div>
    <div class="card-body text-center">
      <div class="text-center mt-4">

        <button class="btn btn-primary" onclick="goBack()">点击返回上一页</button>
      </div>
    </div>
    </div>
</div>


<script>
  document.addEventListener("DOMContentLoaded", function () {
    var currentIndex = 6; // 初始值为6，即显示最近一天的数据

    var bodyTemperatureData = [
      [36.7, 36.8, 36.9, 37.1, 37.0, 36.9, 37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8],
      [36.8, 36.9, 37.1, 37.0, 36.9, 37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8, 37.2],
      [36.9, 37.1, 37.0, 36.9, 37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8, 37.2, 37.1],
      [37.1, 37.0, 36.9, 37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8, 37.2, 37.1, 37.3],
      [37.0, 36.9, 37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8, 37.2, 37.1, 37.3, 37.0],
      [36.9, 37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8, 37.2, 37.1, 37.3, 37.0, 36.9],
      [37.2, 37.3, 37.4, 37.2, 37.1, 37.0, 36.9, 37.0, 37.3, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.2, 36.9, 36.8, 37.2, 37.1, 37.3, 37.0, 36.9, 37.3]
    ];

    var daysOfWeek = [];
    var currentDate = new Date();

    for (var i = 6; i >= 0; i--) {
      var date = new Date(currentDate);
      date.setDate(date.getDate() - i);
      var day = date.toLocaleDateString('zh-CN', { year: 'numeric', month: '2-digit', day: '2-digit' });
      var dayOfWeek = date.toLocaleDateString('zh-CN', { weekday: 'long' });
      daysOfWeek.push(dayOfWeek + " - " + day);
    }

    var ctx = document.getElementById("chart").getContext("2d");

    var chartOptions = {
      scales: {
        y: {
          beginAtZero: false,
          min: 35.4,
          max: 37.8
        }
      }
    };

    var lineChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: Array.from(Array(24).keys()),
        datasets: [{
          label: "体温数据",
          data: bodyTemperatureData[currentIndex],
          borderColor: "rgba(205,75,255,0.89)",
          tension: 0.3
        }]
      },
      options: chartOptions
    });

    function updateChart() {
      lineChart.data.datasets[0].data = bodyTemperatureData[currentIndex];
      lineChart.update();
      document.getElementById("chart-day").innerHTML = "当前：" + daysOfWeek[currentIndex];
    }

    document.getElementById("prev-btn").addEventListener("click", function () {
      if (currentIndex > 0) {
        currentIndex--;
        updateChart();
      }
    });

    document.getElementById("next-btn").addEventListener("click", function () {
      if (currentIndex < bodyTemperatureData.length - 1) {
        currentIndex++;
        updateChart();
      }
    });

    updateChart();
  });
</script>
<script>
  function goBack() {
    history.back();
  }
</script>
</body>
</html>
