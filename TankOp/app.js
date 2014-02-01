


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
		this.units = []

		// Set HQ
		var step = constant.boardHeight/(this.$.settings.hq+1);
		var hqs = [];
		for (var i = 0 ; i < this.$.settings.hq ; i++) {
			var hq = util.createUnit({type: "hq", color: "blue", x: 0, y: Math.floor((i+1)*step), engine: null});
			this.units.push(hq);
			hqs.push(hq);
		}
		
		// Create defending units
		var defense = [];
		for(var i = 0 ; i < this.$.settings.helo ; i++)
			defense.push({type: "helo", color: "blue", engine: goodEngine});
		for(var i = 0 ; i < this.$.settings.canon ; i++)
			defense.push({type: "canon", color: "blue", engine: goodEngine});
		for(var i = 0 ; i < this.$.settings.tank ; i++)
			defense.push({type: "tank", color: "blue", engine: goodEngine});
		for(var i = 0 ; i < this.$.settings.soldier ; i++)
			defense.push({type: "soldier", color: "blue", engine: goodEngine});
		
		// Set defense around hq
		if (defense.length > 0) {
			var unitByHq = Math.floor(defense.length/hqs.length);
			var index = 0;
			for (var i = 0 ; i < hqs.length && index < defense.length ; i++) {
				var unitForHq = 0;
				defense[index].x = hqs[i].x+1; defense[index].y = hqs[i].y; ++index; ++unitForHq;
				if (index < defense.length && unitForHq <= unitByHq) {
					defense[index].x = hqs[i].x; defense[index].y = hqs[i].y-1;	++index; ++unitForHq;				
					if (index < defense.length && unitForHq <= unitByHq) {
						defense[index].x = hqs[i].x; defense[index].y = hqs[i].y+1; ++index; ++unitForHq;
					}
				}
			}
			for (var i = 0 ; i < defense.length ; i++)
				this.units.push(util.createUnit(defense[i]));
		}
		
		// Get bad units
		this.enemyCount = constant.enemyCount+Math.floor(defense.length/3);
		this.enemyArrivalTurn = constant.enemyArrivalTurn;
		
		// Let's Go !
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
		this.endOfGame = (livingHq == 0 || (livingEnemy == 0 && this.enemyCount == 0));
		this.win = (livingHq > 0);
		
		// Game play
		if (!this.endOfGame) {
			// Enemy arrival
			if (this.enemyArrivalTurn == 0 && this.enemyCount > 0) {
				var badEngine = enyo.bind(this, "badEngine");
				var width = constant.boardWidth;
				var height = constant.boardHeight;
				var stats = [-1, constant.statSoldier, constant.statTank, constant.statCanon, constant.statHelo];
				var unit = {type: util.randomUnit(), color: "red", heading:0, engine: badEngine, x: width-1, y: util.random(height)};
				this.units.push(util.createUnit(unit));
				this.enemyCount = this.enemyCount-1;
				this.enemyArrivalTurn = constant.enemyArrivalTurn;
			} else {
				this.enemyArrivalTurn = this.enemyArrivalTurn - 1;
			}
			
			// Launch engine for each unit
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
