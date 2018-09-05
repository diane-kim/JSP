$(document).ready(function() {
	$("#btn4").click(function() {
		getLocation();
		//getAirLine1();
	});
	$("#btn4").click();


	var latitude;
	var longitude;
	var map;

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
							}
							google.maps.event.addDomListener(window, 'load', x(latitude,longitude));
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