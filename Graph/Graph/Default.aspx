<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Graph._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct countriesAndTerritories FROM ecdc_data"></asp:SqlDataSource>

    <%-- <div style="float: left; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Sans-Serif; margin-left: 30px; width: 1280px; text-align: center"> --%>
    <div class="container">   
        <div class="row">
            <h2>CHOOSE THE SOURCES YOU WANT TO COMPARE</h2>
            <input id="ECDC" type="button" value="ECDC" />
            <input id="JHU" type="button" value="JHU" />
        </div>
    </div>
    
    <div class="row">
        <div class="span">
            <div class="table">
                <table id="dtVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Checked</th>
                        <th>Spalte 1</th>
                        <th>Spalte 2</th>
                        <th>Spalte 3</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="tableDefaultCheck2">
                                <label class="custom-control-label" for="tableDefaultCheck2">Check 2</label>
                            </div>
                        </th>
                        <th>cell 1</th>
                        <th>cell 2</th>
                        <th>cell 3</th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
    <div class="span">
        <div class="dropdowns">
            <asp:DropDownList ID="ddl_one" runat="server" DataSourceID="SqlDataSource1" DataTextField="countriesAndTerritories" DataValueField="countriesAndTerritories">
            </asp:DropDownList>

            <asp:DropDownList ID="ddl_two" runat="server" DataSourceID="SqlDataSource1" DataTextField="countriesAndTerritories" DataValueField="countriesAndTerritories">
            </asp:DropDownList>

            <select id="ddlOption">
                <option value="cases">cases</option>
                <option value="deaths">deaths</option>
            </select>
                
            <select id="ddl_Source">
                <option value="ecdc_data">ECDC</option>
                <option value="hopkins_data">JHU</option>
            </select>
            <input id="btn_line_chart" type="button" value="Show" />
        </div>

        <div class="graphs">
            <canvas id="myChart" height="100" width="300"></canvas>

            <script>
                $(document).ready(function () {
                    $("#btn_line_chart").on('click',
                        function () {
                            //on click get values from html
                            var cntryOne = $('#MainContent_ddl_one').val();
                            var cntryTwo = $('#MainContent_ddl_two').val();
                            var opt = $('#ddlOption').val();
                            var src = $('#ddl_Source').val();

                            //values to JSON
                            var jsonData = JSON.stringify({
                                countryOne: cntryOne,
                                countryTwo: cntryTwo,
                                option: opt,
                                source: src
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

                                window.bar = new Chart(ctx,
                                    {
                                        type: 'line',
                                        data: {
                                            labels: aLabels,
                                            datasets: [
                                                {
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
                                                }
                                            ]
                                        },
                                    });

                            }

                            function onErrorCall(repo) {
                                alert("Woops something went wrong, please try again later!");
                            }
                        });

                });
            </script>
        </div>
    </div>
</div>
    

</asp:Content>