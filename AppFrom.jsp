<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="HealthServer.Sleep" %>
<%@ page import="HealthServer.Heart" %>
<%@ page import="HealthServer.Bloodoxygen" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>

<%
    List<Sleep> Week = (List<Sleep>) request.getAttribute("sleepweek");
    List<Heart> hearts = (List<Heart>) request.getAttribute("heartweek");
    List<Bloodoxygen> oxygen = (List<Bloodoxygen>) request.getAttribute("oxygen");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数据总览</title>

    <!-- 引入Bootstrap样式 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-7ymO4nGrkm372HoSbq1OY2DP4pEZnMiA+E0F3zPr+JQQtQ82gQ1HPY3QIVtztVua" crossorigin="anonymous"></script>
    <style>
        .custom-text {
            color: rgba(128, 128, 128, 0.5);
            /* 或者使用十六进制颜色值 */
            /* color: #80808080; */
        }
    </style>
    <style>
        .custom-card {
            border: 2px solid rgba(128, 128, 128, 0.3) !important;
        }
    </style>
    <style>
        .card {
            border: 2px solid rgba(128, 128, 128, 0.3);
            background-image: radial-gradient(circle at center, rgba(255, 253, 250, 0.9), rgba(255, 255, 255, 0.72));
            background-clip: padding-box;
        }
    </style>


</head>

<body>
<div class="container mt-4">
    <div class="row">

        <div class="row mt-4">
            <div class="col">
                <h1 class="text-center">当日数据</h1>

                <!-- Card组 -->
                <div class="card-group">
                    <!-- 动态生成Card -->
                    <div class="card">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">心率</h5>

                            <!-- 嵌套的 Card -->
                            <div class="card">
                                <div class="card-header">
                                    心率数据
                                </div>
                                <div class="card-body">
                                    <canvas id="heartRateChart" width="400" height="200"></canvas>
                                </div>
                            </div>

                            <div class="mt-auto text-end">
                                <p class="card-text custom-text">点击进入详情</p>
                            </div>
                        </div>
                    </div>


                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">血氧</h5>
                            <div class="card custom-card">
                                <div class="card-header">
                                    血氧数据
                                </div>
                                <div class="card-body">
                                    <canvas id="oxygenChart" width="400" height="200"></canvas>
                                </div>
                            </div>
                            <div class="mt-auto text-end">
                                <p class="card-text custom-text">点击进入详情</p>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">睡眠</h5>
                            <div class="card">
                                <div class="card-header">
                                    近一周睡眠数据
                                </div>
                                <div class="card-body">
                                    <canvas id="sleepChart" width="400" height="200"></canvas>
                                </div>
                            </div>
                            <div class="mt-auto text-end">
                                <p class="card-text custom-text">点击进入详情</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <hr> -->
        <div class="col">
            <h3 class="text-center">数据监测</h3>

            <!-- Card组 -->
            <div class="card-group">
                <!-- 动态生成Card -->
                <div class="col">
                    <!-- 		    <h3 class="text-center">第一组</h3> -->

                    <!-- Card组 -->
                    <div class="card-group">
                        <!-- 动态生成Card -->
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">体重</h5>

                                <!-- 二级Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">月度体重管理</h6>
                                        <img src="体重.png" alt="你的体重无法显示">
                                    </div>
                                </div>
                                <div class="mt-auto text-end">
                                    <p class="card-text custom-text">点击进入详情</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">血糖</h5>
                                <!-- 二级Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">每日血糖管理</h6>
                                        <img src="血糖.png" alt="你的能量超乎想象">
                                    </div>
                                </div>
                                <div class="mt-auto text-end">
                                    <p class="card-text custom-text">点击进入详情</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">血压</h5>
                                <!-- 二级Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">每日血压管理</h6>
                                        <img src="血压.png" alt="这里本来应该看到你的血压，现在看来是看到我的了">
                                    </div>
                                </div>
                                <div class="mt-auto text-end">
                                    <p class="card-text custom-text">点击进入详情</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <!-- <h3 class="text-center">第二组</h3> -->
                    <!-- Card组 -->
                    <div class="card-group">
                        <!-- 动态生成Card -->
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">压力</h5>
                                <!-- 二级Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">月度压力管理</h6>
                                        <img src="压力.png" alt="放平心态，不过是图片没加载罢了Ծ‸Ծ">
                                    </div>
                                </div>
                                <div class="mt-auto text-end">
                                    <p class="card-text custom-text">点击进入详情</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">体温</h5>
                                <!-- 二级Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">每日体温管理</h6>
                                        <img src="体温.png" alt="哟，你脸红了，没发烧吧">
                                    </div>
                                </div>
                                <div class="mt-auto text-end">
                                    <p class="card-text custom-text">点击进入详情</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">运动</h5>
                                <!-- 二级Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">每日运动记录</h6>
                                        <img src="运动.png" alt="我爱运动哦皮肤好好">
                                    </div>
                                </div>
                                <div class="mt-auto text-end">
                                    <p class="card-text custom-text">点击进入详情</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>

<!-- 引入Bootstrap脚本 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 给每个Card添加点击事件
</script><!-- //点击事件 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // 获取canvas元素
    var heartRateCanvas = document.getElementById('heartRateChart');

    document.querySelectorAll('.card').forEach(card => {
        card.addEventListener('click', () => {
            console.log(`你点击了${card.querySelector('.card-title').textContent}`);
            if (card.querySelector('.card-title').textContent === '心率') {
                window.location.href = "HeartBest";
            }
            if (card.querySelector('.card-title').textContent === '血氧') {
                window.location.href = "bloodOxygen";
            }
            if (card.querySelector('.card-title').textContent === '睡眠') {
                window.location.href = "sleepAnalysis";
            }
            if (card.querySelector('.card-title').textContent === '体温') {
                window.location.href = "BodyTemperature.jsp";
            }
            if (card.querySelector('.card-title').textContent === '体重') {
                window.location.href = "bodyWeight";
            }
            if (card.querySelector('.card-title').textContent === '血糖') {
                window.location.href = "bodySuger";
            }
            if (card.querySelector('.card-title').textContent === '血压') {
                window.location.href = "bloodPreasure";
            }
            if (card.querySelector('.card-title').textContent === '压力') {
                window.location.href = "preasure.html";
            }
            if (card.querySelector('.card-title').textContent === '运动') {
                window.location.href = "sport.jsp";
            }
        });
    });
    // 创建Chart对象
    var heartRateChart = new Chart(heartRateCanvas, {
        type: 'line',
        data: {
            labels: [<% for (int x = 0; x < hearts.size(); x++) {%>
                '<%= hearts.get(x).getDatetime().getHours()+"h"%>',
                <% } %>],
            datasets: [{
                label: '心率',
                data: [<% for (int x = 0; x < hearts.size(); x++) { %>
                    <%= hearts.get(x).getHeartrate()%>,
                    <% } %>],
                borderColor: 'rgb(255,0,0)',
                backgroundColor: 'rgba(255,0,106,0.75)',
                tension: 0.4
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    suggestedMax: 120,
                    min :30
                }
            }
        }
    });

</script><!-- //心跳处理 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // 获取canvas元素
    var oxygenCanvas = document.getElementById('oxygenChart');

    // 创建Chart对象
    var oxygenChart = new Chart(oxygenCanvas, {
        type: 'line',
        data: {
            labels: [<% for (int x = 0; x < oxygen.size(); x++) { %>
                '<%=oxygen.get(x).getDatetime().getHours()+"h"%>',
                <% } %>],
            datasets: [{
                label: '血氧',
                data: [<% for (int x = 0; x < oxygen.size(); x++) { %>
                    <%= oxygen.get(x).getBloodoxygen()%>,
                    <% } %>],
                borderColor: 'rgb(0, 123, 255)',
                backgroundColor: 'rgba(0, 123, 255, 0.2)',
                tension: 0.4
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    suggestedMax: 100,
                    min: 80
                }
            }
        }
    });
</script><!-- //血氧处理 -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // 获取canvas元素
    var sleepCanvas = document.getElementById('sleepChart');

    // 创建Chart对象
    var sleepChart = new Chart(sleepCanvas, {
        type: 'bar',
        data: {
            labels: [<% for (int x = 0; x < Week.size(); x++) { %>
                '<%= Week.get(x).getDate().getYear()+1900+"."+(Week.get(x).getDate().getMonth()+1)+"."+ Week.get(x).getDate().getDate()%>',
                <% if (x < Week.size() - 1 && Week.get(x+1).getDate().getDate()!=Week.get(x).getDate().getDate()+1) { %>
                ,
                <% } %>
                <% } %>],
            datasets: [{
                label: '小时',
                data: [<% for (int x = 0; x < Week.size(); x++) { %>
                    <%= (Week.get(x).getSleeplength())/60 %>,
                    <% if (x < Week.size() - 1 && Week.get(x+1).getDate().getDate()!=Week.get(x).getDate().getDate()+1) { %>
                    null,
                    <% } %>
                    <% } %>],
                backgroundColor: function (context) {
                    var value = context.dataset.data[context.dataIndex];
                    if (value >= 6 && value <= 9) {
                        return "rgb(75, 192, 192)";
                    } else if (value >= 4 && value >= 9) {
                        return "rgb(255, 206, 86)";
                    } else {
                        return "rgb(255, 99, 132)";
                    }
                }
            }]
        },

        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    suggestedMax: 10
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
</script>


</body>

</html>