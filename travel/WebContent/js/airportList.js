var from;
var to;
var fromdate;
var todate;
var num;
var seat;


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function reserv(param1,param2,param3,param4,param5,param6) {
f = param1;
t = param2;
fromdate = param3;
todate = param4;
num = param5;
seat = param6;
}

$(document).ready(function() {	
		$("#btn").click(function() {
			if (!$("#txt1").val()) {
				alert("출발공항을 입력해 주세요.");
				return false; 
			}else if(!$("#txt2").val()){
				alert("도착공항을 입력해 주세요.");
				return false; 
			}else if(!$("#txt3").val()){
				alert("날짜를 입력해 주세요.");
				return false; 
			}
			else{
			getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
			}
		});
	
		$("#btn2").click(function(){
			var tmp = document.getElementById('txt1').value;
			document.getElementById('txt1').value = document.getElementById('txt2').value;
			document.getElementById('txt2').value = tmp;
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
					var src;
					
					for (var i = 0; i < datas.scheduledFlights.length; i++) {
						for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
				        	if(datas.scheduledFlights[i].carrierFsCode == datas.appendix.airlines[j].fs){
				        		airlines = datas.appendix.airlines[j].name;
				        		src = "./img/"+airlines+".jpg";
							}
				        } 
						var dataArr = [];
						//임의대로 가격 설정부분.
						price = Math.floor(Math.random() * 900000)+50000;
						price1 = numberWithCommas(price);					
												
						dataArr.push(datas.scheduledFlights[i].departureAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].departureTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].arrivalAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].arrivalTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber);
	 					dataArr.push("<img src='"+src+"'/>"+airlines);	
						dataArr.push(price1);	
											
						dataArr.push("<a href='AirportReservation.al?from="+f+
								"&to="+t+
								"&fromdate="+fromdate+
								"&todate="+todate+
								"&num="+num+
								"&seat="+seat+								
								"&departureTime="+datas.scheduledFlights[i].departureTime.substring(11,16)+								
								"&arrivalTime="+datas.scheduledFlights[i].arrivalTime.substring(11,16)+
								"&airLine="+datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber+
								"&airCode="+airlines+
								"&price="+price+"'>예약</a>");				
						console.log(dataArr);
						dataSet.push(dataArr);		
					}
					
					$('#realTime').DataTable({
						destroy: true,
				        data: dataSet,
				        columns: [
				            { title: "From" },
				            { title: "Depart.Time" },
				            { title: "To" },
				            { title: "Arrial.Time" },
				            { title: "AirCode" },
				            { title: "AirLine" },
				            { title: "price" }, 
				            { title: "예약" }
						]
					});					
				}
			});
	}
// 공항 변경
/*	$("#btn2").click(function swap_content(){
		var tmp = document.getElementById('txt1').value;
		document.getElementById('txt1').value = document.getElementById('txt2').value;
		document.getElementById('txt2').value = tmp;
	});*/

/*	$("#btn").click(function check() {
		if (!$("#txt1").val()) {
			alert("출발공항을 입력해 주세요.");
			return false; 
		}else if(!$("#txt2").val()){
			alert("도착공항을 입력해 주세요.");
			return false; 
		}else if(!$("#txt3").val()){
			alert("날짜를 입력해 주세요.");
			return false; 
		}
	}); */
