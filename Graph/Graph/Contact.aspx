<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Graph.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <link href="~/Content/StyleSheet1.css" rel="stylesheet" type="text/css" media="screen" runat="server"/>

    <div style="float: left; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Sans-Serif; margin-left: 30px; width: 1280px;">

        <p id="para">Was geht</p>

        <asp:DropDownList ID="ddl_one" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
        </asp:DropDownList>

        <asp:DropDownList ID="ddl_two" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
        </asp:DropDownList>

        <select id="ddlOption">
            <option value="cases">Cases</option>
            <option value="deaths">Deaths</option>
        </select>

        <input id="btn_line_chart" type="button" value="Show"/>
        <input id="hideJhu" type="button" value="JHU"/>
        <input id="hideEcdc" type="button" value="ECDC"/>


        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct country FROM hopkins_data
"></asp:SqlDataSource>
    </div>
    <br/>

    <div id="ecdc">
        <canvas id="myChart" height="100" width="300"></canvas>
    </div>
    <div id="jhu">
        <canvas id="myChart2" height="100" width="300"></canvas>
    </div>

    <script src="Scripts/TwoCharts.js"></script>


</asp:Content>