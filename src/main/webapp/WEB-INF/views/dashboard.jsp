<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    body {
        background-color: #ccd;
        font-family: 'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif;
    }

    .dashboard-title {
        text-align: center;
        font-size: 2em;
        font-weight: bold;
        padding: 20px;
        background-color: #000;
        color: white;
    }

    .stats {
        display: flex;
        justify-content: center;
        gap: 20px;
        padding: 20px;
    }

    .stat-box {
        background: url('/images/fade.gif');
        border: 2px solid #99c;
        padding: 15px;
        background-color: #fff;
        min-width: 200px;
        text-align: center;
        font-size: 1.1em;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    }

    .button-group {
        text-align: center;
        margin: 20px;
    }

    .btn {
        font-weight: bold;
        background-color: #99c;
        color: #000;
        padding: 10px 20px;
        margin: 5px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #fff;
        color: #000;
    }

    .chart-container {
        width: 80%;
        margin: 0 auto 40px auto;
        padding: 20px;
        background-color: #fff;
        border: 2px solid #99c;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    }

    h3 {
        text-align: center;
        color: #000;
        margin-bottom: 20px;
    }
</style>

<!-- Prepare Chart Data with JSTL -->
<script>
    const categoryLabels = [];
    const categoryData = [];
    <c:forEach var="entry" items="${categoryData}">
        categoryLabels.push("${entry.key}");
        categoryData.push(${entry.value});
    </c:forEach>
</script>

<div>
    <h2 class="dashboard-title">Welcome, ${sessionScope.loggedInUser.username}</h2>

    <!-- Stats Section -->
    <div class="stats">
        <div class="stat-box">
            <p><strong>Total Expenses:</strong> ${totalExpense}</p>
        </div>
        <div class="stat-box">
            <p><strong>Remaining Balance:</strong> ${remainingBalance}</p>
        </div>
        <div class="stat-box">
            <p><strong>Monthly Income:</strong> ${monthlyIncome}</p>
        </div>
    </div>

    <!-- Toggle Buttons -->
    <div class="button-group">
        <button class="btn" onclick="showChart('overview')">Overview</button>
        <button class="btn" onclick="showChart('category')">By Category</button>
    </div>

    <!-- Charts -->
    <div id="overviewChartContainer" class="chart-container">
        <h3>Overview</h3>
        <canvas id="overviewChart"></canvas>
    </div>

    <div id="categoryChartContainer" class="chart-container" style="display: none;">
        <h3>Expenses by Category</h3>
        <canvas id="expenseChart"></canvas>
    </div>
</div>

<!-- Chart.js Logic -->
<script>
    function showChart(type) {
        document.getElementById('overviewChartContainer').style.display = (type === 'overview') ? 'block' : 'none';
        document.getElementById('categoryChartContainer').style.display = (type === 'category') ? 'block' : 'none';
    }

    document.addEventListener('DOMContentLoaded', () => {
        // Overview Chart
        const overviewCtx = document.getElementById('overviewChart')?.getContext('2d');
        if (overviewCtx) {
            new Chart(overviewCtx, {
                type: 'bar',
                data: {
                    labels: ['Monthly Income', 'Total Expenses', 'Remaining Balance'],
                    datasets: [{
                        label: 'Financial Overview',
                        data: [${monthlyIncome}, ${totalExpense}, ${remainingBalance}],
                        backgroundColor: ['#4bc0c0', '#ff6384', '#ffce56'],
                        borderColor: ['#4bc0c0', '#ff6384', '#ffce56'],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: { y: { beginAtZero: true } }
                }
            });
        }

        // Category-wise Chart
        const categoryCtx = document.getElementById('expenseChart')?.getContext('2d');
        if (categoryCtx) {
            new Chart(categoryCtx, {
                type: 'bar',
                data: {
                    labels: categoryLabels,
                    datasets: [{
                        label: 'Expenses by Category',
                        data: categoryData,
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: { y: { beginAtZero: true } }
                }
            });
        }
    });
</script>
