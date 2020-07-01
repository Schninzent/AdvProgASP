var slider = document.getElementById("correctCountry1");
var output = document.getElementById("demo");
output.innerHTML = slider.value;
slider.oninput = function () {
    output.innerHTML = this.value;
}

var slider2 = document.getElementById("correctCountry2");
var output2 = document.getElementById("demo2");
output.innerHTML = slider2.value;


slider2.oninput = function () {
    output2.innerHTML = this.value;
}