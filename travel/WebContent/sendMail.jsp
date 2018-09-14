<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>bootstrap4</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"	rel="stylesheet">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {
			var $html = $(".note-editable.card-block").html();
/* 			console.log("start")
			console.log($html);
			$("#showResult").html($html); */

			$.ajax({
				url : "./SendMail?action=sendMail",
				data : {
					contents : $html
				},
				type : "post",
				success : function(result) {
					console.log(result);
					console.log($html);
				}
			});// end of ajax
		});
	});
</script>
</head>
<body>
	<div id="summernote"></div>
	<script>
		$('#summernote').summernote({
			placeholder : 'Hello bootstrap 4',
			tabsize : 2,
			height : 350,
		});
	</script>
	<button id="btn">Send Subscrib</button>
</body>
</html>
