<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Graph._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>

    <div style="float: left; margin-left: 30px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Sans-Serif; width: 1280px;">
        
        <asp:DropDownList ID="ddl_one" runat="server" DataSourceID="SqlDataSource1" DataTextField="geoID" DataValueField="geoID">
        </asp:DropDownList>
        <asp:DropDownList ID="ddl_two" runat="server" DataSourceID="SqlDataSource1" DataTextField="geoID" DataValueField="geoID">
        </asp:DropDownList>

        <select id="ddlOption">
            <option value="cases">cases</option>
            <option value="deaths">deaths</option>
        </select>
        <input id="btn_line_chart" type="button" value="Show" />
        
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct geoID FROM ecdc_data"></asp:SqlDataSource>
    </div>
    <br />

    <canvas id="myChart" height="100" width="300"> </canvas>

    
    
        <script>
        $(document).ready(function() {
            $("#btn_line_chart").on('click', function () {
                //on click get values from html 
                var cntryOne = $('#MainContent_ddl_one').val();
//                var cntryTwo = $('#ddl_two').val();
                var cntryTwo = $('#MainContent_ddl_two').val();
                var opt = $('#ddlOption').val();

                //values to JSON
                var jsonData = JSON.stringify({
                    countryOne: cntryOne,
                    countryTwo: cntryTwo,
                    option: opt
                });
                //send JSON values to GraphService and use getLineChartData Method
                $.ajax({
                    type: "POST",
                    url: "GraphService.asmx/getLineChartData",
                    data: jsonData, //JSON data to be send to the server
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onSuccess,
                    error: onErrorCall
                });

                //on success fill Chart data with ajax response data
                function onSuccess(response) {
                    //alert("success function");
                    var aData = response.d; //response.d to get jquery ajax response
                    var aLabels = aData[0];
                    var aDatasets1 = aData[1];
                    var aDatasets2 = aData[2];


                    var ctx = document.getElementById('myChart').getContext('2d');
                    //destroy old chart data
                    if (window.bar != undefined)
                        window.bar.destroy();

                    window.bar = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: aLabels,
                            datasets: [{
                                    label: cntryOne,
                                    data: aDatasets1,
                                    borderColor: [
                                        '#1b9e77'
                                    ],
                                    borderWidth: 1
                                },
                                {
                                    label: cntryTwo,
                                    data: aDatasets2,
                                    borderColor: [
                                        '#d95f02'
                                    ],
                                    borderWidth: 1
                                }]
                        }

//                        options: {
//                            responsive: true,
//                            maintainAspectRatio: true,
//                            scales: {
//                                yAxes: [{
//                                    ticks: {
//                                        beginAtZero: true
//                                    }
//                                }]
//                            }
//                        }
                    });

                }
                
                function onErrorCall(repo) {
                    alert("Woops something went wrong, pls try later !");
                }
            });


        });
        </script>

    

</asp:Content>
