<%@ page import="java.util.List" %>
<%@ page import="HealthServer.Users" %>
<%@ page import="HealthServer.Sleep" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Sleep> ONE = (List<Sleep>) request.getAttribute("sleep");
    //System.out.println(ONE.get(0).getId());
%>
<html>
<head>
    <title>运动检测</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts@latest"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-4">
            <h2>睡眠时间</h2>
            <div id="sleepChart"></div>
        </div>
        <div class="col-lg-4">
            <h2>心率</h2>
            <div id="heartRateChart"></div>
        </div>
        <div class="col-lg-4">
            <h2>血氧</h2>
            <div id="oxygenChart"></div>
        </div>
    </div>
</div>
    <%--<%
        List<Sleep> list = (List<Sleep>)request.getAttribute("sleep");
        int index=0;
        if(list!=null)
            for(Sleep a:list){
    %>
    <input type="hidden" value="<%=a.getSleeplength()%>" id="<%=index%>">
    <%
                index++;
            }  %>--%>

<%--<% if(x < ONE.size() - 1 && ONE.get(x+1).getDate().getDay()!=ONE.get(x).getDate().getDay()+1){
                System.out.println("'0',");
            }--%>
<%--<% if(x < ONE.size() - 1 && ONE.get(x+1).getDate().getTime() != ONE.get(x).getDate().getTime() + 86400000){
                System.out.println("'0',");
            }--%>

<script>
    var sleepOptions = {
        series: [{
            name: '睡眠时间',
            data: [ <% for (int x = 0; x < ONE.size(); x++) { %>
                <%= (ONE.get(x).getSleeplength())/60 %>,
                <% if (x < ONE.size() - 1 && ONE.get(x+1).getDate().getDay()!=ONE.get(x).getDate().getDay()+1) { %>
                null,
                <% } %>
                <% } %>]
        }],
        chart: {
            height: 350,
            type: 'bar',
        },
        xaxis: {
            categories: [
                <% for (int x = 0; x < ONE.size(); x++) { %>
                '<%= ONE.get(x).getDate().getYear()+1900+"."+(ONE.get(x).getDate().getMonth()+1)+"."+ ONE.get(x).getDate().getDate()%>',
                <% if (x < ONE.size() - 1 && ONE.get(x+1).getDate().getDay()!=ONE.get(x).getDate().getDay()+1) { %>
                ,
                <% } %>
                <% } %>
            ]
        },
        colors: ['#2196F3']
    };

    /*    for(index=0;index<6;index++) {
            sleepOptions.series[0].data[index] = (window.document.getElementById(index.toString())).value;
        }*/

    var heartRateOptions = {
        series: [{
            name: '心率',
            data: [72, 75, 80, 85, 78, 82, 76]
        }],
        chart: {
            height: 350,
            type: 'line',
        },
        xaxis: {
            type: 'datetime',
            categories: [
                '2023-07-06T00:00:00',
                '2023-07-06T01:00:00',
                '2023-07-06T02:00:00',
                '2023-07-06T03:00:00',
                '2023-07-06T04:00:00',
                '2023-07-06T05:00:00',
                '2023-07-06T06:00:00'
            ]
        },
        colors: ['#FFC985']
    };

    var oxygenOptions = {
        series: [{
            name: '血氧',
            data: [98, 97, 96, 95, 98, 99, 97]
        }],
            chart: {
            height: 350,
            type: 'line',
        },
        xaxis: {
            type: 'datetime',
            categories: [
                '2023-07-06T00:00:00',
                '2023-07-06T01:00:00',
                '2023-07-06T02:00:00',
                '2023-07-06T03:00:00',
                '2023-07-06T04:00:00',
                '2023-07-06T05:00:00',
                '2023-07-06T06:00:00'
            ]
        },
        colors: ['#FFC985']
    };

    var sleepChart = new ApexCharts(document.querySelector("#sleepChart"), sleepOptions);
    sleepChart.render();

    var heartRateChart = new ApexCharts(document.querySelector("#heartRateChart"), heartRateOptions);
    heartRateChart.render();

    var oxygenChart = new ApexCharts(document.querySelector("#oxygenChart"), oxygenOptions);
    oxygenChart.render();

</script>
</body>
</html>