<%@ Page Title="Home Page" Language="C#" Debug="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CoronaDashboard.Data" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

    <%="" %>
           
    <p id="para" runat="server"></p>
    
<%-- --------------------------------------CHART------------------------------------------------%>

    <div class="chart">

        <h2>Testdata</h2>

        <canvas id="myChart" width="400" height="200"></canvas>

            <script>
                var ctx = document.getElementById('myChart').getContext('2d');
                var data = [];

                    var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: [<%=DataStringLabels()%>],
                        datasets: [{
                        label: 'Germany', 
                            data: [<%=DataStringCases()%>],
                        borderColor: [
                                '#1b9e77'
                            ],
                            borderWidth: 1
                        },
                            {
                                label: 'US',
                                data: [<%=UsDataStringCases()%>],
                                borderColor: [
                                    '#d95f02'
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
