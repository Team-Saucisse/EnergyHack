﻿


// Main app class
enyo.kind({
	name: "TankOp.App",
	kind: enyo.Control,
	classes: "board",
	components: [
		{kind: "Button", content: "Draw board", ontap: "draw"},
			
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
				if (i >= constant.boardHeight-5 && i < constant.boardHeight-2)
					line.push(constant.tileTrees);				
				else if (i >= constant.boardHeight-2)
					line.push(constant.tileMountain);
				else if (i == constant.boardHeight-6 && (j == 4 || j == 9))
					line.push(constant.tileWater);
				else
					line.push(constant.tileEmpty);
			}
			this.game.push(line);
		}	

		// Init units
		this.units = [];
		this.units.push(new Sprite({x: 0, y: 0, heading: 0, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]}));
		this.units.push(new Sprite({x: 0, y: 1, heading: 1, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]}));
		this.units.push(new Sprite({x: 0, y: 2, heading: 2, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]}));
		this.units.push(new Sprite({x: 0, y: 3, heading: 3, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]}));
		this.units.push(new Sprite({x: 1, y: 0, heading: 0, images: ["tank2_blue_0", "tank2_blue_1", "tank2_blue_2", "tank2_blue_3"]}));
		this.units.push(new Sprite({x: 1, y: 1, heading: 1, images: ["tank2_blue_0", "tank2_blue_1", "tank2_blue_2", "tank2_blue_3"]}));
		this.units.push(new Sprite({x: 1, y: 2, heading: 2, images: ["tank2_blue_0", "tank2_blue_1", "tank2_blue_2", "tank2_blue_3"]}));
		this.units.push(new Sprite({x: 1, y: 3, heading: 3, images: ["tank2_blue_0", "tank2_blue_1", "tank2_blue_2", "tank2_blue_3"]}));		
		this.units.push(new Sprite({x: 2, y: 0, heading: 0, images: ["soldier_blue_0", "soldier_blue_1", "soldier_blue_2", "soldier_blue_3"]}));
		this.units.push(new Sprite({x: 2, y: 1, heading: 1, images: ["soldier_blue_0", "soldier_blue_1", "soldier_blue_2", "soldier_blue_3"]}));
		this.units.push(new Sprite({x: 2, y: 2, heading: 2, images: ["soldier_blue_0", "soldier_blue_1", "soldier_blue_2", "soldier_blue_3"]}));
		this.units.push(new Sprite({x: 2, y: 3, heading: 3, images: ["soldier_blue_0", "soldier_blue_1", "soldier_blue_2", "soldier_blue_3"]}));
		this.units.push(new Sprite({x: 3, y: 0, heading: 0, images: ["helo_blue_0", "helo_blue_1", "helo_blue_2", "helo_blue_3"]}));
		this.units.push(new Sprite({x: 3, y: 1, heading: 1, images: ["helo_blue_0", "helo_blue_1", "helo_blue_2", "helo_blue_3"]}));
		this.units.push(new Sprite({x: 3, y: 2, heading: 2, images: ["helo_blue_0", "helo_blue_1", "helo_blue_2", "helo_blue_3"]}));
		this.units.push(new Sprite({x: 3, y: 3, heading: 3, images: ["helo_blue_0", "helo_blue_1", "helo_blue_2", "helo_blue_3"]}));		
		this.units.push(new Sprite({x: 4, y: 0, heading: 3, images: ["hq_blue"]}));		
		
		this.units.push(new Sprite({x: 10, y: 0, heading: 0, images: ["tank_red_0", "tank_red_1", "tank_red_2", "tank_red_3"]}));
		this.units.push(new Sprite({x: 10, y: 1, heading: 1, images: ["tank_red_0", "tank_red_1", "tank_red_2", "tank_red_3"]}));
		this.units.push(new Sprite({x: 10, y: 2, heading: 2, images: ["tank_red_0", "tank_red_1", "tank_red_2", "tank_red_3"]}));
		this.units.push(new Sprite({x: 10, y: 3, heading: 3, images: ["tank_red_0", "tank_red_1", "tank_red_2", "tank_red_3"]}));
		this.units.push(new Sprite({x: 11, y: 0, heading: 0, images: ["tank2_red_0", "tank2_red_1", "tank2_red_2", "tank2_red_3"]}));
		this.units.push(new Sprite({x: 11, y: 1, heading: 1, images: ["tank2_red_0", "tank2_red_1", "tank2_red_2", "tank2_red_3"]}));
		this.units.push(new Sprite({x: 11, y: 2, heading: 2, images: ["tank2_red_0", "tank2_red_1", "tank2_red_2", "tank2_red_3"]}));
		this.units.push(new Sprite({x: 11, y: 3, heading: 3, images: ["tank2_red_0", "tank2_red_1", "tank2_red_2", "tank2_red_3"]}));		
		this.units.push(new Sprite({x: 12, y: 0, heading: 0, images: ["soldier_red_0", "soldier_red_1", "soldier_red_2", "soldier_red_3"]}));
		this.units.push(new Sprite({x: 12, y: 1, heading: 1, images: ["soldier_red_0", "soldier_red_1", "soldier_red_2", "soldier_red_3"]}));
		this.units.push(new Sprite({x: 12, y: 2, heading: 2, images: ["soldier_red_0", "soldier_red_1", "soldier_red_2", "soldier_red_3"]}));
		this.units.push(new Sprite({x: 12, y: 3, heading: 3, images: ["soldier_red_0", "soldier_red_1", "soldier_red_2", "soldier_red_3"]}));
		this.units.push(new Sprite({x: 13, y: 0, heading: 0, images: ["helo_red_0", "helo_red_1", "helo_red_2", "helo_red_3"]}));
		this.units.push(new Sprite({x: 13, y: 1, heading: 1, images: ["helo_red_0", "helo_red_1", "helo_red_2", "helo_red_3"]}));
		this.units.push(new Sprite({x: 13, y: 2, heading: 2, images: ["helo_red_0", "helo_red_1", "helo_red_2", "helo_red_3"]}));
		this.units.push(new Sprite({x: 13, y: 3, heading: 3, images: ["helo_red_0", "helo_red_1", "helo_red_2", "helo_red_3"]}));		
		this.units.push(new Sprite({x: 14, y: 0, heading: 0, images: ["hq_red"]}));	
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
	}
});
