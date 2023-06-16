<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bing Map with Latitude and Longitude from CSV</title>

<!-- Bing Maps API -->
<script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?key=YOUR_BING_MAPS_KEY_HERE'></script>

<script type='text/javascript'>
	var map;
	var locations = [];
	
	// Parse the CSV file and extract the latitude and longitude coordinates
	function parseCSV(csv) {
		var lines = csv.split("\n");
		for (var i = 0; i < lines.length; i++) {
			var cells = lines[i].split(",");
			if (cells.length >= 2) {
				var lat = parseFloat(cells[0].trim());
				var lng = parseFloat(cells[1].trim());
				locations.push(new Microsoft.Maps.Location(lat, lng));
			}
		}
	}
	
	function GetMap() {
		map = new Microsoft.Maps.Map('#myMap', {
			credentials: 'YOUR_BING_MAPS_KEY_HERE',
			center: new Microsoft.Maps.Location(47.608013, -122.335167),
			zoom: 12
		});
		
		// Get the CSV file from the server
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "locations.csv", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				parseCSV(xhr.responseText);
				var pinLayer = new Microsoft.Maps.Layer();
				for (var i = 0; i < locations.length; i++) {
					var pin = new Microsoft.Maps.Pushpin(locations[i]);
					pinLayer.add(pin);
				}
				map.layers.insert(pinLayer);
			}
		};
		xhr.send();
	}
</script>
</head>
<body onload='GetMap();'>
	<div id='myMap' style='width: 100%; height: 500px;'></div>
</body>
</html>
