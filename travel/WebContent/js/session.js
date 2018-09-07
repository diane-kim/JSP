var contury = ['인천','서울','부산','제주','홍콩','타이페이','마카오','상하이','베이징','칭다오','도쿄','싱가포르','방콕','마닐라','쿠알라룸프르','하노이','런던','파리','로마','로스앤젤레스','뉴욕','샌프란시스코'];
var iata = ['ICN','GMP','PUS','CJU','HKG','TPE',    'MFM','SHA',   'PEK', 'TAO', 'NRT',   'SIN', 'DMK', 'MNL',    'KUL',   'HAN',  'LCY','BVA','CIA','LAX',      'JFK','SFO' ];

$(function(){ 
	$(".dia_bt").click(function(){ 
		$(".dropdown-content").css("display","block");			

		$(".contury").click(function(){ 		
			$(".dropdown-content").css("display","none");	
			var i = $(".contury").index(this);			
			console.log($(".contury").index(this));				
			$("input[name=f]").val(contury[i] +"(" +iata[i] + ")");
			console.log(contury[i] + iata[i]);
		});
	});	
});

$(function(){ 
	$(".dia_bt2").click(function(){ 
		$(".dropdown2-content").css("display","block");	
		$(".tocontury").click(function(){ 
			$(".dropdown2-content").css("display","none");	
			var i = $(".tocontury").index(this);			
			console.log($(".tocontury").index(this));		
			$("input[name=t]").val(contury[i] +"(" +iata[i] + ")");				
		});
	});
});