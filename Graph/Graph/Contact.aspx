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

             <div id="slidecontainer" style="width: 300px; height: 80px; float: left">
                 <p>Custom Correction Country 1:</p>
                <input type="range" min="-4" max="4" value="0" step="1" id="correctCountry1">
                <p><span id="demo"></span></p>
            </div>

            <div id="slidecontainer2" style="width: 300px; height: 80px; float: right; ">
                <p>Custom Correction Country 2:</p>
                <input type="range" min="-4" max="4" value="0" step="1" id="correctCountry2">
                <p><span id="demo2"></span></p>
            </div>

            <input id="btn_line_chart" type="button" value="Show" />
            <input id="hideJhu" type="button" value="JHU" />
            <input id="hideEcdc" type="button" value="ECDC" />
        </div>

    <div id="Data">
        <br />
        <canvas id="myChart" height="100" width="300"></canvas>

        <canvas id="myChart2" height="100" width="300"></canvas>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct country FROM hopkins_data
"></asp:SqlDataSource>

    <%-- script to draw Graph with WebService --%>
    <script src="Scripts/TwoCharts.js"></script>

    <%-- script for range slider --%>
    <script src="Scripts/SliderValue.js"></script>
</asp:Content>