<%--
  Created by IntelliJ IDEA.
  User: tabin
  Date: 13/7/2023
  Time: 下午2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>血压数据折线图</title>
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
  <h2>血压数据折线图</h2>
  <canvas id="chart"></canvas>
</div>
  <div class="text-center">
    <div class="d-flex justify-content-between align-items-center">
    <button id="prev-btn" class="btn btn-primary">上一天</button>
      <div id="chart-day"></div>
    <button id="next-btn" class="btn btn-primary">下一天</button>
  </div>
    <div class="text-center mt-4">
      <button class="btn btn-primary" onclick="goBack()">点击返回上一页</button>
    </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    var currentIndex = 6; // 初始值为6，即显示最近一天的数据
    var totalDays = 7; // 显示的天数

    var bloodPressureData = [
      [110, 128, 126, 125, 127, 128, 130, 133, 135, 134, 132, 130, 129, 128, 127, 126, 124, 123, 122, 120, 118, 117, 116, 114],
      [90, 88, 86, 85, 87, 88, 90, 93, 95, 94, 92, 90, 89, 88, 87, 86, 84, 83, 82, 80, 78, 77, 76, 74],
      [120, 118, 116, 115, 117, 118, 120, 123, 125, 124, 122, 120, 119, 118, 117, 116, 114, 113, 112, 110, 108, 107, 106, 104],
      [80, 78, 76, 75, 77, 78, 80, 83, 85, 84, 82, 80, 79, 78, 77, 76, 74, 73, 72, 70, 68, 67, 66, 64],
      [110, 128, 126, 125, 127, 128, 130, 133, 135, 134, 132, 130, 129, 128, 127, 126, 124, 123, 122, 120, 118, 117, 116, 114],
      [90, 88, 86, 85, 87, 88, 90, 93, 95, 94, 92, 90, 89, 88, 87, 86, 84, 83, 82, 80, 78, 77, 76, 74],
      [120, 118, 116, 115, 117, 118, 120, 123, 125, 124, 122, 120, 119, 118, 117, 116, 114, 113, 112, 110, 108, 107, 106, 104],
      [80, 78, 76, 75, 77, 78, 80, 83, 85, 84, 82, 80, 79, 78, 77, 76, 74, 73, 72, 70, 68, 67, 66, 64],
      [110, 128, 126, 125, 127, 128, 130, 133, 135, 134, 132, 130, 129, 128, 127, 126, 124, 123, 122, 120, 118, 117, 116, 114],
      [90, 88, 86, 85, 87, 88, 90, 93, 95, 94, 92, 90, 89, 88, 87, 86, 84, 83, 82, 80, 78, 77, 76, 74],
      [120, 118, 116, 115, 117, 118, 120, 123, 125, 124, 122, 120, 119, 118, 117, 116, 114, 113, 112, 110, 108, 107, 106, 104],
      [80, 78, 76, 75, 77, 78, 80, 83, 85, 84, 82, 80, 79, 78, 77, 76, 74, 73, 72, 70, 68, 67, 66, 64],
      [110, 128, 126, 125, 127, 128, 130, 133, 135, 134, 132, 130, 129, 128, 127, 126, 124, 123, 122, 120, 118, 117, 116, 114],
      [90, 88, 86, 85, 87, 88, 90, 93, 95, 94, 92, 90, 89, 88, 87, 86, 84, 83, 82, 80, 78, 77, 76, 74],

    ];

    var currentDate = new Date(); // 获取当前日期
    var startDate = new Date(currentDate.getTime() - (totalDays - 1) * 24 * 60 * 60 * 1000); // 计算起始日期

    var dateLabels = [];

    for (var i = 0; i < totalDays; i++) {
      var date = new Date(startDate.getTime() + i * 24 * 60 * 60 * 1000);
      var dateString = date.toLocaleDateString("zh-CN", { year: 'numeric', month: '2-digit', day: '2-digit' });
      var dayOfWeek = getDayOfWeek(date);
      var labelString = dateString + " " + dayOfWeek;
      dateLabels.push(labelString);
    }

    var ctx = document.getElementById("chart").getContext("2d");

    var chartOptions = {
      scales: {
        y: {
          beginAtZero: false,
        }
      }
    };

    var lineChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: Array.from(Array(24).keys()),
        datasets: []
      },
      options: chartOptions
    });

    function updateChart() {
      lineChart.data.datasets = [{
        label: "高压",
        data: bloodPressureData[currentIndex],
        borderColor: "orange",
        tension: 0.3
      }, {
        label: "低压",
        data: bloodPressureData[currentIndex + 1],
        borderColor: "green",
        tension: 0.3
      }];
      lineChart.update();

      var chartDay = dateLabels[currentIndex / 2];
      document.getElementById("chart-day").innerText = chartDay;

      // 检查是否在允许的日期范围内，启用或禁用按钮
      var prevBtn = document.getElementById("prev-btn");
      var nextBtn = document.getElementById("next-btn");

      if (currentIndex <= 0) {
        prevBtn.disabled = true;
      } else {
        prevBtn.disabled = false;
      }

      if (currentIndex >= bloodPressureData.length - 2) {
        nextBtn.disabled = true;
      } else {
        nextBtn.disabled = false;
      }
    }

    document.getElementById("prev-btn").addEventListener("click", function () {
      if (currentIndex > 0) {
        currentIndex -= 2;
        updateChart();
      }
    });

    document.getElementById("next-btn").addEventListener("click", function () {
      if (currentIndex < bloodPressureData.length - 2) {
        currentIndex += 2;
        updateChart();
      }
    });

    updateChart();

    // 获取星期几
    function getDayOfWeek(date) {
      var days = ['日', '一', '二', '三', '四', '五', '六'];
      var day = date.getDay();
      return "星期" + days[day];
    }
  });
</script>
<script>
  function goBack() {
    history.back();
  }
</script>
</body>
</html>
