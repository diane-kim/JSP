$(document).ready(function() {
	$("#nearAirport").click(function(e) {
		e.preventDefault();
		getLocation();
		//getAirLine1();
});


var latitude;
var longitude;

	function getLocation() {
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				//alert(position.coords.latitude + ' ' + position.coords.longitude);
				//latitude = position.coords.latitude;
				//longitude = position.coords.longitude;
				console.log("longtitude2 : " + position.coords.longitude);
				console.log("latitude2 : " + position.coords.latitude);
				////////////////////////
				$.ajax({
					url: "https://api.flightstats.com/flex/airports/rest/v1/json/withinRadius/" + position.coords.longitude + "/" + position.coords.latitude + "/30?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590",
					dataType: 'json',
					success: function(datas) {
						console.log(position.coords.latitude);
						console.log(position.coords.longitude);
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
							google.maps.event.addDomListener(window, 'load', x(position.coords.latitude,position.coords.longitude));
						});
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