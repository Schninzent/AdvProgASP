<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Graph.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>

    <div id="Options" style="width: 978px; height: 114px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Sans-Serif;">
            <asp:DropDownList ID="ddl_one" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
            </asp:DropDownList>

            <asp:DropDownList ID="ddl_two" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
            </asp:DropDownList>

            <select id="ddlOption">
                <option value="cases">Cases</option>
                <option value="deaths">Deaths</option>
            </select>

            <input type="checkbox" id="cumulative" name="Cumulative" value="total">
            <label for="cumulative">Cumulative</label>

            <%-- <input type="checkbox" id="corrected" name="" value="total"> --%>
            <%-- <label for="corrected">Correct</label> --%>
        
             <div id="slidecontainer" style="width: 158px; height: 78px">

                <p>Custom Correction:</p>
                <input type="range" min="-4" max="4" value="0" step="1" id="correctlist">
                <p>Value: <span id="demo"></span></p>
            </div>
            
            <input id="btn_line_chart" type="button" value="Show" />
            <input id="hideJhu" type="button" value="JHU" />
            <input id="hideEcdc" type="button" value="ECDC" />
           
        </div>

    <div id="Data">
        <br/>
        <canvas id="myChart" height="100" width="300"></canvas>

        <canvas id="myChart2" height="100" width="300"></canvas>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct country FROM hopkins_data
"></asp:SqlDataSource>

    <script src="Scripts/TwoCharts.js"></script>
    
    <%-- script for range slider --%>
    <script>
        var slider = document.getElementById("correctlist");
        var output = document.getElementById("demo");
        output.innerHTML = slider.value;

        slider.oninput = function () {
            output.innerHTML = this.value;
        }
    </script>

</asp:Content>