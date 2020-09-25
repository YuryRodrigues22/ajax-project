<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Pagin Pai</h3>
	<input type="button" value="Carregar Pagina" onclick="carregar();">
	
	<div id="motraPaginaFilha"></div>
</body>

<script type="text/javascript">

function carregar(){
	
	$("#motraPaginaFilha").load('paginaFilha.jsp'); //Load Pagina jQuery
	
}

</script>
</html>