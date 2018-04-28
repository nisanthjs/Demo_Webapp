<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Silos Web App</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
.header {
    background-color: #f1f1f1;
    padding: 30px;
    text-align: center;
    font-size: 35px;
}

/* Create three equal columns that floats next to each other */
.column {
    float: left;
    width: 33.33%;
    padding: 10px;
    height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Style the footer */
.footer {
    background-color: #f1f1f1;
    padding: 10px;
    text-align: center;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
    .column {
        width: 100%;
    }
}
</style>
</head>
<body>

<div class="header">
  <h2>Silos Web Application</h2>
</div>

<div class="row">
  <div class="column" style="background-color:#aaa;">Ansible</div>
  <div class="column" style="background-color:#bbb;">${db_user}
 
	<c:if test="${not empty countrySet}">

		<ul>
			<c:forEach var="countryName" items="${countrySet}">
				<li>${countryName}</li>
			</c:forEach>
		</ul> 
  
	</c:if>
  </div>
  <div class="column" style="background-color:#ccc;">${message}</div>
</div>

<div class="footer">
  <p> Visits : ${counter} </p>
</div>

</body>
</html>

