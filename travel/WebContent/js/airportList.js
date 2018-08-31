$(document).ready(function() {	
		$("#btn").click(function() {
			getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});

		
		$("#txt3").keyup(function(e) {
			if (e.keyCode == 13)
				getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});
	});
	
	function getAirLine(from , to , date) {
		
		console.log(from + to + date);
		$.ajax({
				url : "https://api.flightstats.com/flex/schedules/rest/v1/json/from/"+from+"/to/"+to+"/departing/"+date+"?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590&extendedOptions=languageCode:ko",
				dataType: 'json', 
				success : function(datas) {
					console.log(datas);
					var dataSet = [];
					
					for (var i = 0; i < datas.scheduledFlights.length; i++) {
						for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
				        	if(datas.scheduledFlights[i].carrierFsCode == datas.appendix.airlines[j].fs){
				        		airlines = datas.appendix.airlines[j].name;
							}
				        } 
						var dataArr = [];
						dataArr.push(datas.scheduledFlights[i].departureAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].departureTime.substring(11,16))
						dataArr.push(datas.scheduledFlights[i].arrivalAirportFsCode)
						dataArr.push(datas.scheduledFlights[i].arrivalTime.substring(11,16))
						dataArr.push(datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber)
	 					dataArr.push(airlines);		 /*
						dataArr.push("<img src='../img/스페인2.jpg'/>"); */
						dataArr.push("<img src='../img/스페인2.jpg'/>");						
						dataSet.push(dataArr);
						
					}
					console.log(dataSet);
					$('#realTime').DataTable({
						destroy: true,
				        data: dataSet,
				        columns: [
				            { title: "From" },
				            { title: "Depart.Time" },
				            { title: "To" },
				            { title: "Arrial.Time" },
				            { title: "AirLine" },
				            { title: "AirCode" },
				            { title: "price" }, 
						]
					});					
				}
			});
}