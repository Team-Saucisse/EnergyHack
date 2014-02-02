

// Settings dialog
enyo.kind({
	name: "TankOp.Settings",
	kind: "enyo.Popup",
	classes: "settings-dialog",
	modal: true,
	floating: true,
	autoDismiss: false,
	components: [
		{content: "TANK OPERATION", classes: "settings-title"},
		{classes: "settings-item", components:[
			{content: "TERRAIN", classes: "settings-text settings-line settings-header"},
			{classes: "go-left settings-line", ontap: "prevMap"},
			{kind: "Image", name: "maptype", src:"images/grass.png", classes: "settings-map settings-line"},
			{classes: "go-right settings-line", ontap: "nextMap"},
			{name: "mapcost", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}
		]},
		{classes: "settings-item", components:[
			{content: "HEADQUARTER", classes: "settings-text settings-line settings-header2"},
			{kind: "Image", src:"images/hq_blue.png", classes: "settings-map settings-unit settings-line"},
			{classes: "go-left settings-line", ontap: "lessHq"},
			{name: "hqnumber", content: "99", classes: "settings-text settings-line settings-unitnumber"},			
			{classes: "go-right settings-line", ontap: "moreHq"},
			{name: "hqcost", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}
		]},
		{classes: "settings-item", components:[
			{content: "HELICOPTERE", classes: "settings-text settings-line settings-header2"},
			{kind: "Image", src:"images/helo_blue_2.png", classes: "settings-map settings-unit settings-line"},
			{classes: "go-left settings-line", ontap: "lessHelo"},
			{name: "helonumber", content: "99", classes: "settings-text settings-line settings-unitnumber"},			
			{classes: "go-right settings-line", ontap: "moreHelo"},
			{name: "helocost", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}
		]},
		{classes: "settings-item", components:[
			{content: "CANON", classes: "settings-text settings-line settings-header2"},
			{kind: "Image", src:"images/canon_blue_2.png", classes: "settings-map settings-unit settings-line"},
			{classes: "go-left settings-line", ontap: "lessCanon"},
			{name: "canonnumber", content: "99", classes: "settings-text settings-line settings-unitnumber"},			
			{classes: "go-right settings-line", ontap: "moreCanon"},
			{name: "canoncost", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}
		]},
		{classes: "settings-item", components:[
			{content: "TANK", classes: "settings-text settings-line settings-header2"},
			{kind: "Image", src:"images/tank_blue_2.png", classes: "settings-map settings-unit settings-line"},
			{classes: "go-left settings-line", ontap: "lessTank"},
			{name: "tanknumber", content: "99", classes: "settings-text settings-line settings-unitnumber"},			
			{classes: "go-right settings-line", ontap: "moreTank"},
			{name: "tankcost", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}
		]},
		{classes: "settings-item", components:[
			{content: "SOLDAT", classes: "settings-text settings-line settings-header2"},
			{kind: "Image", src:"images/soldier_blue_2.png", classes: "settings-map settings-unit settings-line"},
			{classes: "go-left settings-line", ontap: "lessSoldier"},
			{name: "soldiernumber", content: "99", classes: "settings-text settings-line settings-unitnumber"},			
			{classes: "go-right settings-line", ontap: "moreSoldier"},
			{name: "soldiercost", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}
		]},
		{classes: "settings-item", components: [
			{content: "TOTAL", classes: "settings-text settings-line settings-total"},
			{name: "total", content: "99", classes: "settings-text settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}			
		]},
		{content: "DEMARRER", classes: "settings-button", ontap: "startGame"},
		{classes: "settings-ecoin", components: [
			{name: "ecoin", content: "99", classes: "settings-text2 settings-line settings-footer"},
			{kind: "Image", src: "images/e-coin.png", classes: "settings-coin settings-line"}			
		]},		
	],
	
	// Constructor
	create: function() {
		this.inherited(arguments);
		
		var param = util.getUrlParameter("ec");
		this.ecoin = (param == null) ? 1 : Math.max(1,param);
	
		this.maps = [{name:"grass", cost: constant.costGrass}, {name:"trees", cost: constant.costTrees}, {name: "mountain", cost: constant.costMountain}],
		this.mapindex = 0;
		this.map = "grass";
		this.hq = 1;
		this.helo = 0;
		this.canon = 0;
		this.tank = 0;
		this.soldier = 0;
		
		this.total = 1;
		
		this.draw();
	},
	
	// Draw settings
	draw: function() {
		this.$.total.setContent(this.total);
		this.$.ecoin.setContent((this.ecoin-this.total));
		this.$.maptype.setSrc("images/"+this.maps[this.mapindex].name+".png");
		this.$.mapcost.setContent(this.maps[this.mapindex].cost);	
		this.$.hqnumber.setContent(this.hq);
		this.$.hqcost.setContent((this.hq-1)*constant.costHq);		
		this.$.helonumber.setContent(this.helo);
		this.$.helocost.setContent(this.helo*constant.costHelo);		
		this.$.canonnumber.setContent(this.canon);
		this.$.canoncost.setContent(this.canon*constant.costCanon);
		this.$.tanknumber.setContent(this.tank);
		this.$.tankcost.setContent(this.tank*constant.costTank);
		this.$.soldiernumber.setContent(this.soldier);
		this.$.soldiercost.setContent(this.soldier*constant.costSoldier);
	},
	
	// Change settings event
	prevMap: function() {
		var newindex = this.mapindex - 1;
		if (newindex < 0) newindex = this.maps.length-1;
		if ((this.total + this.maps[newindex].cost) > this.ecoin) return;
		this.mapindex = newindex;
		this.map = this.maps[newindex].name;
		this.updateTotal();
	},
	nextMap: function() {
		var newindex = this.mapindex + 1;
		if (newindex == this.maps.length) newindex = 0;
		if ((this.total + this.maps[newindex].cost) > this.ecoin) return;
		this.mapindex = newindex;
		this.map = this.maps[newindex].name;		
		this.updateTotal();
	},
	lessHq: function() {
		if (this.hq == 1) return;
		this.hq = this.hq-1;
		this.updateTotal();
	},
	moreHq: function() {
		if (this.hq == 4 || (this.total + constant.costHq) > this.ecoin) return;
		this.hq = this.hq+1;
		this.updateTotal();
	},
	lessHelo: function() {
		if (this.helo == 0) return;
		this.helo = this.helo-1;
		this.updateTotal();
	},
	moreHelo: function() {
		if (this.reachUnitLimit() || (this.total + constant.costHelo) > this.ecoin) return;
		this.helo = this.helo+1;
		this.updateTotal();
	},	
	lessCanon: function() {
		if (this.canon == 0) return;
		this.canon = this.canon-1;
		this.updateTotal();
	},
	moreCanon: function() {
		if (this.reachUnitLimit() || (this.total + constant.costCanon) > this.ecoin) return;
		this.canon = this.canon+1;
		this.updateTotal();
	},	
	lessTank: function() {
		if (this.tank == 0) return;
		this.tank = this.tank-1;
		this.updateTotal();
	},
	moreTank: function() {
		if (this.reachUnitLimit() || (this.total + constant.costTank) > this.ecoin) return;
		this.tank = this.tank+1;
		this.updateTotal();
	},	
	lessSoldier: function() {
		if (this.soldier == 0) return;
		this.soldier = this.soldier-1;
		this.updateTotal();
	},
	moreSoldier: function() {
		if (this.reachUnitLimit() || (this.total + constant.costSoldier) > this.ecoin) return;
		this.soldier = this.soldier+1;
		this.updateTotal();
	},	
	
	// Compute unit limit: max 3 units by HQ
	reachUnitLimit: function() {
		return (this.helo+this.canon+this.tank+this.soldier) == (this.hq*3);
	},
	
	// Compute total
	updateTotal: function() {
		this.total = this.maps[this.mapindex].cost
			+ (this.hq-1)*constant.costHq
			+ this.helo*constant.costHelo
			+ this.canon*constant.costCanon
			+ this.tank*constant.costTank
			+ this.soldier*constant.costSoldier;
		
		this.draw();
	},
	
	// Start game
	startGame: function() {
		this.hide();
	}
});