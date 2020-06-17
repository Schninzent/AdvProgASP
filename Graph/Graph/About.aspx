<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Graph.About" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.7.0/d3.min.js"></script>

    <h2>Cases in Germany</h2>

    <canvas id="chart" width="500" height="300"></canvas>

    <script>

        d3.csv('ger.csv').then(makeChart);
        function makeChart(period) {

            var casesData = period.map(function(d) { return d.cases });
            var periodLabels = period.map(function(d) { return d.dateRep });

            var chart = new Chart('chart', {
                type: 'line',

                data: {
                    labels: periodLabels,
                    datasets: [
                        {   label: 'Germany',
                            data: casesData,
                            borderColor: '#66c2a5'
                        }
                    ]

                },
                options: {
                    title: {
                        display: true,
                        text: 'Corona Cases'
                    },
                    legend: {
                        position: "top"
                    }
                }
            });
        }

       
    </script>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT [deaths], [dateRep] FROM [ecdc_data]"></asp:SqlDataSource>
    <asp:Chart ID="Chart1" runat="server">
        <series>
            <asp:Series Name="Series1">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>

</asp:Content>
