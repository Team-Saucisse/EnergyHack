


// Main app class
enyo.kind({
	name: "TankOp.App",
	kind: enyo.Control,
	classes: "board",
	components: [		
		// Playing zone
		{name: "gamebox", classes: "game-box", components: [
		]},

		// Image cache
		{kind: "ImageCache", showing: false, onCacheLoaded: "cacheLoaded"}
	],
	
	// Constructor
	create: function() {
		this.inherited(arguments);
		this.imagesToLoad++;
		
		// Init canvas
		this.$.gamebox.setStyle("width:"+constant.areaWidth+"px; height:"+constant.areaHeight+"px;");
		this.canvas = this.$.gamebox.createComponent({kind: "Canvas", name: "canvas", attributes: {width: constant.areaWidth, height: constant.areaHeight}});

		// Init board
		this.game = [];
		for (var i = 0 ; i < constant.boardHeight ; i++ ) {
			var line = []
			for (var j = 0 ; j < constant.boardWidth ; j++ ) {
				line.push(constant.tileEmpty);
			}
			this.game.push(line);
		}	

		// Init units
		this.units = [];
		this.units.push(new Sprite({
			x: constant.boardWidth-1, y: 1, 
			heading: 0, power: constant.powerTank,
			engine: enyo.bind(this, "badTankEngine"),
			images: ["tank_red_0", "tank_red_1", "tank_red_2", "tank_red_3"]}));		
		this.units.push(new Sprite({
			x: constant.boardWidth-1, y: 4, 
			heading: 0, power: constant.powerSoldier,
			engine: enyo.bind(this, "badTankEngine"),
			images: ["soldier_red_0", "soldier_red_1", "soldier_red_2", "soldier_red_3"]}));	
		this.units.push(new Sprite({
			x: constant.boardWidth-6, y: 2, 
			heading: 0, power: constant.powerCanon,
			engine: enyo.bind(this, "badTankEngine"),
			images: ["canon_red_0", "canon_red_1", "canon_red_2", "canon_red_3"]}));
		this.units.push(new Sprite({
			x: 5, y: 2, 
			heading: 2, power: constant.powerCanon,
			engine: enyo.bind(this, "goodTankEngine"),
			images: ["canon_blue_0", "canon_blue_1", "canon_blue_2", "canon_blue_3"]}));
		this.units.push(new Sprite({
			x: 5, y: 4, 
			heading: 2, power: constant.powerHelo,
			engine: null,
			images: ["helo_blue_0", "helo_blue_1", "helo_blue_2", "helo_blue_3"]}));
			
		// Start game loop
		this.loopTimer = window.setInterval(enyo.bind(this, "gameLoopTick"), constant.loopInterval);
	},
	
	// Render
	rendered: function() {
	},
	
	cacheLoaded: function() {
		console.log("Cache loaded");
	},
	
	// Draw
	draw: function() {
		// Clear all
		var ctx = this.canvas.hasNode().getContext('2d');	
		ctx.clearRect(0, 0, this.canvas.attributes.width, this.canvas.attributes.height);
		
		// Draw board
		var grass = document.getElementById("grass");
		var trees = document.getElementById("trees");
		var mountain = document.getElementById("mountain");
		var water = document.getElementById("water");
		for (var i = 0 ; i < constant.boardHeight ; i++ ) {
			for (var j = 0 ; j < constant.boardWidth ; j++ ) {
				ctx.save();
				ctx.translate(j*constant.tileSize, i*constant.tileSize);
				ctx.drawImage(grass, 0, 0);
				var tileType = this.game[i][j];
				if (tileType == constant.tileTrees)
					ctx.drawImage(trees, 0, 0);
				else if (tileType == constant.tileMountain)
					ctx.drawImage(mountain, 0, 0);
				else if (tileType == constant.tileWater)
					ctx.drawImage(water, 0, 0);
				ctx.restore();
			}
		}
		
		// Draw tanks
		for (var i = 0 ; i < this.units.length ; i++)
			this.units[i].draw(ctx);
			
		// Draw targets
		var target = document.getElementById("target");		
		ctx.save();
		ctx.translate(0, 0);
		ctx.drawImage(target, 0, 0);	
		ctx.restore();				
	},
	
	// Tick for game loop
	gameLoopTick: function() {
		// Sanitize: clean dead units
		var alives = [];
		for (var i = 0 ; i < this.units.length ; i++) {
			if (this.units[i].power > 0)
				alives.push(this.units[i]);
		}
		this.units = alives;
			
		// Launch engine for each unit
		for (var i = 0 ; i < this.units.length ; i++) {
			var engine = this.units[i].engine;
			if (engine != null)
				engine(this.units[i]);
		}
		
		// Draw
		this.draw();
	},
	
	// Engine for good tank moves
	goodTankEngine: function(that) {
		// Look for enemy unit
		var opponent = util.lookForOpponent(that);
		if (opponent != null) {
			// Change heading toward opponent
			that.heading = opponent.heading;
			
			// Fight
			util.processFight(that, opponent.unit);			
			return;
		}
	},
	
	// Engine for bad tank moves
	badTankEngine: function(that) {
		// Look for enemy unit
		var opponent = util.lookForOpponent(that);
		if (opponent != null) {
			// Change heading toward opponent
			that.heading = opponent.heading;
			
			// Fight
			util.processFight(that, opponent.unit);
			return;
		}
		
		// Compute next position
		var next = util.nextPositionOnHeading(that);
		
		// Is it a valid position ?
		if (next.x < 0 || next.x == constant.boardWidth || next.y < 0 || next.y == constant.boardHeight) {
			// No, reverse sense
			that.heading = (that.heading + 2) % 4;
			next = util.nextPositionOnHeading(that);
		}
		that.x = next.x;
		that.y = next.y;
	}
});
