


// Key to use
TankOp.playKeys = [
	{ key: 32, hit: true },
	{ key: 75, heading: 2 },
	{ key: 107, heading: 2 },
	{ key: 73, heading: 1 },
	{ key: 105, heading: 1 },
	{ key: 74, heading: 0 },
	{ key: 106, heading: 0 },
	{ key: 76, heading: 3 },
	{ key: 108, heading: 3 }
];


// Main app class
enyo.kind({
	name: "TankOp.App",
	kind: enyo.Control,
	classes: "board",
	components: [		
		// Title bar
		{content: "TANK OPERATION", classes: "title"},
		
		// Playing zone
		{name: "gamebox", classes: "game-box", components: [
		]},
		
		// Settings popup
		{name: "settings", kind: "TankOp.Settings", showing: false, onHide: "initGame"},
		
		// Key handling
		{kind: "Signals", onkeypress: "keyPressed"},

		// Image cache
		{kind: "ImageCache", showing: false, onCacheLoaded: "cacheLoaded"}
	],
	
	// Constructor
	create: function() {
		this.inherited(arguments);
		this.imagesToLoad++;
		this.endOfGame = false;
		this.pausedGame = true;
		this.initializedGame = false;
		
		// Init canvas
		this.$.gamebox.setStyle("width:"+constant.areaWidth+"px; height:"+constant.areaHeight+"px;");
		this.canvas = this.$.gamebox.createComponent({kind: "Canvas", name: "canvas", attributes: {width: constant.areaWidth, height: constant.areaHeight}});

		// Start game loop
		this.loopTimer = window.setInterval(enyo.bind(this, "gameLoopTick"), constant.loopInterval);
	},
	
	// Init game
	initGame: function() {
		// Init board
		this.initializedGame = true;
		this.game = util.createMap(util.gameMap(this.$.settings.map));
		this.targetpos = {x: 7, y: 4};

		// Init units
		var width = constant.boardWidth, height = constant.boardHeight;
		var goodEngine = enyo.bind(this, "goodEngine");
		var badEngine = enyo.bind(this, "badEngine");		
		this.units = util.createUnits([
			{type: "tank", color: "red", x: width-1, y: 2, engine: badEngine},
			{type: "soldier", color: "red", x: width-1, y: 7, engine: badEngine},
			{type: "canon", color: "red", x: width-6, y: 3, engine: badEngine},
			{type: "canon", color: "blue", x: 4, y: 3, engine: goodEngine},
			{type: "helo", color: "blue", x: 5, y: 4, engine: null},
			{type: "soldier", color: "red", x: width-4, y: 4, engine: badEngine},
			{type: "soldier", color: "red", x: width-1, y: 5, engine: badEngine},
			{type: "helo", color: "red", x: width-1, y: height-1, engine: badEngine},
			{type: "hq", color: "blue", x: 0, y: 4, engine: null}
		]);
		this.pausedGame = false;
	},
	
	// Render
	rendered: function() {
	},
	
	cacheLoaded: function() {
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
		if (!this.endOfGame) {
			for (var i = 0 ; i < this.units.length ; i++)
				this.units[i].draw(ctx);
			
			// Draw target
			var target = document.getElementById("target");		
			ctx.save();
			ctx.translate(this.targetpos.x*constant.tileSize, this.targetpos.y*constant.tileSize);
			ctx.drawImage(target, 0, 0);	
			ctx.restore();				
		}
		
		// Draw end of game screen
		else {	
			var endscreen = this.win ? document.getElementById("endgame_victory") :  document.getElementById("endgame_defeat");
			ctx.save();
			ctx.translate((constant.areaWidth-constant.endGameWidth)/2, (constant.areaHeight-constant.endGameHeight)/2);
			ctx.drawImage(endscreen, 0, 0);	
			ctx.restore();		
		}
				
	},
	
	// A key was pressed
	keyPressed: function(s, e) {
		var key = e.charCode;
		
		// Play key
		for (var i = 0 ; i < TankOp.playKeys.length ; i++ ) {
			var playKey = TankOp.playKeys[i];
			if (key == playKey.key) {
				// Fire key
				if (playKey.hit) {
					var targetunit = util.lookForUnit(this.targetpos);
					if (targetunit != null)
						util.processFight(null, targetunit);
					break;
				}
				
				// Move key
				var newX = this.targetpos.x + util.moves[playKey.heading].dx;
				var newY = this.targetpos.y + util.moves[playKey.heading].dy;
				if (newX < 0 || newX == constant.boardWidth || newY < 0 || newY == constant.boardHeight)
					break;
				this.targetpos.x = newX;
				this.targetpos.y = newY;
				break;
			}
		}		
	},
	
	// Tick for game loop
	gameLoopTick: function() {
		// Show settings popup
		if (!this.initializedGame)
			this.$.settings.show();	
		if (this.pausedGame)
			return;
		
		// Sanitize: clean dead units and compute victory/defeat conditions
		var alives = [];
		var livingHq = 0;
		var livingEnemy = 0;
		for (var i = 0 ; i < this.units.length ; i++) {
			var unit = this.units[i];
			if (unit.power > 0)
				alives.push(unit);
			if (util.getUnitType(unit) == 0)
				livingHq++;
			if (unit.getCurrentImage().indexOf("red") != -1)
				livingEnemy++;				
		}
		this.units = alives;
		this.endOfGame = (livingHq == 0 || livingEnemy == 0);
		this.win = (livingHq > 0);
			
		// Launch engine for each unit
		if (!this.endOfGame) {
			for (var i = 0 ; i < this.units.length ; i++) {
				var engine = this.units[i].engine;
				if (engine != null)
					engine(this.units[i]);
			}
		}
		
		// Draw
		this.draw();
	},
	
	// Engine for good tank moves
	goodEngine: function(that) {
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
	badEngine: function(that) {
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
		if (!util.isValidPosition(next, that)) {
			// No, reverse sense
			that.heading = (that.heading + 2) % 4;
			next = util.nextPositionOnHeading(that);
		}
		that.x = next.x;
		that.y = next.y;
	}
});
