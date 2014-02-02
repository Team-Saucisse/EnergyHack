

// Class for pub
enyo.kind({
	name: "TankOp.Pub",
	kind: enyo.Control,
	classes: "pub",
	components: [
		{name: "banner", kind: "Image", classes: "pub-text"}
	],
	
	// Constructor
	create: function() {
		this.inherited(arguments);
		
		// Init pub
		var that = this;
		var pubs = ["Banniere1.png", "Banniere2.png", "Banniere3.png"];
		var index = 0;
		that.$.banner.setSrc("images/"+pubs[index]);

		// Handle pub change
		window.setInterval(function() {
			if (++index == pubs.length) index = 0;		
			that.$.banner.setSrc("images/"+pubs[index]);
		}, constant.pubInterval);
	},
		
	// Render
	rendered: function() {
	}
});