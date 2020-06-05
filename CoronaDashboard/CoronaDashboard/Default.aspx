<%@ Page Title="Home Page" Language="C#" Debug="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CoronaDashboard.data" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

    <%="" %>
           
    <p id="para" runat="server"></p>
    
<%-- --------------------------------------CHART------------------------------------------------%>

    <div class="chart">

        <h2>Testdata</h2>

        <canvas id="myChart" width="400" height="100"></canvas>

            <script>
                var ctx = document.getElementById('myChart').getContext('2d');
                var data = [];

                    var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: [<%=DataStringLabels()%>],
                        datasets: [{
                        label: 'ecdc',
                            data: [<%=DataStringCases()%>],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                    responsive: true,
                        maintainAspectRatio: true,
                        scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            </script>
        </div>
    <%------------- --------------------------------------CHART END----------------------------------------------     --%>
</asp:Content>
