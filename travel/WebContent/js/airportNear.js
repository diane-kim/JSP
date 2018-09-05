$(document).ready(function() {
	$("#btn4").click(function() {
		getLocation();
		//getAirLine1();
	});
	$("#btn4").click();


	var latitude;
	var longitude;
	var map;
	var iterator = 0;
	var iConArray = [];
	var markerArray = []; // 마커들을 저장하는 배열
	var polylineArray = []; // 그릴 경로를 저장하는 배열

	function getLocation() {
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				//alert(position.coords.latitude + ' ' + position.coords.longitude);
				//latitude = position.coords.latitude;
				//longitude = position.coords.longitude;

				longitude = position.coords.longitude;
				latitude = position.coords.latitude;
				console.log("longtitude2 : " + longitude);
				console.log("latitude2 : " + latitude);
				////////////////////////
				$.ajax({
					url: "https://api.flightstats.com/flex/airports/rest/v1/json/withinRadius/" + longitude + "/" + latitude + "/30?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590",
					dataType: 'json',
					success: function(datas) {
						console.log(longitude);
						console.log(latitude);
						console.log(datas);								
						
						iConArray[0] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
						iConArray[1] = "http://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
						
						var airportlatitude = datas.airports[0].latitude;
						var airportlongitude = datas.airports[0].longitude;
						
						// marker를 찍을 위도,경도
						markerArray[0] = new google.maps.LatLng(latitude, longitude);
						markerArray[1] = new google.maps.LatLng(airportlatitude, airportlongitude);
						// 경로를 표시한 위도,경도
						polylineArray[0] = new google.maps.LatLng(latitude, longitude);
						polylineArray[1] = new google.maps.LatLng(airportlatitude, airportlongitude);
						
						console.log("airportlatitude : " + airportlatitude);
						console.log("airportlongitude : " + airportlongitude);
						
						$(function() {
							var x = function(a, b) {
								var mapOptions = {
										zoom: 12,
										zoomControl: true,
										streetViewControl: false,
										draggable: true,
										mapTypeId: google.maps.MapTypeId.ROADMAP,
										center: new google.maps.LatLng(a, b)
								};
								map = new google.maps.Map(document.getElementById('map1'), mapOptions);
								
								for (var i = 0; i < markerArray.length; i++) {
									addMarker();
								}
								addPolyline();
							}
							google.maps.event.addDomListener(window, 'load', x(airportlatitude,airportlongitude));
						});
						
						function addPolyline() {

							var lineSymbol = {
								path : google.maps.SymbolPath.FORWARD_CLOSED_ARROW
							};

							var flightPath = new google.maps.Polyline({
								path : polylineArray,
								icons : [ {
									icon : lineSymbol,
									offset : '100%'
								} ],
								geodesic : true,
								strokeColor : "#0000FF",
								strokeOpacity : 1.0,
								strokeWeight : 2
							});

							flightPath.setMap(map);
						}
						// 마커 추가
						function addMarker() {
							var marker = new google.maps.Marker({
								position : markerArray[iterator],
								animation : google.maps.Animation.BOUNCE,
								map : map,
								draggable : false,
								icon : iConArray[iterator]
							});
							// markers.push(marker);

							var infowindow = new google.maps.InfoWindow({
								content : contentArray[iterator]
							});

							google.maps.event.addListener(marker, 'click', function() {
								infowindow.open(map, marker);
							});

							iterator++;
						}
					},
				});
				////////////////////////
			}, function(error) {
				console.log(error);
			}, {
				enableHighAccuracy: false,
				maximumAge: 0,
				timeout: Infinity
			});
		} else {
			alert('GPS를 지원하지 않습니다');
		}
	}
});



/*function getAirLine1() {
    console.log("longtitude1 : " + longitude);
    console.log("latitude1 : " + latitude);
    $.ajax({

        url: "https://api.flightstats.com/flex/airports/rest/v1/json/withinRadius/" + longitude + "/" + latitude + "/30?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590",
        dataType: 'json',
        success: function(datas) {
            console.log(latitude);
            console.log(longitude);

            console.log(datas);


            var map;

            $(function() {
                var x = function(a, b) {
                    var mapOptions = {
                        zoom: 12,
                        zoomControl: true,
                        streetViewControl: false,
                        draggable: true,
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        center: new google.maps.LatLng(a, b)
                    };
                    map = new google.maps.Map(document.getElementById('map'), mapOptions);
                }
                google.maps.event.addDomListener(window, 'load', x(latitude,longitude));
            });
        },
    });
}*/