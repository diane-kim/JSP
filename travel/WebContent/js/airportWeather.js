$(document).ready(function() {	
		$("#btn3").click(function() {
			getAirLine1($("#txt4").val());
		});
});

	function getAirLine1(from) {

		$.ajax({
				url : "https://api.flightstats.com/flex/weather/rest/v1/json/metar/"+from+"?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590",
				dataType: 'json', 
				success : function(datas) {
					console.log(datas);
					var dataSet = [];
					var name;
					var city;
					var latitude;
					var longitude;
					var map;
					var value;
					var temperatureCelsius;
					var speedKnots;
					
					name = datas.appendix.airports[0].name;
					city = datas.appendix.airports[0].city;			
					latitude = datas.appendix.airports[0].latitude;
					longitude = datas.appendix.airports[0].longitude;	
					
					temperatureCelsius = datas.metar.temperatureCelsius;
					
					speedKnots = datas.metar.conditions.wind.speedKnots;
					
						
					document.getElementById("name").innerHTML = "공항 : "+ name;
					document.getElementById("city").innerHTML = "도시 : "+ city;
					document.getElementById("temperatureCelsius").innerHTML = "기온 : "+ temperatureCelsius;
					document.getElementById("speedKnots").innerHTML = "풍속 : "+ speedKnots + "m/s";		
					
					for(var i = 0 ; i< datas.metar.tags.length;i++){
						if(datas.metar.tags[i].key == "Prevailing Conditions"){
							value = datas.metar.tags[i].value;
						}
					}
					
					document.getElementById("weather").src = "./img/"+value+".png";
					
					
/*					base[0] = datas.metar.conditions.skyConditions[0].base;
					coverage[0] = datas.metar.conditions.skyConditions[0].coverage;	
					document.getElementById("city").innerHTML = "./img/"+coverage[0]+".jpg";
					
					for(var i = 0 ; i< datas.metar.conditions.skyConditions.length ; i++){
						base[i] = datas.metar.conditions.skyConditions[i].base;
						coverage[i] = datas.metar.conditions.skyConditions[i].coverage;	
						document.getElementById("coverage").innerHTML = "반경 "+base[i]+"./img/"+coverage[i]+".jpg";
					}*/
					
/*					for(var i = 0; i < datas.metar.conditions.skyConditions.length ; i++){
						base[i] = datas.metar.conditions.skyConditions[i].base;
						coverage[i] = datas.metar.conditions.skyConditions[i].coverage;	
						console.log(base[i]);
						console.log(coverage[i]);
					}*/
					
					console.log(value);
					
					$(function() {								
						var x = function(a, b) {
							var mapOptions = {
								zoom : 12,
								zoomControl : true,
								streetViewControl : false,
								draggable : true,
								mapTypeId : google.maps.MapTypeId.ROADMAP,
								center : new google.maps.LatLng(a, b)
							};												
							map = new google.maps.Map(document.getElementById('map'), mapOptions);							
						}
						google.maps.event.addDomListener(window, 'load',x(latitude,longitude));		
						
					});			
				}				
		});		
}
	
