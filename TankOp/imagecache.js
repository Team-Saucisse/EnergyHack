

// Class to load all game images in cache
enyo.kind({
	name: "ImageCache",
	kind: enyo.Control,
	events: { onCacheLoaded: "" },
	components: [
		// Preload images
		{kind: "Image", id: "grass", src:"images/grass.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_blue_0", src:"images/helo_blue_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_blue_1", src:"images/helo_blue_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_blue_2", src:"images/helo_blue_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_blue_3", src:"images/helo_blue_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_red_0", src:"images/helo_red_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_red_1", src:"images/helo_red_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_red_2", src:"images/helo_red_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"helo_red_3", src:"images/helo_red_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"hq_blue", src:"images/hq_blue.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"hq_red", src:"images/hq_red.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_blue_0", src:"images/soldier_blue_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_blue_1", src:"images/soldier_blue_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_blue_2", src:"images/soldier_blue_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_blue_3", src:"images/soldier_blue_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_red_0", src:"images/soldier_red_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_red_1", src:"images/soldier_red_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_red_2", src:"images/soldier_red_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"soldier_red_3", src:"images/soldier_red_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_blue_0", src:"images/tank2_blue_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_blue_1", src:"images/tank2_blue_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_blue_2", src:"images/tank2_blue_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_blue_3", src:"images/tank2_blue_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_red_0", src:"images/tank2_red_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_red_1", src:"images/tank2_red_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_red_2", src:"images/tank2_red_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank2_red_3", src:"images/tank2_red_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_blue_0", src:"images/tank_blue_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_blue_1", src:"images/tank_blue_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_blue_2", src:"images/tank_blue_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_blue_3", src:"images/tank_blue_3.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_red_0", src:"images/tank_red_0.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_red_1", src:"images/tank_red_1.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_red_2", src:"images/tank_red_2.png", classes: "image-preload", onload: "imageLoaded" },
		{kind: "Image", id:"tank_red_3", src:"images/tank_red_3.png", classes: "image-preload", onload: "imageLoaded" }
	],
	
	// Constructor
	create: function() {
		this.imagesToLoad = 35;	
		this.inherited(arguments);
	},
	
	// One image load
	imageLoaded: function() {
		if (--this.imagesToLoad == 0)
			this.doCacheLoaded();
	}
});