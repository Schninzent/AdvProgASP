<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Graph._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>

    <div style="float: left; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Sans-Serif; margin-left: 30px; width: 1280px;">

        <%-- <input type="checkbox" id="ECDC" name="ECDC" value="ecdc_data"> --%>
        <%-- <label for="ECDC">ECDC</label><br> --%>
        <%-- <input type="checkbox" id="JHU" name="JHU" value="hopkins_data"> --%>
        <%-- <label for="JHU">JHU</label><br> --%>

        <asp:DropDownList ID="ddl_one" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
        </asp:DropDownList>

        <asp:DropDownList ID="ddl_two" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
        </asp:DropDownList>

        <select id="ddlOption">
            <option value="cases">Cases</option>
            <option value="deaths">Deaths</option>
        </select>

        <select id="ddl_Source">
            <option value="ecdc_data">ECDC</option>
            <option value="hopkins_data">JHU</option>
        </select>
        <input id="btn_line_chart" type="button" value="Show"/>

        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct country FROM hopkins_data
"></asp:SqlDataSource>
    </div>
    <br/>

    <div>
        <canvas id="myChart" height="100" width="300"></canvas>
    </div>
    <div >
        <canvas id="myChart2" height="100" width="300"></canvas>
    </div>
    
    
    <script src="Scripts/DrawChart.js"></script>



</asp:Content>