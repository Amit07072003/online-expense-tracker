<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<!-- Prepare Chart Data with JSTL -->
<script>
    const categoryLabels = [];
    const categoryData = [];
    <c:forEach var="entry" items="${categoryData}">
        categoryLabels.push("${entry.key}");
        categoryData.push(${entry.value});
    </c:forEach>
</script>

<div >
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
        <button class="btn btn-info" onclick="showChart('overview')">Overview</button>
        <button class="btn btn-info" onclick="showChart('category')">By Category</button>
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
