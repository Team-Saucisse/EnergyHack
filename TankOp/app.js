


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
		
		// Preload images
		{kind: "Image", id: "grass", src:"images/grass.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id: "tank_blue_0", src:"images/tank_blue_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id: "tank_blue_1", src:"images/tank_blue_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id: "tank_blue_2", src:"images/tank_blue_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id: "tank_blue_3", src:"images/tank_blue_3.png", classes: "image-preload", onload: "imageLoaded" },
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

		// Init tanks
		this.tank1 = new Sprite({x: 0, y: 1, heading: 2, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]});
		this.tank2 = new Sprite({x: 4, y: 5, heading: 2, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]});
		this.tank3 = new Sprite({x: 6, y: 6, heading: 0, images: ["tank_blue_0", "tank_blue_1", "tank_blue_2", "tank_blue_3"]});
	},
	
	// Render
	rendered: function() {
	},
	
	
	// One image load
	imageLoaded: function() {
		if (--this.imagesToLoad == 0)
			this.draw();
	},
	
	// Draw
	draw: function() {
		// Clear all
		var ctx = this.canvas.hasNode().getContext('2d');	
		ctx.clearRect(0, 0, this.canvas.attributes.width, this.canvas.attributes.height);
		
		// Draw grass
		var grass = document.getElementById("grass");
		for (var i = 0 ; i < constant.boardHeight ; i++ ) {
			for (var j = 0 ; j < constant.boardWidth ; j++ ) {
				ctx.save();
				ctx.translate(j*constant.tileSize, i*constant.tileSize);
				ctx.drawImage(grass, 0, 0);
				ctx.restore();
				// TODO: Handle tileType
			}
		}
		
		// Draw tanks
		this.tank1.draw(ctx);
		this.tank2.draw(ctx);
		this.tank3.draw(ctx);
	}
});
