
// Light sprite class
enyo.kind({
	name: "Sprite",	
	published: { x: 0, y: 0, heading: 0, power: 0, images: [], engine: null },

	// Create component
	create: function() {	
		this.inherited(arguments);
	},
	
	// Draw the sprite in the canvas context
	draw: function(ctx) {
		ctx.save();		
		ctx.translate(this.x*constant.tileSize, this.y*constant.tileSize);
		var image = document.getElementById(this.getCurrentImage());
		ctx.drawImage(image, 0, 0);	
		ctx.restore();	
	},
	
	// Get current image of the sprite
	getCurrentImage: function() {
		return this.images[this.heading < this.images.length ? this.heading : 0];
	}
});	