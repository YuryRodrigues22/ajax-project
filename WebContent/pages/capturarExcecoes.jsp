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
	<h3>Capturando Exceções com Jquery</h3>
	<input type="text" value="Valor Informado" id="txtValor">
	<input type="button" onclick="testarExcecao();" value="Testar Exceção">
</body>

<script type="text/javascript">

	function testarExcecao() {
		
		var valorInformado = $('#txtValor').val();
		
		$.ajax({
			method: "POST",
			url: "capturarExcecao",
			data: { valorParam: valorInformado }
		})
		.done(function(response){ //Resposta ok - nenhum erro
				alert("Sucesso: " + response);
		})
		.fail(function(xhr, status, errorThrown){ //resposta erro - algum problema ocorreu
				alert("Error: " + xhr.responseText);
		});
		
		
	}

</script>

</html>