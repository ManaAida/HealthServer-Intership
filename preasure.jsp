<%--
  Created by IntelliJ IDEA.
  User: tabin
  Date: 13/7/2023
  Time: 下午3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>系统压力评估测试</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
    }

    h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .data-container {
      display: flex;
      justify-content: center;
      margin-top: 30px;
    }

    .data-table {
      border-collapse: collapse;
      width: 600px;
    }

    .data-table th,
    .data-table td {
      padding: 10px;
      border: 1px solid #ddd;
    }

    .data-table th {
      background-color: #f5f5f5;
      font-weight: bold;
    }

    .btn-primary {
      margin-top: 20px;
    }
  </style>
</head>
<body>
<div class="container">
  <h1 class="mt-5">压力水平评估及建议</h1>

  <div class="data-container">
    <table class="table data-table">
      <thead>
      <tr>
        <th>压力水平</th>
        <th>建议</th>
      </tr>
      </thead>
      <tbody>
      <script>
        const data = [
          { level: 1, advice: "您的压力评级为 1，表示很轻松。继续保持良好的心态和自我管理！" },
        ];

        data.forEach((item) => {
          document.write(`
                <tr>
                  <td>${item.level}</td>
                  <td>${item.advice}</td>
                </tr>
              `);
        });
      </script>
      </tbody>
    </table>
  </div>

  <button type="button" class="btn btn-primary" onclick="goBack()">点击返回上一页</button>
</div>

<script>
  function goBack() {
    history.back();
  }
</script>
</body>
</html>