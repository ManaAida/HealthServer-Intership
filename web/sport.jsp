<%--
  Created by IntelliJ IDEA.
  User: tabin
  Date: 13/7/2023
  Time: 下午3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sports Duration Tracker</title>

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
  <h1 class="mt-4">运动记录数据</h1>
  <div id="chartContainer" class="chart-container">
    <canvas id="chart"></canvas>
  </div>
  <div class="text-center mt-4">
    <div class="d-flex justify-content-between align-items-center">
      <button id="prevBtn" class="btn btn-primary">上一天</button>
      <div id="dateContainer"></div>
      <button id="nextBtn" class="btn btn-primary">下一天</button>
    </div>
  </div>
</div>
    <div class="text-center mt-4">
      <button class="btn btn-primary" onclick="goBack()">点击返回上一页</button>
  </div>

<!-- 引入 Bootstrap JS 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var weeklyData = [

      [
        { "category": "运动总时长", "duration": 120 },
        { "category": "有氧运动时长", "duration": 73 },
        { "category": "无氧运动时长", "duration": 49 },
      ],
      [
        { "category": "运动总时长", "duration": 144 },
        { "category": "有氧运动时长", "duration": 110 },
        { "category": "无氧运动时长", "duration": 34 },
      ],
      [
        { "category": "运动总时长", "duration": 152 },
        { "category": "有氧运动时长", "duration": 100 },
        { "category": "无氧运动时长", "duration": 52 },
      ],
      [
        { "category": "运动总时长", "duration": 120 },
        { "category": "有氧运动时长", "duration": 73 },
        { "category": "无氧运动时长", "duration": 49 },
      ],
      [
        { "category": "运动总时长", "duration": 144 },
        { "category": "有氧运动时长", "duration": 110 },
        { "category": "无氧运动时长", "duration": 34 },
      ],
      [
        { "category": "运动总时长", "duration": 152 },
        { "category": "有氧运动时长", "duration": 100 },
        { "category": "无氧运动时长", "duration": 52 },
      ],
      [
        { "category": "运动总时长", "duration": 114 },
        { "category": "有氧运动时长", "duration": 80 },
        { "category": "无氧运动时长", "duration":34 },
      ],

      // Add data for the remaining days of the week
      // ...

    ];

    var currentDay = 0;
    var maxDays = weeklyData.length;

    var chartId = "chart";
    var ctx = document.getElementById(chartId).getContext("2d");
    var chartInstance;

    function updateChart(day) {
      if (chartInstance) {
        chartInstance.destroy();
      }

      var data = weeklyData[day];

      var labels = data.map(function(item) {
        return item.category;
      });

      var durations = data.map(function(item) {
        return item.duration;
      });

      chartInstance = new Chart(ctx, {
        type: "bar",
        data: {
          labels: labels,
          datasets: [
            {
              label: "运动总时长",
              data: durations,
              backgroundColor: [
                "rgba(255, 99, 132, 0.5)",
                "rgba(54, 162, 235, 0.5)",
                "rgba(255, 206, 86, 0.5)",
                "rgba(75, 192, 192, 0.5)"
              ],
              borderColor: [
                "rgb(255, 99, 132)",
                "rgb(54, 162, 235)",
                "rgb(255, 206, 86)",
                "rgb(75, 192, 192)"
              ],
              borderWidth: 1
            }
          ]
        },
        options: {
          responsive: true,
          scales: {
            x: {
              display: true,
              title: {
                display: true,
                text: "Sleep Category"
              }
            },
            y: {
              display: true,
              title: {
                display: true,
                text: "Duration (mins)"
              },
              suggestedMin: 0,
              suggestedMax: 10
            }
          }
        }
      });
    }

    function updateDate(day) {
      var currentDate = new Date();
      currentDate.setDate(currentDate.getDate() - (maxDays - day));
      var dateContainer = document.getElementById("dateContainer");
      dateContainer.innerHTML = currentDate.toLocaleDateString("zh-CN", { weekday: "long", year: "numeric", month: "long", day: "numeric" });
    }

    function prevDay() {
      if (currentDay > 0) {
        currentDay--;
        updateChart(currentDay);
        updateDate(currentDay);
      }
    }

    function nextDay() {
      if (currentDay < maxDays - 1) {
        currentDay++;
        updateChart(currentDay);
        updateDate(currentDay);
      }
    }

    updateChart(currentDay);
    updateDate(currentDay);

    var prevBtn = document.getElementById("prevBtn");
    var nextBtn = document.getElementById("nextBtn");

    prevBtn.addEventListener("click", prevDay);
    nextBtn.addEventListener("click", nextDay);
  });
</script>
<script>
  function goBack() {
    history.back();
  }
</script>
</body>
</html>