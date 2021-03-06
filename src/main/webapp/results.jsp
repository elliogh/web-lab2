<%--suppress HtmlUnknownTarget --%>
<%@ page import="java.lang.Math" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="results" scope="session" class="beans.ResultsBean"/>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Результат</title>
    <link href="resources/lebedev.png" rel="icon" type="image/png">
    <link href="styles.css" rel="stylesheet" type="text/css"/>
    <style>
        .content_block#get_back_button_block {
            min-height: 0;
            max-height: none;
            padding-top: 50px;
            padding-bottom: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: fit-content;
        }
        #foreground-canvas, #background-canvas, #graph-picture {
            cursor: crosshair;
        }
    </style>
</head>
<header>
    <div id="header_text">
        Лабораторная работа №2, Целиков Данил Игоревич, группа P3212, вариант 48919
    </div>
</header>
<body>
<div class="content">
    <h1>Проверка попадания точки в выделенную площадь</h1>
    <div id="content_blocks">
        <div class="content_block" id="graph-picture">
            <canvas id="background-canvas" style="z-index: 0" width="500" height="500"></canvas>
            <canvas id="foreground-canvas" style="z-index: 1" width="500" height="500"></canvas>
        </div>
        <div class="content_block" id="get_back_button_block">
            <button class="special_button" onclick="location.href='${pageContext.request.contextPath}/checkPoints'">Вернуться на главную</button>
        </div>
        <div class="content_block" id="results">
            <table id="results_table">
                <thead>
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Результат</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="result" items="${results.results}">
                    <tr>
                        <td class="x-td">${result.x}</td>
                        <td class="y-td">${result.y}</td>
                        <td class="r-td">${result.radius}</td>
                        <td class="success-td">${result.successful ? "<span class='successful'>Попадание</span>"
                                : "<span class='missed'>Мимо</span>"}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<footer>
    <div id="footer_text">
        Санкт-Петербург <br>
        Ноябрь, 2021
    </div>
</footer>
<script>
    let contextPath = "${pageContext.request.contextPath}";
</script>
<script src="canvas.js"></script>
<script src="main.js"></script>
<script>
    rResultValue = <%=Math.round(results.getResults().getFirst().getRadius())%>;
</script>
</html>