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
                //                        url: "ECDCservice.asmx/GetEcdcData",
                data: jsonData, //JSON data to be send to the server
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //                        success: onSuccessEcdc,
                success: onSuccess,
                error: onErrorCall
            });

            //on success fill Chart data with ajax response data
            function onSuccess(response) {
                // alert("success function");
                var aData = response.d; //response.d to get jquery ajax response
                var aLabels = aData[0];
                var aDatasets1 = aData[1];
                var aDatasets2 = aData[2];

                if (window.myChart2 instanceof Chart) {
                    window.myChart2.destroy();
                }

                var ctx = document.getElementById('myChart').getContext('2d');
              
                window.myChart2 = new Chart(ctx,
                    {
                        type: 'line',
                        data: {
                            labels: aLabels,
                            datasets: [
                                {
                                    label: src + " " +  cntryOne,
                                    data: aDatasets1,
                                    borderColor: [
                                        '#1b9e77'
                                    ],
                                    borderWidth: 1
                                },
                                {
                                    label: src + " " + cntryTwo,
                                    data: aDatasets2,
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