<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bing Map in JSP</title>

<!-- Bing Maps API -->
<script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?key=YOUR_BING_MAPS_KEY_HERE'></script>

<script type='text/javascript'>
	var map;
	function GetMap() {
		map = new Microsoft.Maps.Map('#myMap', {
			credentials: 'YOUR_BING_MAPS_KEY_HERE',
			center: new Microsoft.Maps.Location(47.608013, -122.335167),
			zoom: 12
		});
	}
</script>
</head>
<body onload='GetMap();'>
	<div id='myMap' style='width: 100%; height: 500px;'></div>
</body>
</html>
