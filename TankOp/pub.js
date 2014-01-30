

// Class for pub
enyo.kind({
	name: "TankOp.Pub",
	kind: enyo.Control,
	classes: "pub",
	components: [
		{content: "La pub est ici", classes: "pub-text"}
	],
	
	// Constructor
	create: function() {
		this.inherited(arguments);
	},
		
	// Render
	rendered: function() {
	}
});