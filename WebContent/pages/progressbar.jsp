<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Barra de Progresso</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">

#myProgress{
	width: 100%;
	background-color: #ddd;
}

#myBar{
	width: 1%;
	height: 30px;
	background-color: #4CAF50;
}

.ui-progressbar{
	position: relative;
}

.progress-label{
	position: relative;
	left: 50%;
	top: 4%;
	font-weight: bold;
	text-shadow: 1px 1px 0 #fff;
}

</style>

</head>
<body>
	<h1>Exemplo com JavaScript</h1>
	<div id="myProgress">
		<div id="myBar">
		
		</div>
	</div>
	<br/>
	<button onclick="exibirBarra()">Iniciar Barra</button>
	<br/>
	<h1>Exemplo com jQuery</h1>
	<div id="progressbar">
		<div class="progress-label">
			Carregando...
		</div>
	</div>
</body>





<script type="text/javascript">

//Script jQuery
$(function() {
	var progressbar = $("#progressbar"),
	progresslabel = $(".progress-label");
	
	progressbar.progressbar ({
		value : false,
		change : function (){
			progresslabel.text(progressbar.progressbar('value') + "%");
		},
		complete : function () {
			progresslabel.text('Completo!');
		}
	});
	
	function progress() {
		var val = progressbar.progressbar("value") || 0;
		
		progressbar.progressbar("value", val + 2);
		if(val < 99){
			setTimeout(progress, 80);
		}
	}
	
	setTimeout(progress, 2000);
	
});

//Script JS
function exibirBarra() {
	var element = document.getElementById("myBar");
	var width = 1;
	var id = setInterval(frame, 10);
	
	function frame(){
		if(width >= 100){
			clearInterval(id);
		}else{
			width++;
			element.style.width = width + "%";
		}
	}
}

</script>

</html>