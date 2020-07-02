//display empty Graphs
var ctx = document.getElementById("rkiChart").getContext("2d");
window.myChart = new Chart(ctx, { type: "line" });

//on click create graphs with data from services
$(document).ready(function () {
    $("#btn_rki_chart").on("click",
        function () {
            
            var aLabels;
            var rkiCountry1;
            var rkiCountry2;


            //on click get values from html
            var cntryOne = $("#MainContent_ddl_BundesLandOne").val();
            var cntryTwo = $("#MainContent_ddl_BundesLandTwo").val();
            var opt = $("#ddlRkiOption").val();

            //values to JSON
            var jsonData = JSON.stringify({
                countryOne: cntryOne,
                countryTwo: cntryTwo,
                option: opt
            });

            //send JSON values to the Graph services and call get*Data Method
            $.ajax({
                type: "POST",
                url: "RKIservice.asmx/getRkiData",
                data: jsonData, //JSON data to be send to the server
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: onSuccess,
                error: onErrorCall
            });


            //on success fill Chart data with ajax response data
            function onSuccess(response) {
                // alert("success function");
                var aData = response.d; //response.d to get jquery ajax response
                 aLabels = aData[0];
                 rkiCountry1 = aData[1];
                 rkiCountry2 = aData[2];

                if (window.rkiChart instanceof Chart) {
                    window.rkiChart.destroy();
                }

                var ctx = document.getElementById('rkiChart').getContext('2d');

                window.rkiChart = new Chart(ctx,
                    {
                        type: 'line',
                        data: {
                            labels: aLabels,
                            datasets: [
                                {
                                    label: cntryOne,
                                    data: rkiCountry1,
                                    borderColor: [
                                        '#1b9e77'
                                    ],
                                    borderWidth: 1
                                },
                                {
                                    label: cntryTwo,
                                    data: rkiCountry2,
                                    borderColor: [
                                        '#d95f02'
                                    ],
                                    borderWidth: 1
                                }
                            ]
                        }
                    });
            }

            function onErrorCall(repo) {
                alert("Woops something went wrong, pls try later !");
            }
        });
});