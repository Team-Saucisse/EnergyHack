
// Light sprite class
enyo.kind({
	name: "Sprite",	
	published: { x: 0, y: 0, width: 0, height: 0, heading: 0, images: [] },

	// Create component
	create: function() {	
		this.inherited(arguments);
	},
	
	// Draw the sprite in the canvas context
	draw: function(ctx) {
		ctx.save();		
		ctx.translate(this.x*constant.tileSize, this.y*constant.tileSize);
		var image = document.getElementById(this.images[this.heading]);
		ctx.drawImage(image, 0, 0);	
		ctx.restore();	
	}
});	