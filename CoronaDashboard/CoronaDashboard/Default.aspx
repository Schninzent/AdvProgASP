<%@ Page Title="Home Page" Language="C#" Debug="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CoronaDashboard.data" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

    <%--<div class="jumbotron">
        <h1>Corona Dashboard +</h1>
        <p class="lead">This dashboard not only shows the most important numbers of the current corona situation, it also gives you the opportunity to choose from which source you want to see the data.</p>
    </div>--%>

    <%--<div class="filter">
        <p class="lead">
            <asp:Button class="btn" ID="DataButtonRki" runat="server" Text="RKI" BorderStyle="None" Width="320px" />
            <asp:Button class="btn" ID="DataButtonEcdc" runat="server" BorderStyle="None" Text="ECDC" Width="320px" />
            <asp:Button class="btn" ID="DataButtonJh" runat="server" BorderStyle="None" Text="JH" Width="320px" />
        </p>
    </div>--%>

    <%="" %>
           
    <p id="para" runat="server"></p>
    
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
    
       

    <div class="myGrid">
        <h2>ECDC data :: Total cases</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1173px" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
                <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                <asp:BoundField DataField="continentExp" HeaderText="continentExp" SortExpression="continentExp" />
                <asp:BoundField DataField="countriesAndTerritories" HeaderText="countriesAndTerritories" SortExpression="countriesAndTerritories" />
                <asp:BoundField DataField="cases" HeaderText="cases" SortExpression="cases" />
                <asp:BoundField DataField="deaths" HeaderText="deaths" SortExpression="deaths" />
                <asp:BoundField DataField="popData" HeaderText="popData" SortExpression="popData" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:coronadataConnectionString %>" ProviderName="<%$ ConnectionStrings:coronadataConnectionString.ProviderName %>" SelectCommand="SELECT year, month, day, continentExp, countriesAndTerritories, cases, deaths, popData FROM ecdc_data ORDER BY year DESC, month DESC, day DESC LIMIT 1000"></asp:SqlDataSource>
    </div>

    
</asp:Content>
