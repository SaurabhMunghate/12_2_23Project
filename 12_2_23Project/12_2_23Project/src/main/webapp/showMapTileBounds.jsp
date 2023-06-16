<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8" />
<script type="text/javascript">
	var map;
	var st = "";

	function GetMap() {
		//var centroid =  Microsoft.Maps.SpatialMath.Geometry.centroid(34.05307000392542, -117.6910560851873);
		map = new Microsoft.Maps.Map("#myMap", {
			// center: new Microsoft.Maps.Location(37.1683332, -119.4470231),
			center : new Microsoft.Maps.Location(34.05307000392542,
					-117.6910560851873),
			credentials : "c153eae2af2841c8a5ddada9ffb42a49",
			zoom : 13,
		});

		//Load the Spatial Math module.
		Microsoft.Maps.loadModule("Microsoft.Maps.SpatialMath", function() {
			//console.log('tileLocRect');
			showMapTileBounds();

			//Recaulte the map tiles bounds everytime the map moves.
			Microsoft.Maps.Events.addHandler(map, "viewchangeend",
					showMapTileBounds);
		});
	}

	function showMapTileBounds() {
		map.entities.clear();
		console.log("tileLocRect");

		//Get a list of all the tiles in the current map view.
		var tiles = Microsoft.Maps.SpatialMath.Tiles.getTilesInBounds(map
				.getBounds(), 14);

		for (var i = 0; i < tiles.length; i++) {
			//Calculate the bounding rectangle of the tile.
			var tileLocRect = Microsoft.Maps.SpatialMath.Tiles
					.tileToLocationRect(tiles[i]);
			// console.log('tileLocRect -- '+tileLocRect);

			//Create a polygon for the tile and add it to the map.
			var poly = Microsoft.Maps.SpatialMath
					.locationRectToPolygon(tileLocRect);
			map.entities.push(poly);
			var the_g = "POLYGON((" + poly.geometry.bounds[1] + " "
					+ poly.geometry.bounds[0] + ", " + poly.geometry.bounds[3]
					+ " " + poly.geometry.bounds[0] + ", "
					+ poly.geometry.bounds[3] + " " + poly.geometry.bounds[2]
					+ ", " + poly.geometry.bounds[1] + " "
					+ poly.geometry.bounds[2] + ", " + poly.geometry.bounds[1]
					+ " " + poly.geometry.bounds[0] + "))";

			// console.log("the_g ::" +the_g);

			//           const fs = require('fs');
			// const logStatement = 'console.log("the_g ::" + the_g);';
			// fs.writeFile('output.txt', logStatement, (err) => {
			//     if (err) throw err;
			//     console.log('Data written to output.txt');
			//   });

			//Califonia POINT(-119.4470231 37.1683332)\
			//Montevista : 34.05307000392542,-117.6910560851873
			//var point1 = new Microsoft.Maps.Location(34.05307000392542, -117.6910560851873)
			// var point = new Microsoft.Maps.Location(37.1683332, -119.4470231); // Latitude and longitude of the point to check
			// var isPointInBounds = Microsoft.Maps.SpatialMath.Geometry.intersects(point, poly);

			//if (isPointInBounds) {
			//console.log('The point is within the bounds of the polygon.');
			// } else {
			//console.log('The point is outside the bounds of the polygon.');
			//}

			st = st + the_g.replace("POLYGON", ",POLYGON") + "\n";
			//    console.log(st);
		}
		var myString = st;
		const myFilename = "myfile.txt";

		//writeStringToTextFile(myString, myFilename);
		console.log(tiles.length);
	}

	function writeStringToTextFile(data, filename) {
		// Create a Blob object with the data and specify the MIME type
		const blob = new Blob([ data ], {
			type : "text/plain"
		});

		// Create a temporary URL for the Blob object
		const url = URL.createObjectURL(blob);

		// Create a temporary <a> element to trigger the file download
		const link = document.createElement("a");
		link.href = url;
		link.download = filename;

		// Programmatically trigger the download
		link.click();

		// Cleanup by revoking the URL object
		URL.revokeObjectURL(url);
	}
</script>

<script type="text/javascript"
	src="http://www.bing.com/api/maps/mapcontrol?callback=GetMap" async
	defer></script>
<style type="text/css">
#missingCredential {
	display: none;
}
</style>
</head>
<body>
	<div id="data-container"></div>
	<div id="myMap" style="position: relative; width: 100%; height: 100%"></div>
</body>
</html>
