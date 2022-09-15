<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isErrorPage="true" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<style>
* {
	transition: all 0.6s;
}

html {
	height: 100%;
}

body {
	font-family: 'Lato', sans-serif;
	color: #888;
	margin: 0;
}

#main {
	display: table;
	width: 100%;
	height: 100vh;
	text-align: center;
}

.fof {
	display: table-cell;
	vertical-align: middle;
}

.fof h3 {
	font-size: 50px;
	display: inline-block;
	padding-right: 12px;
	animation: type .5s alternate infinite;
}

@
keyframes type {
	from {box-shadow: inset -3px 0px 0px #888;
}

to {
	box-shadow: inset -3px 0px 0px transparent;
}
}
</style>
</head>
<body>
	<div id="main">
		<div class="fof">
			<h3>
				Sorry Something Went Wrong<% %>
			</h3>
		</div>
	</div>
</body>
</html>