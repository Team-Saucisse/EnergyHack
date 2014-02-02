

// Cheat dialog
enyo.kind({
	name: "TankOp.Cheat",
	kind: "enyo.Popup",
	classes: "cheat-settings",
	modal: true,
	floating: true,
	autoDismiss: true,
	components: [
		{name: "banner", kind: "Image", classes: "cheat-image"}	
	],
	
	// Constructor
	create: function() {
		this.inherited(arguments);
		
		var pubs = ["BonBio.png", "BonVelo.png"];
		var index = util.random(pubs.length);
		this.$.banner.setSrc("images/"+pubs[index]);		
	}
});	