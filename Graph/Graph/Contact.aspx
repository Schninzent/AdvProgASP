<%@ Page Title="Graph" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Graph.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent"  runat="server">
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <style>
        .my-container {
            border: 1px solid black;
        }
       
        /* .charts { height: 200px; }  */
        </style>

    <div class="container my-container" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Sans-Serif; height: 619px;">
        
        <div class="row options">
            <div class="col-lg">
                <select id="ddlOption">
                    <option value="cases">Cases</option>
                    <option value="deaths">Deaths</option>
                </select>
                <input id="hideJhu" type="button" value="JHU"/>
                <input id="hideEcdc" type="button" value="ECDC"/>
                <input id="btn_line_chart" type="button" value="Update"/>

                <input type="checkbox" id="cumulative" name="Cumulative" value="total">
                <label for="cumulative">Cumulative</label>


            </div>

        </div>

        <div class="row cntryOptions">
            <div class="col-lg cntryOneOptions">
                <asp:DropDownList ID="ddl_one" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
                </asp:DropDownList>
                
                <div id="slidecontainer" >
                    <p>Custom Correction Country 1:</p>
                    <input type="range" min="-4" max="4" value="0" step="1" id="correctCountry1">
                    <p>
                        <span id="demo"></span>
                    </p>
                </div>
            </div>
            
            <div class="col-lg cntryTwoOptions">
                <asp:DropDownList ID="ddl_two" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country">
                </asp:DropDownList>
                
                
                <div id="slidecontainer2" >
                    <p>Custom Correction Country 2:</p>
                    <input type="range" min="-4" max="4" value="0" step="1" id="correctCountry2">
                    <p>
                        <span id="demo2"></span>
                    </p>
                </div>
            </div>
        </div>
        
        <div class="row charts">
            <div class="col-lg">
                <canvas id="myChart" ></canvas>
            </div>
            
            <div class="col-lg">
                <canvas id="myChart2"></canvas>

            </div>
        </div>

      
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" ProviderName="<%$ ConnectionStrings:dashboardConnectionString.ProviderName %>" SelectCommand="SELECT distinct country FROM hopkins_data
"></asp:SqlDataSource>

    <%-- script to draw Graph with WebService --%>
    <script src="Scripts/TwoCharts.js"></script>

    <%-- script for range slider --%>
    <script src="Scripts/SliderValue.js"></script>
</asp:Content>