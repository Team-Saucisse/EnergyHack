

// Constants 
var constant = {};

// Board size
constant.boardWidth = 15;
constant.boardHeight = 9;
constant.tileSize = 64;
constant.areaWidth = constant.boardWidth*constant.tileSize;
constant.areaHeight = constant.boardHeight*constant.tileSize;

// Tile type
constant.tileEmpty = 0;
constant.tileTrees = 1;
constant.tileMountain = 2;
constant.tileWater = 3;

// Unit power - number of step before dead
constant.powerHq = 2;
constant.powerSoldier = 1;
constant.powerTank = 2;
constant.powerCanon = 3;
constant.powerHelo = 2;

// Timer count
constant.loopInterval = 500;
constant.explosionInterval = 50;

// End size image
constant.endGameWidth = 480;
constant.endGameHeight = 320;

// Buying cost in settings
constant.costGrass = 1;
constant.costTrees = 2;
constant.costMountain = 3;
constant.costHq = 5;
constant.costHelo = 4;
constant.costCanon = 3;
constant.costTank = 2;
constant.costSoldier = 1;

// Enemy arrival
constant.enemyCount = 6;
constant.enemyArrivalTurn = 5;
constant.statHq = -1;
constant.statSoldier = 0;
constant.statTank = 3;
constant.statCanon = 8;
constant.statHelo = 9;

constant.pubInterval = 5000;