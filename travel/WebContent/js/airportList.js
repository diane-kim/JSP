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
		var price;
		
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
						//임의대로 가격 설정부분.
						price = Math.floor(Math.random() * 10000)+100;
						price = price.toString().substring(0,3);
						price = price + ",000";
						
						dataArr.push(datas.scheduledFlights[i].departureAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].departureTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].arrivalAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].arrivalTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber);
	 					dataArr.push(airlines);		 
	 					/* dataArr.push("<img src='../img/스페인2.jpg'/>"); */
						dataArr.push(price);	
						dataArr.push("<button type='submit' >예약</button>"); 
						dataArr.push("<input type='hidden' name='param' value='departureAirportFsCode=dataArr[0]&departureTime=dataArr[1]'");
						console.log(dataArr[1]);
						
						//console.log($("input[name=departureAirportFsCode]").val(dataArr[0]));	
						console.log($("input[name=departureTime]").val(dataArr[1]));	
						$("input[name=arrivalAirportFsCode]").val(dataArr[2]);	
						$("input[name=arrivalTime]").val(dataArr[3]);	
						$("input[name=carrierFsCode]").val(dataArr[4]);	
						
						
						console.log(dataArr);
						dataSet.push(dataArr);		
					}
					
					/*console.log(dataSet);*/
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
				            { title: "예약" }
						]
					});					
				}
			});
}