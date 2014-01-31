
// Utility function
var util = {};

// Heading:  0 <
//           1 ^
//           2 >
//           3 v
util.moves = [{dx: -1, dy: 0}, {dx: 0, dy: -1}, {dx: +1, dy: 0}, {dx: 0, dy: +1}];

// Unit type
util.unitTypes = ["hq", "soldier", "tank", "canon", "helo"];

// Unit type
util.explosionsImages = ["explosion_1", "explosion_2", "explosion_3", "explosion_4", "explosion_5", "explosion_6", "explosion_7"];


// Compute next position if sprite go ahead in the current heading
util.nextPositionOnHeading = function(sprite) {
	return { x: sprite.x + util.moves[sprite.heading].dx, y: sprite.y + util.moves[sprite.heading].dy };
}

// Look for unit at a position
util.lookForUnit = function(position) {
	// Launch engine for each unit
	for (var i = 0 ; i < app.units.length ; i++)
		if (app.units[i].x == position.x && app.units[i].y == position.y)
			return app.units[i];
	return null;
}

// Look for opponent around the sprite
util.lookForOpponent = function(sprite) {
	var oppositeColor = sprite.getCurrentImage().indexOf("red") != -1 ? "blue" : "red";
	for (var i = 0 ; i < util.moves.length ; i++ ) {
		var position = {x: sprite.x + util.moves[i].dx, y: sprite.y + util.moves[i].dy};
		var neighbour = util.lookForUnit(position);
		if (neighbour != null && neighbour.getCurrentImage().indexOf(oppositeColor) != -1)
			return {heading: i, unit: neighbour};
	}
	return null;
}

// Get unit type
util.getUnitType = function(unit) {
	var image = unit.getCurrentImage();
	for (var i = 0 ; i < util.unitTypes.length ; i++)
		if (image.indexOf(util.unitTypes[i]) != -1)
			return i;
	return -1;
}

// Test if a unit could beat another
util.couldBeat = function(unit1, unit2) {
	var type1 = util.getUnitType(unit1);
	var type2 = util.getUnitType(unit2);
	if (type1 == 1 && type2 == util.unitTypes.length - 1)  // Soldier could beat Helo
		return true;
	return (type1 >= type2);
}

// Handle fight between two opponents
util.processFight = function(unit1, unit2) {
	if (!util.couldBeat(unit1, unit2))
		return;
	unit2.power = unit2.power - 1;
	util.doExplosion(unit2);
}

// Do explosion animation
util.doExplosion = function(position) {
	var index = 0;
	var timer = window.setInterval(function() {
		if (index == util.explosionsImages.length) {
			window.clearInterval(timer);
			return;
		}
		var ctx = app.canvas.hasNode().getContext('2d');
		var image = document.getElementById(util.explosionsImages[index]);		
		ctx.save();
		ctx.translate(position.x*constant.tileSize, position.y*constant.tileSize);
		ctx.drawImage(image, 0, 0);	
		ctx.restore();	
		index++;
	}, constant.explosionInterval);
}