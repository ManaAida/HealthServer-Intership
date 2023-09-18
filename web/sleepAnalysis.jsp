<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="HealthServer.Sleep" %>
<%@ page import="java.util.List" %>
<%
    List<Sleep> ONE = (List<Sleep>) request.getAttribute("sleepweek");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>睡眠总时长</title>

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
    <h3 class="mt-4">睡眠时间</h3>
    <div id="chartContainer" class="chart-container">
        <canvas id="chart"></canvas>
    </div>
    <div class="text-center mt-4">
        <div class="d-flex justify-content-between align-items-center">
            <button id="prevBtn" class="btn btn-primary">上一天</button>
            <div id="dateContainer"></div>
            <button id="nextBtn" class="btn btn-primary">下一天</button>
        </div>
        <div class="text-center mt-4">
            <button class="btn btn-primary" onclick="goBack()">点击返回上一页</button>
        </div>
    </div>
</div>

<!-- 引入 Bootstrap JS 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var data = [<% for (int x = 0; x < ONE.size(); x++) { %>
            <%= (ONE.get(x).getSleeplength())/60 %>,
            <% if (x < ONE.size() - 1 && ONE.get(x+1).getDate().getDate()!=ONE.get(x).getDate().getDate()+1) { %>
            null,
            <% } %>
            <% } %>];

        var weeklyData = data.reverse().map(function(duration) {
            return [
                { category: "总睡眠时长", duration: duration },
                { category: "浅睡眠", duration: duration*0.3 },
                { category: "快速眼动", duration: duration*0.2 },
                { category: "深睡眠", duration: duration*0.55 }
            ];
        });


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
                            label: "睡眠时长",
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
                                text: "睡眠统计"
                            }
                        },
                        y: {
                            display: true,
                            title: {
                                display: true,
                                text: "所用时间(h)"
                            },
                        }
                    }
                }
            });
        }

        function updateDate(day) {
            var currentDate = new Date(<%=ONE.get(ONE.size()-1).getDate().getYear()+1900%>,<%=ONE.get(ONE.size()-1).getDate().getMonth()%>,<%=ONE.get(ONE.size()-1).getDate().getDate()%>);
            currentDate.setDate(currentDate.getDate() - day);
            var dateContainer = document.getElementById("dateContainer");
            dateContainer.innerHTML = currentDate.toLocaleDateString("zh-CN", { weekday: "long", year: "numeric", month: "long", day: "numeric" });
        }

        function nextDay() {
            if (currentDay > 0) {
                currentDay--;
                updateChart(currentDay);
                updateDate(currentDay);
            }
        }

        function prevDay() {
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