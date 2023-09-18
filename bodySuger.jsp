<%@ page import="HealthServer.BodySuger" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: tabin
  Date: 13/7/2023
  Time: 下午12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<BodySuger> ONE = (List<BodySuger>) request.getAttribute("bodysuger");
  List<BodySuger> TWO = (List<BodySuger>) request.getAttribute("day2");
  List<BodySuger> THREE = (List<BodySuger>) request.getAttribute("day3");
  List<BodySuger> FOUR = (List<BodySuger>) request.getAttribute("day4");
  List<BodySuger> FIVE = (List<BodySuger>) request.getAttribute("day5");
  List<BodySuger> SIX = (List<BodySuger>) request.getAttribute("day6");
  List<BodySuger> SEVEN = (List<BodySuger>) request.getAttribute("day7");
%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>血糖数据折线图</title>
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
  <h2>血糖数据折线图</h2>
  <canvas id="chart"></canvas>
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
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    var currentIndex = 6; // 初始值为6，即显示最近一天的数据

    var bodyTemperatureData =[
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= SEVEN.get(x).getBloodsugar()%>,
        <% } %>],
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= SIX.get(x).getBloodsugar()%>,
        <% } %>],
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= FIVE.get(x).getBloodsugar()%>,
        <% } %>],
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= FOUR.get(x).getBloodsugar()%>,
        <% } %>],
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= THREE.get(x).getBloodsugar()%>,
        <% } %>],
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= TWO.get(x).getBloodsugar()%>,
        <% } %>],
      [<% for (int x = 0; x < ONE.size(); x++) { %>
        <%= ONE.get(x).getBloodsugar()%>,
        <% } %>]
    ]
    var daysOfWeek = [];
    var currentDate = new Date(<%=ONE.get(23).getDatetime().getYear()+1900%>,<%=ONE.get(23).getDatetime().getMonth()%>,<%=ONE.get(23).getDatetime().getDate()%>);

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
        }
      }
    };

    var lineChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: Array.from(Array(24).keys()),
        datasets: [{
          label: "血糖数据",
          data: bodyTemperatureData[currentIndex],
          borderColor: "rgb(249,113,153)",
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
