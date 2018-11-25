
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- Load D3.js -->
<script src="https://d3js.org/d3.v4.min.js"></script>
 
<!-- Load billboard.js with style -->
<script src="billboard.js"></script>
<link rel="stylesheet" href="billboard.css">
<body>
	
		
<div class="container-fluid" style="margin-bottom: 15px; padding-top: 180px;">
			<h1 style="text-align:center;">통계</h1>
 			<div style="margin-right:auto; margin-left:auto;">
			<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/Statistics?sort=1'/>"'>
						이용자수</button>
			<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/Statistics?sort=2'/>"'>
						매출현황</button>
			<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/Statistics?sort=3'/>"'>
						매칭률</button>
			</div>
			
<div id="LegendTemplate1" ></div>
<div id="legend" style="text-align:center;"></div>
		</div>

</body>
 <script src="https://d3js.org/d3.v4.min.js"></script>
    <link rel="stylesheet" href="<c:url value='resources/css/billboard.css'/>" />
    <script src = "<c:url value='resources/js/billboard.js'/>"></script> 
    <script>
    var chart = bb.generate({
    	  data: {
    		    columns: [
    			["${a}", ${A}],
    			["${b}", ${B}],
    			["${c}", ${C}]
    		    ],
    		    type: "pie"
    		  },
    		  legend: {
    		    contents: {
    		      bindto: "#legend",
    		      template: "<span style='color:#fff;padding:10px;background-color:{=COLOR}'>{=TITLE}</span>"
    		    }
    		  },
    		  bindto: "#LegendTemplate1"
    		});
    	
</script>
</html>