<%@ page import="HealthServer.Bloodoxygen" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Bloodoxygen> ONE = (List<Bloodoxygen>) request.getAttribute("week");
    List<Bloodoxygen> TWO = (List<Bloodoxygen>) request.getAttribute("day2");
    List<Bloodoxygen> THREE = (List<Bloodoxygen>) request.getAttribute("day3");
    List<Bloodoxygen> FOUR = (List<Bloodoxygen>) request.getAttribute("day4");
    List<Bloodoxygen> FIVE = (List<Bloodoxygen>) request.getAttribute("day5");
    List<Bloodoxygen> SIX = (List<Bloodoxygen>) request.getAttribute("day6");
    List<Bloodoxygen> SEVEN = (List<Bloodoxygen>) request.getAttribute("day7");
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>血氧数据折线图</title>
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
    <h1>24h血氧含量</h1>
    <div id="chartContainer" class="chart-container">
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
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var currentIndex = 6; // 初始值为6，即显示最近一天的数据

        var bloodOxygenData = [
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= SEVEN.get(x).getBloodoxygen()%>,
                <% } %>],
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= SIX.get(x).getBloodoxygen()%>,
                <% } %>],
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= FIVE.get(x).getBloodoxygen()%>,
                <% } %>],
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= FOUR.get(x).getBloodoxygen()%>,
                <% } %>],
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= THREE.get(x).getBloodoxygen()%>,
                <% } %>],
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= TWO.get(x).getBloodoxygen()%>,
                <% } %>],
            [<% for (int x = 0; x < ONE.size(); x++) { %>
                <%= ONE.get(x).getBloodoxygen()%>,
                <% } %>]
        ];

        var daysOfWeek = [];
        var currentDate = new Date(<%=ONE.get(6).getDatetime().getYear()+1900%>,<%=ONE.get(6).getDatetime().getMonth()%>,<%=ONE.get(6).getDatetime().getDate()%>);

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
                    label: "血氧数据",
                    data: bloodOxygenData[currentIndex],
                    borderColor: "rgb(0,178,255)",
                    tension: 0.3
                }]
            },
            options: chartOptions
        });

        function updateChart() {
            lineChart.data.datasets[0].data = bloodOxygenData[currentIndex];
            lineChart.update();
            document.getElementById("chart-day").innerHTML = "日期：" + daysOfWeek[currentIndex];
        }
        document.getElementById("prev-btn").addEventListener("click", function () {
            if (currentIndex > 0) {
                currentIndex--;
                updateChart();
            }
        });

        document.getElementById("next-btn").addEventListener("click", function () {
            if (currentIndex < bloodOxygenData.length - 1) {
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