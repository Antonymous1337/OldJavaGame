/* ANTONY HOLSHOUSER BULLET HELL PROJECT

Note: This is a combined version of the previous project I sent.
Everything is the same, but all of the files are combined into
one big one. Because of this, things look pretty disorganized.
Sorry for the inconvenience.

Foreground objects:

  At least one object that the player can control: player ship
  
  At least one object that is animated (change throughout gameplay):
    Bomb animation
    Bullets/missles (amunition)
    Bosses
    Certain boss attack animations
    Mini-bosses
    enemies
    Health bars
    GUI
    Upgrades
    etc.
    
  The above objects must have some interaction
    amunition collides with respective ships
      player ammunition collides with enemies
      enemy amunition collides with player
      amunition "collides" with edge of screen
      
  None of the foregound objects can just leave the game window
    Enemy ships don't leave the window, they despawn, if not killed by the time they "leave" the window
    Bullets/Missles, also, despawn if they reach the edge of the game window
  
Background:

  At least 2 background objects
    Road
    Road Light
    
  Use your own background image
    Road light

Use interesting custom images for all objects
  
  Player
  All enemy ships (3)
  All enemy mini-bosses (10)
  All enemy bosses (4)
  Road light
  (unused for performance and quality reasons) Road
  
  


All you have to do to get full concept of game, is try out every boss,
and try out every difficulty setting, and maybe play with some upgrade
options just to see if they work (the first affordable upgrade is
always fire rate)

The instructions within the game says practically everything you need
to know to more or less do well within the game.




*/





// mini-bullet hell game with upgrades
boolean main = true;
boolean game = false;
boolean upgradeMenu = false;

boolean bossPracticeMenu = false;
boolean bossPractice = false;





// Create boss practice mode






// WHATEVER IS BELOW ARE IDEAS FOR POSSIBLE FUTURE DEVELOPMENT OF THE GAME



// use requestImage()

// Create combo (increases score)
// Create graze (increases score)
// Ranking system

// different colors for different segments (after bosses)

// Create More bosses (10 max)
//    Create a special bullet class whenever needed
//    Ideas:
//      Rockets going around player (in a circle chasing each other), closing in while bullets are shooting at player
//      Bullets that go around a circle in any way
//      "Lazers"
//      Boundary effects (they can get very cool and fun)
// Create game win screen

// Make assets for ships and bosses

//*** Update instructions

// Restart function without having to close application
// Keyboard implimentation in menus
// Save on level?
// Save on close?
// fast travel?


// endless mode

/*
tims ideas

add self made music and sfx with sound slider in settings
add power ups for temporary gun types (i.e. lasers, rockets) or quick invuln or sum
add coins/collectibles to pick up mid match and shop for decor/upgrades/weapons and make them instantly collected after finishing a wave and not being hit
no bullets after level over regardless of score to prevent death after level
if text/dialogue added make avatars and add beeps and boops of different pitch for voices (make this skippable with button or ctrl)
add controls prompt when first in level/tutorial
peaceful mode is a thing and instant S (or whatever highest rank is)
S (or highest rank) can only be gotten with no damage taken (even shields), no bombs used, all enemies killed
lock-on weapon that does lower damage
piercing weapon
raw hitbox mode for easily seeing hitboxes of you, your enemies, and bullets (if masked)
either make always fire or make charging do something (more damage, pierce a bit, etc.)
***vfx when enemy killed
flicker of enemy on hit
bullets into coins with something
sfx for grazing, bullets, enemy death, etc.
warning sign for bosses
beeps and boops/dialogue during boss fights
*/

















button[] buttons;


PImage background;
PImage light;

PImage playerShip;
PImage normalShip;
PImage bigShip;
PImage healShip;

PImage sniper;
PImage sentry;
PImage shotty;
PImage missler;
PImage forker;
PImage scatter;
PImage rando;
PImage carrier;
PImage charger;
PImage missleMaster;

PImage centerxyBossBig;
PImage centerxyBossSmall;
PImage centerxyBossCenter;

PImage centerxtopyBoss;

PImage fastBoss;

PImage smallBoss;

void setup() {
  size(1400, 1000, P2D);
  smooth();
  frameRate(60);
  
  // getting background
   background = loadImage("data/CityC (1) (1).jpeg");
   light = loadImage("light.png");
   
   playerShip = loadImage("playerShip.png");
   normalShip = loadImage("normalShip.png");
   bigShip = loadImage("bigShip.png");
   healShip = loadImage("healShip.png");
   
   sniper = loadImage("sniper.png");
   sentry = loadImage("sentry.png");
   shotty = loadImage("shotty.png");
   missler = loadImage("missler.png");
   forker = loadImage("forker.png");
   scatter = loadImage("scatter.png");
   rando = loadImage("rando.png");
   carrier = loadImage("carrier.png");
   charger = loadImage("charger.png");
   missleMaster = loadImage("missleMaster.png");
   
   centerxyBossBig = loadImage("centerxyBossBig.png");
   centerxyBossSmall = loadImage("centerxyBossSmall.png");
   centerxyBossCenter = loadImage("centerxyBossCenter.png");
   
   centerxtopyBoss = loadImage("centerxtopyBoss.png");
   
   fastBoss = loadImage("fastBoss.png");
   
   smallBoss = loadImage("smallBoss.png");
  // creating buttons for whole project
  buttons = new button[15];
  
  // main menu buttons
  buttons[0] = new button(140, 300, 250, 150, color(20), color(255), "ABOUT", 1);
  buttons[1] = new button(525, 300, 250, 150, color(20), color(255), "INSTRUCTIONS", 2);
  buttons[10] = new button(910, 300, 250, 150, color(255, 0, 0), color(255), "BOSSES", 7);
  buttons[2] = new button(140, 600, 250, 150, color(0, 255, 0), color(255), "EASY", 3);
  buttons[3] = new button(525, 600, 250, 150, color(255, 255, 0), color(255), "NORMAL", 4);
  buttons[4] = new button(910, 600, 250, 150, color(255, 0, 0), color(255), "HARD", 5);
  
  buttons[5] = new button(517, 850, 367, 100, color(20), color(255), "BACK TO MAIN", 6);
  
  buttons[6] = new button(100, 850, 367, 100, color(20), color(255), "PREV", 1);
  buttons[7] = new button(934, 850, 367, 100, color(20), color(255), "NEXT", 2);
  
  buttons[8] = new button(0, 200, 100, 1000, color(20), color(150), "<", 1);
  buttons[9] = new button(1300, 200, 100, 1000, color(20), color(150), ">", 2);
  
  buttons[11] = new button(140, 300, 250, 150, color(20), color(255), "The Square", 8);
  buttons[12] = new button(525, 300, 250, 150, color(20), color(255), "The Big Boy", 9);
  buttons[13] = new button(910, 300, 250, 150, color(255, 0, 0), color(255), "The Dragon", 10);
  buttons[14] = new button(525, 600, 250, 150, color(255, 0, 0), color(255), "the small cell", 11);
  
  
  
  // upgrades
  String n;
  String d;
  
  String[] e;
  
  
  
  // OFFENSE
  
  n = "max damage/health/shield";
  d = "Increases the amount of damage you deal, and damage you can take";
  e = new String[3];
  e[0] = "Damage: " + player.damage + " + " + player.damage + " = " + (player.damage*2);
  e[1] = "Health: " + player.maxHealth + " + " + player.maxHealth + " = " + (player.maxHealth*2);
  e[2] = "Shield: " + player.maxShield + " + " + player.maxShield + " = " + (player.maxShield*2);
  upgrades[0][0] = new upgrade(n, d, e, 100, 1);
  
  n = "bullet shooting speed";
  d = "Increases the speed in which you shoot bullets";
  e = new String[1];
  e[0] = "Rate of Fire: " + player.bulletCooldownRemember + " - " + 1 + " = " + (player.bulletCooldownRemember-1);
  upgrades[0][1] = new upgrade(n, d, e, 10, 2);
  
  n = "amount of bullets";
  d = "Increases the amount of bullets you shoot";
  e = new String[1];
  e[0] = "Amount of Bullets: " + player.numOfBullets + " + " + 1 + " = " + (player.numOfBullets+1);
  upgrades[0][2] = new upgrade(n, d, e, 1000, 3);
  
  n = "size of bullets";
  d = "Increases the size of the bullets you shoot";
  e = new String[1];
  e[0] = "Bullet size: " + player.bulletSize + " + 2.5 = " + (player.bulletSize+2.5);
  upgrades[0][3] = new upgrade(n, d, e, 5000, 4);
  
  n = "amount of missles";
  d = "Increases the amount of missles you shoot";
  e = new String[1];
  e[0] = "Amount of Missles: " + player.numOfMissles + " + " + 1 + " = " + (player.numOfMissles+1);
  upgrades[0][4] = new upgrade(n, d, e, 10000, 5);
  
  n = "missle splash area";
  d = "Increases the radius of the splash area";
  e = new String[1];
  e[0] = "Splash Diameter: " + player.missleSplash + " + " + 50 + " = " + (player.missleSplash+50);
  upgrades[0][5] = new upgrade(n, d, e, 25000, 6);
  
  n = "missle smart rating";
  d = "Increases the amount of degrees, right and left of the missle, in which it can track/follow enemy";
  e = new String[1];
  e[0] = "Smart rating: " + player.smartRating + " + " + 10 + " = " + (player.smartRating+10);
  upgrades[0][6] = new upgrade(n, d, e, 35000, 7);
  
  n = "missle drift speed";
  d = "Increases the speed in which missles can turn (increases chances of hitting target)";
  e = new String[1];
  e[0] = "Rocket drift: " + player.rocketDrift + " + " + 0.2 + " = " + (player.rocketDrift+0.2);
  upgrades[0][7] = new upgrade(n, d, e, 35000, 8);
  
  n = "missle fire rate";
  d = "Increases the speed in which you shoot missles";
  e = new String[1];
  e[0] = "Missle rate of fire: " + player.missleCooldownRemember + " - " + 10 + " = " + (player.missleCooldownRemember-10);
  upgrades[0][8] = new upgrade(n, d, e, 50000, 9);
  
  
  // shield cooldown
  // shield regen (percentage value)
  // nullify chance (keep pretty low, even at max (10% max))
  // blocked percent (Max 90%)
  // DEFENSE
  
  n = "shield cooldown duration";
  d = "Decreases the amount of time it takes for shield to start regenerating";
  e = new String[1];
  e[0] = "shield cooldown: " + player.shieldCooldown + " - " + 50 + " = " + (player.shieldCooldown-50);
  upgrades[1][0] = new upgrade(n, d, e, 10000, 10);
  
  n = "shield regen rate";
  d = "Increases the speed in which the shield regenerates when shield cooldown is over";
  e = new String[1];
  e[0] = "shield regeneration: " + player.shieldRegen + " + " + 0.004 + " = " + (player.shieldRegen+0.004);
  upgrades[1][1] = new upgrade(n, d, e, 7500, 11);
  
  n = "nullification chance";
  d = "Increases chance to nullify incoming attacks completely";
  e = new String[1];
  e[0] = "nullification chance: " + player.nullifyChance + " + " + 5 + " = " + (player.nullifyChance+5);
  upgrades[1][2] = new upgrade(n, d, e, 25000, 12);
  
  n = "blocked amount";
  d = "Decreases incoming damage by a certain percentage";
  e = new String[1];
  e[0] = "blocked percent: " + player.blockedPercent + " + " + 10 + " = " + (player.blockedPercent+10);
  upgrades[1][3] = new upgrade(n, d, e, 50000, 13);
  
  // rate of upgradePoint (multiplies by 1.2 per upgrade, Max: 10)
  // progress of level (enemy drops multiply by 2, makes game progress faster, and makes bosses worth a lot)
  // upgradePoint cost decrease
  // SlowMo regen
  // SlowMo capacity
  // decrease enemy base stats for a level (Max: 10)
  // OTHER
  
  n = "upgrade point drop amount";
  d = "Increases the amount of upgrade points dropped";
  e = new String[1];
  e[0] = "upgrade point drop multiplier: " + player.upgradePointMultiplier + " + " + 0.2 + " = " + (player.upgradePointMultiplier+0.2);
  upgrades[2][0] = new upgrade(n, d, e, 8500, 14);
  
  n = "quicker level progression";
  d = "Increases the amount of upgrade points dropped";
  e = new String[1];
  e[0] = "level progression multiplier: " + player.levelMultiplier + " + " + 0.2 + " = " + (player.levelMultiplier+0.5);
  upgrades[2][1] = new upgrade(n, d, e, 12000, 15);
  
  n = "upgrade cost decrease";
  d = "Decreases the cost necessesary for other upgrades";
  e = new String[1];
  e[0] = "upgrade point cost decrease: 0x + 4x";
  upgrades[2][2] = new upgrade(n, d, e, 12500, 16);
  
  n = "slow-mo regen speed";
  d = "Increases the speed in which slow-mo regenerates";
  e = new String[1];
  e[0] = "time stop regen: " + (1/timeStopRegenRemember) + " - " + ((1/(timeStopRegenRemember-50))-(1/timeStopRegenRemember)) + " = " + (1/(timeStopRegenRemember-50));
  upgrades[2][3] = new upgrade(n, d, e, 10000, 17);
  
  n = "slow-mo capacity";
  d = "Increases the maximum amount of time slow-mo can be activated at once";
  e = new String[1];
  e[0] = "time stop capacity: " + maxTimeStop + " + " + 10 + " = " + (maxTimeStop+10);
  upgrades[2][4] = new upgrade(n, d, e, 25000, 18);
  
  n = "enemy degression";
  d = "Decreases enemy stats by a level's worth of progression";
  e = new String[1];
  e[0] = "levels degressed: 0 + 1";
  upgrades[2][5] = new upgrade(n, d, e, 30000, 19);
  
}










void draw() {
  background(0);
  cursor();
  
  if (main) drawMainMenu();
  else if (game) drawGame();
  else if (upgradeMenu) drawUpgradeMenu();
  else if (bossPracticeMenu) drawPracticeMenu();
  else gameOverScreen();
}

void gameOverScreen() {
  fill(255, 0, 0);
  textSize(100);
  text("GAME OVER", 700, 500);
}




void drawPracticeMenu() {
  background(0);
  
  for (int i = 11; i <= 14; i++) {
    buttons[i].drawButton();
    buttons[i].mouseHover();
    buttons[i].select();
  }
  
  buttons[5].drawButton();
  buttons[5].mouseHover();
  buttons[5].select();
  
}

class centerxyBoss extends enemyBoss {
  
  centerxyBoss(float hp, float dmg, float s) {
    x = 500;
    y = 0;
    
    speed = s;
    initialHP = HP = hp*150;
    DMG = dmg*2;
    
    entranceCounts = 120;
    delayBetweenAttacks = entranceCounts;
    
    attackVersion = 0;
    attackDuration = 420; // in seconds * 60
    delayBetweenAttacks = entranceCounts; // in seconds * 60
  }
  
  int i = 0; // helps with complicating the bullet patterns
  void shoot() {
    
    if (attackVersion == 1) {
      if (i == 0) {
        for (int j = 0; j < 5; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j), false, bc, gc));
        
      //} else if (i == 36) {
        //for (int j = 0; j < 5; j++) bullets.add(new bullet(x, y, DMG, 4, 4, (72*j)+36, false));
        //i += 7;
      } else if (i%2==0) {
        for (int j = 0; j < 5; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j)+i, false, bc, gc));
        for (int j = 0; j < 5; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j)-i, false, bc, gc));
        
      }
      if (i%(4*7) == 0) bullets.add(new bullet(x, y, DMG/2, 5, 6, random(0, 360), false, bc, gc));
      
      if (i == 630) i = 0;
      else i += 7 ;
      
    } else if (attackVersion == 2) {
      for (int j = 0; j < 3; j++) bullets.add(new bullet(x, y, DMG, 5, 5, (120*j)+i, false, bc, gc));
      if (i%5 == 0) for (int j = 0; j < 3; j++) bullets.add(new bullet(x, y, DMG/2, 5, 5, -(i)+(j*15), false, bc, gc));
      
      if (i%6 == 0) bullets.add(new bullet(x, y, DMG/2, 7, 7, random(0, 360), false, bc, gc));
      
      if (i == 720-1) i = 0;
      else i++;
      
    } else if (attackVersion == 3) {
      
      if (i%45 < 15) {
        bullets.add(new bullet(x, y, DMG, 7, 2, i, false, bc, gc));
        bullets.add(new bullet(x, y, DMG, 7, 2, i+1, false, bc, gc));
        bullets.add(new bullet(x, y, DMG, 7, 2, -i, false, bc, gc));
        bullets.add(new bullet(x, y, DMG, 7, 2, -i-1, false, bc, gc));
      }
      if (i%20 == 0) bullets.add(new bullet(x, y, DMG*1.5, 10, 3, random(0, 360), false, bc, gc));
      
      if (i%90==0) {
        boolean right = false;
        float a = this.x - player.x; // x between ship and player
        float b = this.y - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 49; j++) bullets.add(new bullet(x, y, DMG*1.2, 10, 5, deg+j-29, false, bc, gc));
      }
      
      if (i == 360-2) i = 0;
      else i += 2;
      
    }
    
    attackDuration--;
    if (attackDuration == 0) delayBetweenAttacks = 120; // NEED TO CHANGE TO CHANGE DELAY DURATION
  }
  
  void act() {
    if (delayBetweenAttacks > 1) delayBetweenAttacks--;
    else if (delayBetweenAttacks == 1) {
      attackDuration = 420; // NEED TO CHANGE TO CHANGE ATTACK DURATION
      attackVersion++;
      if (attackVersion == 4) attackVersion = 1;
      delayBetweenAttacks--;
      i = 0;
    } else {
      shoot();
    }
  }
  
  
  
  

  void move() {
    //px = x;
    //py = y;
    
    if (entranceCounts >= 0) {
      y += 500/120;
      entranceCounts--;
      bossMoved = true;
    } else {
      bossMoved = false;
    }
    if (animationCounts == 540) animationCounts = 0;
    else animationCounts++;
    
    //if (px == x && py == y) bossMoved = false;
    //else bossMoved = true;
  }
  
  
  
  
  
  void drawBoss() {
    fill(255, 0, 0);
    translate(500, y);
    
    // originally had 3 squares rotating
    // actual asset has 2 squares rotating and a crystal staying in place
    
    //stroke(0);
    //strokeWeight(6);
    // when this does 3 rotations
    rotate(radians(animationCounts/2));
    image(centerxyBossBig, -100, -100, 200, 200);
    //square(-100, -100, 200);
    rotate(-radians(animationCounts/2));
    
    // this does 2
    rotate(-radians(animationCounts/3));
    image(centerxyBossSmall, -100, -100, 200, 200);
    //square(-75, -75, 150);
    rotate(radians(animationCounts/3));
    
    // REPLACED WITH CRYSTAL BELOW
    // this does 1
    //rotate(radians(animationCounts/6));
    //square(-50, -50, 100);
    //rotate(-radians(animationCounts/6));
    //noStroke();
    
    image(centerxyBossCenter, -100, -100, 200, 200);
    
    translate(-500, -y);
    
    // health bar
    float temp = dist(player.x, 50, player.x, player.y)-100;
    strokeWeight(2);
    stroke(255, 0, 0, temp);
    fill(0, temp);
    rect(50, 50, 900, 75);
    noStroke();
    fill(255, 0, 0, temp);
    rect(51, 51, map(HP, 0, initialHP, 0, 898), 73);
  }
  
  
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      reward();
      this.oob = true;
    }
  }
  
  void reward() {
    player.giveReward(baseReward*400, levelIncrease - backgroundScore, baseReward*400);
  }
  
  
  
  
  
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-100 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+100 && this.y-100 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+100 && b.playerBullet) {
        b.oob = true;
        damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  boolean checkCollision(float x, float y, float size) {
    if (this.x-100 < x+(size/2) && x-(size/2) < this.x+100 && this.y-100 < y+(size/2) && y-(size/2) < this.y+100) return true;
    else return false;
  }
}

































// working on big, in the centerx and topy of screen
class centerxtopyBoss extends enemyBoss {
  
  centerxtopyBoss(float hp, float dmg, float s) {
    x = 500;
    y = 0;
    
    speed = s;
    initialHP = HP = hp*600;
    DMG = dmg*2;
    
    entranceCounts = 120;
    delayBetweenAttacks = entranceCounts;
    
    attackVersion = 2;
    attackDuration = 420; // in seconds * 60
    delayBetweenAttacks = entranceCounts; // in seconds * 60
  }
  
  int i = 0; // helps with complicating the bullet patterns
  void shoot() {
    
    if (attackVersion == 1) {
      
      if (i%90==0) {
        boolean right = false;
        float a = (this.x+400) - player.x; // x between ship and player
        float b = (this.y+200) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 23; j++) bullets.add(new bullet(x+400, y+200, DMG, 10, 5, deg+j-11, false, bc, gc));
      }
      
      if (i%90==45) {
        boolean right = false;
        float a = (this.x-400) - player.x; // x between ship and player
        float b = (this.y+200) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 23; j++) bullets.add(new bullet(x-400, y+200, DMG*1.2, 10, 5, deg+j-11, false, bc, gc));
      }
      
      if (i%4 == 0) bullets.add(new bullet(x+200, y+100, DMG/1.2, 8, 6, 135 + random(0, 90), false, bc, gc));
      if (i%4 == 2) bullets.add(new bullet(x-200, y+100, DMG/1.2, 8, 6, 135 + random(0, 90), false, bc, gc));
      
      if (i == 90-1) i = 0;
      else i++;
      
    } else if (attackVersion == 2) {
      
      if (i==0) {
        bullets.add(new bullet(x, y+125, DMG*5, 100, 2, 135, false, bc, gc));
        bullets.add(new bullet(x, y+125, DMG*5, 100, 2, 180, false, bc, gc));
        bullets.add(new bullet(x, y+125, DMG*5, 100, 2, 225, false, bc, gc));
        boolean right = false;
        float a = (this.x-400) - player.x; // x between ship and player
        float b = (this.y+200) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x, y+125, DMG*5, 100, 2, deg, false, bc, gc));
      }
      
      if (i%36 < 6) {
        
        boolean right = false;
        float a = (this.x+60) - player.x; // x between ship and player
        float b = (this.y+50) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x+60, y+50, DMG*5, 8, 8, deg-5+random(0,10), false, bc, gc));
        
      } else if (i%36 < 12) {
        
        boolean right = false;
        float a = (this.x+90) - player.x; // x between ship and player
        float b = (this.y+100) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x+90, y+100, DMG*5, 8, 8, deg-5+random(0,10), false, bc, gc));
        
      } else if (i%36 < 18) {
        
        boolean right = false;
        float a = (this.x+75) - player.x; // x between ship and player
        float b = (this.y+170) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x+75, y+170, DMG*5, 8, 8, deg-5+random(0,10), false, bc, gc));
        
      } else if (i%36 < 24) {
        
        boolean right = false;
        float a = (this.x-75) - player.x; // x between ship and player
        float b = (this.y+170) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x-75, y+170, DMG*5, 8, 8, deg-5+random(0,10), false, bc, gc));
        
      } else if (i%36 < 30) {
        
        boolean right = false;
        float a = (this.x-90) - player.x; // x between ship and player
        float b = (this.y+100) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x-90, y+100, DMG*5, 8, 8, deg-5+random(0,10), false, bc, gc));
        
      } else {
        
        boolean right = false;
        float a = (this.x-60) - player.x; // x between ship and player
        float b = (this.y+50) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        bullets.add(new bullet(x-60, y+50, DMG*5, 8, 8, deg-5+random(0,10), false, bc, gc));
        
      } 
      
      if (i == 720-1) i = 0;
      else i++;
      
      // finish attack animation to make circle close in on player
    } else if (attackVersion == 3) {
      
      if (i == 120) {
        boolean right = false;
        float a = (this.x) - player.x; // x between ship and player
        float b = (this.y+100) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 50; j++) bullets.add(new bullet(x, y+100, j*DMG/5, 2*j, 100-(2*j), deg, false, bc, gc));
      }
      
      if (i%2==0) {
        for (int j = 0; j < 5; j++) bullets.add(new bullet(x+400, y+200, DMG/4, 3, 4, (72*j)+2*i, false, bc, gc));
        //for (int j = 0; j < 5; j++) bullets.add(new bullet(x+400, y+200, DMG/4, 4, 4, (72*j)-i, false, bc, gc));
        //for (int j = 0; j < 5; j++) bullets.add(new bullet(x-400, y+200, DMG/4, 4, 4, (72*j)+i, false));
        for (int j = 0; j < 5; j++) bullets.add(new bullet(x-400, y+200, DMG/4, 3, 4, (72*j)-2*i, false, bc, gc));
      }
      
      if (i == 720-1) i = 0;
      else i++;
      
    }
    
    attackDuration--;
    if (attackDuration == 0) delayBetweenAttacks = 90;
  }
  
  void act() {
    if (delayBetweenAttacks > 1) delayBetweenAttacks--;
    else if (delayBetweenAttacks == 1) {
      attackDuration = 420;
      attackVersion++;
      if (attackVersion == 4) attackVersion = 1;
      delayBetweenAttacks--;
      i = 0;
    } else {
      shoot();
    }
  }
  
  
  
  

  void move() {
    //px = x;
    //py = y;
    
    if (entranceCounts >= 0) {
      if (entranceCounts%2 == 0) y += 1;
      entranceCounts--;
      bossMoved = true;
    } else {
      bossMoved = false;
    }
    if (animationCounts == 180) animationCounts = 0;
    else animationCounts++;
    
    //if (px == x && py == y) bossMoved = false;
    //else bossMoved = true;
  }
  
  
  
  
  
  // going to have to change this to something easier for the machine to draw
  void drawBoss() {
    
    image(centerxtopyBoss, x-500, y-120, 1000, 400);
    
    /*
    fill(255, 0, 0);
    //translate(500, y);
    //rotate(radians(animationCounts/3));
    rect(x-400, y-200, 800, 400);
    circle(x-400+(cos(radians(animationCounts)*2)*10), y+200+(sin(radians(animationCounts)*2)*10), 200);
    circle(x+400-(cos(radians(animationCounts)*2)*10), y+200+(sin(radians(animationCounts)*2)*10), 200);
    stroke(0);
    
    // x is 500, y is 120
    
    circle(x-200, y+100, 150);
    circle(x+200, y+100, 150);
    circle(x, y+125, 100);
    
    strokeWeight(5);
    
    circle(x+60, y+50, 40);
    circle(x-60, y+50, 40);
    
    circle(x+90, y+100, 40);
    circle(x-90, y+100, 40);
    
    circle(x+75, y+170, 40);
    circle(x-75, y+170, 40);
    
    circle(x-400, y+200, 150);
    circle(x+400, y+200, 150);
    noStroke();
    //rotate(-radians(animationCounts/3));
    //translate(-500, -y);*/
    
    //attack animation (make outer crystals "give energy" to middle, making ball bigger)
    if (attackVersion == 3 && i < 120) {
      stroke(255, 0, 0);
      strokeWeight(3);        
      line(x, y+125, player.x, player.y);
      stroke(255);
      
      line(560, 110, 500, 185);
      line(440, 110, 500, 185);
      line(575, 230, 500, 185);
      line(425, 230, 500, 185);
      line(590, 160, 500, 185);
      line(410, 160, 500, 185);
      
      strokeWeight(1);
      line(x, y+125, x+(player.x-x)*4, y+125+(player.y-(y+125))*4);
      if (i > 90) {
        stroke(255, 0, 0);
        strokeWeight(5);
        noFill();
        circle(player.x, player.y, 50-(1500/-((i-90)*8+1)));
      }
      noStroke();
      
      fill(255, 255-(i*2), 255-(i*2));
      circle(x, y+125, map(i, 0, 120, 0, 150));
      
    }
    
    // health bar
    float temp = dist(player.x, 50, player.x, player.y)-100;
    strokeWeight(2);
    stroke(255, 0, 0, temp);
    fill(0, temp);
    rect(50, 50, 900, 75);
    noStroke();
    fill(255, 0, 0, temp);
    rect(51, 51, map(HP, 0, initialHP, 0, 898), 73);
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      reward();
      this.oob = true;
    }
  }
  
  void reward() {
    player.giveReward(baseReward*400, levelIncrease - backgroundScore, baseReward*400);
  }
  
  void checkImpact() {
    for (bullet b : bullets) {
      if (b.y-(b.size/2) < this.y+300 && b.playerBullet) {
        b.oob = true;
        damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  boolean checkCollision(float x, float y, float size) {
    if (y-(size/2) < this.y+200) return true;
    else return false;
  }
}







































// dragon boss thing
class fastBoss extends enemyBoss {
  
  fastBoss(float hp, float dmg, float s) {
    x = 500;
    y = 0;
    
    speed = s;
    initialHP = HP = hp*100;
    DMG = dmg*2;
    
    entranceCounts = 120;
    delayBetweenAttacks = entranceCounts;
    
    attackVersion = 0;
    attackDuration = 420; // in seconds * 60
    delayBetweenAttacks = entranceCounts; // in seconds * 60
    
    bossMoved = true;
  }
  
  int i = 0; // helps with complicating the bullet patterns
  float rememberX, rememberY; // helps with attackVersion3
  float rememberDegreesTopRight, rememberDegreesTopLeft, rememberDegreesBottomRight, rememberDegreesBottomLeft;
  void shoot() {
    
    
    
    if (attackVersion == 1) {
      
      if (i == 0) {
        boolean right = false;
        float a = (this.x-45) - player.x; // x between ship and player
        float b = (this.y-90) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 20; j++) bullets.add(new bullet(x-45, y-90, DMG, 6, 6+random(-0.5, 0.5), deg-15+random(0,30), false, bc, gc));
      } else if (i == 44) {
        boolean right = false;
        float a = (this.x+45) - player.x; // x between ship and player
        float b = (this.y+90) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 20; j++) bullets.add(new bullet(x+45, y+90, DMG, 6, 6+random(-0.5, 0.5), deg-15+random(0,30), false, bc, gc));
      } else if (i == 89) {
        boolean right = false;
        float a = (this.x-45) - player.x; // x between ship and player
        float b = (this.y+90) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 20; j++) bullets.add(new bullet(x-45, y+90, DMG, 6, 6+random(-0.5, 0.5), deg-15+random(0,30), false, bc, gc));
      } else if (i == 134) {
        boolean right = false;
        float a = (this.x+45) - player.x; // x between ship and player
        float b = (this.y-90) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        for (int j = 0; j < 20; j++) bullets.add(new bullet(x+45, y-90, DMG, 6, 6+random(-0.5, 0.5), deg-15+random(0,30), false, bc, gc));
      }
      
      if (i%4==0) {
        for (int j = 0; j < 8; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j)+i, false, bc, gc));
        for (int j = 0; j < 8; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j)-i, false, bc, gc));
      }
      
      if (i == 180-1) i = 0;
      else i++;
      
      
    } else if (attackVersion == 2) {
      
      if (i == 0) {
        rememberX = player.x;
        rememberY = player.y;
        
        boolean right = false;
        float a = (this.x+45) - player.x; // x between ship and player
        float b = (this.y-90) - player.y; // y betwwen ship and player
        double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        rememberDegreesTopRight = deg;
        
        right = false;
        a = (this.x-45) - player.x; // x between ship and player
        b = (this.y-90) - player.y; // y betwwen ship and player
        c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        rememberDegreesTopLeft = deg;
        
        right = false;
        a = (this.x-45) - player.x; // x between ship and player
        b = (this.y+90) - player.y; // y betwwen ship and player
        c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        rememberDegreesBottomLeft = deg;
        
        right = false;
        a = (this.x+45) - player.x; // x between ship and player
        b = (this.y+90) - player.y; // y betwwen ship and player
        c = Math.sqrt((a*a)+(b*b)); // hypotenuse
        if (a < 0) {
          right = true;
        }
        deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
        if (!right) {
          deg = 360 - deg;
        }
        rememberDegreesBottomRight = deg;
        
      }
      
      if (i < 45) {
        bullets.add(new bullet(x+45, y+90, DMG, 7, 4, rememberDegreesBottomRight-45+i, false, bc, gc));
        bullets.add(new bullet(x-45, y+90, DMG, 7, 4, rememberDegreesBottomLeft+45-i, false, bc, gc));
        for(int j = 0; j < 3; j++) {
          bullets.add(new bullet(x+45, y-90, DMG, 6, 6, rememberDegreesTopRight-25+random(0, 50), false, bc, gc));
          bullets.add(new bullet(x-45, y-90, DMG, 6, 6, rememberDegreesTopLeft-25+random(0, 50), false, bc, gc));
        }
      } else if (i%3 == 0){
        bullets.add(new bullet(x+45, y+90, DMG, 7, 4, rememberDegreesBottomRight-90+i, false, bc, gc));
        bullets.add(new bullet(x-45, y+90, DMG, 7, 4, rememberDegreesBottomLeft+90-i, false, bc, gc));
        bullets.add(new bullet(x+45, y-90, DMG, 6, 6, rememberDegreesTopRight-45+i, false, bc, gc));
        bullets.add(new bullet(x-45, y-90, DMG, 6, 6, rememberDegreesTopLeft+90-i, false, bc, gc));
        
      }
      
      if (i%15==0) {
        for (int j = 0; j < 4; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j)+i, false, bc, gc));
        for (int j = 0; j < 4; j++) bullets.add(new bullet(x, y, DMG/4, 4, 4, (72*j)-i, false, bc, gc));
      }
      
      if (i == 90-1) i = 0;
      else i++;
      
    } else if (attackVersion == 3) {
      
      if (i == 0) {
        rememberX = random(100, 800);
        rememberY = random(500, 900);
      }
      
      if (i < 50) {
        strokeWeight(3);
        stroke(map(i, 0, 50, 0, 255));
        noFill();
        circle(rememberX, rememberY, 80-(1500/-(i*3+1)));
        circle(rememberX, rememberY, 80);
        noStroke();
      } else if (i < 70) {
        background(255, 0, 0);
        fill(0);
        stroke(255);
        circle(rememberX, rememberY, 80);
        noStroke();
        noFill();
        player.displayShip();
        
        if (sqrt(((rememberX-player.x)*(rememberX-player.x)) + ((rememberY-player.y)*(rememberY-player.y))) > 40) player.damage(player.maxHealth/40);
      }
      
      if (i == 70-1) i = 0;
      else i++;
      
    }
    
    attackDuration--;
    if (attackDuration == 0) {
      if (attackVersion == 2) delayBetweenAttacks = 150;
      else delayBetweenAttacks = 90;
    }
  }
  
  void act() {
    if (delayBetweenAttacks > 1) delayBetweenAttacks--;
    else if (delayBetweenAttacks == 1) {
      attackDuration = 420;
      attackVersion++;
      if (attackVersion == 3) attackDuration = 500;
      if (attackVersion == 4) attackVersion = 1;
      delayBetweenAttacks--;
      i = 0;
    } else {
      shoot();
    }
  }
  
  
  
  
  boolean movingRight = true;
  void move() {
    
    //px = x;
    //py = y;
    
    if (entranceCounts >= 0) {
      y += 2;
      entranceCounts--;
    }
    else {
      if (animationCounts == 360) animationCounts = 0;
      else animationCounts++;
      if (movingRight) {
        x += 5;
        if (x > 500) y += 1;
        else y -= 1;
      } else {
        x -= 5;
        if (x < 500) y += 1;
        else y -= 1;
      }
      if (x >= 900) movingRight = false;
      if (x <= 100) movingRight = true;
    }
    
    //if (px == x && py == y) bossMoved = false;
    //else bossMoved = true;
  }
  
  
  
  
  
  void drawBoss() {
    
    image(fastBoss, x-60, y-110, 120, 220);
    /*
    fill(255, 0, 0);
    //translate(500, y);
    //rotate(radians(animationCounts/3));
    rect(x-45, y-90, 90, 180);
    //rotate(-radians(animationCounts/3));
    //translate(-500, -y);
    rect(x-45, y-120, map(HP, 0, initialHP, 0, 90), 15);
    fill(0);
    text("BOSS", x, y);
    */
    
    // health bar
    
    float temp = dist(player.x, 50, player.x, player.y)-100;
    strokeWeight(2);
    stroke(255, 0, 0, temp);
    fill(0, temp);
    rect(50, 50, 900, 75);
    noStroke();
    fill(255, 0, 0, temp);
    rect(51, 51, map(HP, 0, initialHP, 0, 898), 73);
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      reward();
      this.oob = true;
    }
  }
  
  void reward() {
    player.giveReward(baseReward*400, levelIncrease - backgroundScore, baseReward*400);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-45 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+45 && this.y-90 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+90 && b.playerBullet) {
        b.oob = true;
        damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  boolean checkCollision(float x, float y, float size) {
    if (this.x-45 < x+(size/2) && x-(size/2) < this.x+45 && this.y-90 < y+(size/2) && y-(size/2) < this.y+90) return true;
    else return false;
  }
}







































// super small boss v1
// plays a lot with barriers
// attack 1 idea: lazers closing in from sides while bullets go crazy
class smallBoss extends enemyBoss {
  
  smallBoss(float hp, float dmg, float s) {
    x = 500;
    y = 0;
    
    speed = s;
    initialHP = HP = hp*40;
    DMG = dmg*2;
    
    entranceCounts = 120;
    delayBetweenAttacks = entranceCounts;
    
    attackVersion = 0;
    attackDuration = 420; // in seconds * 60
    delayBetweenAttacks = entranceCounts; // in seconds * 60
    
    bossMoved = true;
  }
  
  // helps for attackVersion 2
  float[] rememberX = new float[3], rememberY = new float[3];
  int[] counter = new int[3]; // duration of version 2 attack
  
  int i = 0; // helps with complicating the bullet patterns
  void shoot() {
    
    
    
    if (attackVersion == 1) {
      
      float deg = 0;
      boolean right = false;
      float a = this.x - player.x; // x between ship and player
      float b = this.y - player.y; // y betwwen ship and player
      double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
      if (a < 0) {
        right = true;
      }
      deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
      if (!right) {
        deg = 360 - deg;
      }
      
      fill(255, 0, 0);
      if (i < 200) {
        float j = map(i, 0, 200, 0, 350);
        rect(0, 0, j, 1000);
        rect(1000, 0, -j, 1000);  
        if (player.x < j || player.x > 1000-j) player.damage(DMG/5);
      } else {
        rect(0, 0, 350, 1000);
        rect(1000, 0, -350, 1000);  
        if (player.x < 350 || player.x > 650) player.damage(DMG/5);
      }
      
      fill(255, 0, 0, 100);
      strokeWeight(5);
      stroke(255, 0, 0);
      circle(x, y, 100);
      noStroke();
      if (sqrt(((this.x-player.x)*(this.x-player.x)) + ((this.y-player.y)*(this.y-player.y))) < 100) player.damage(DMG/2);

      if (i%4==0) {
        int j = 0;
        
        switch(i%24) {
          case 0:
            j = 12;
            break;
          case 4:
            j = 8;
            break;
          case 8:
            j = 4;
            break;
          case 12:
            j = 0;
            break;
          case 16:
            j = 4;
            break;
          case 20:
            j = 8;
            break;
        }
        
        bullets.add(new bullet(x, y, DMG, 4, 12, deg+j, false, bc, gc));
        bullets.add(new bullet(x, y, DMG, 4, 12, deg-j, false, bc, gc));
      }
      
      
      for (int j = 0; j < 7; j++) bullets.add(new bullet(x, y, DMG, 10, 15, deg+15 + (j*55), false, bc, gc));
      
      int k = i%60;
      for (int j = 0; j < 3; j++) bullets.add(new bullet(x, y, DMG/4, 10, 15, map(k, 0, 60, deg+180+(j*55), deg+180+((j+1)*55)), false, bc, gc));
      for (int j = 0; j < 3; j++) bullets.add(new bullet(x, y, DMG/4, 10, 15, map(k, 0, 60, deg-180-(j*55), deg-180-((j+1)*55)), false, bc, gc));

      i++;
      
      
    } else if (attackVersion == 2) {
      
      stroke(255, 150);
      strokeWeight(1);
      line(player.x, 0, player.x, 1000);
      line(0, player.y, 1000, player.y);
      noStroke();
      
      if (i%42 == 0) {
        rememberX[i/42] = player.x;
        rememberY[i/42] = player.y;
        counter[i/42] = 126;
      }
     
      int temp = (i-(i%42))/42;
      stroke(255, 0, 0, 120);
      strokeWeight(5);
      line(rememberX[temp], 0, rememberX[temp], 1000);
      line(0, rememberY[temp], 1000, rememberY[temp]);
      noStroke();

      fill(255, 0, 0, 255);
      for (int j = 0; j < 3; j++) {
        if (counter[j] != 0) {
          counter[j]--;
          if (counter[j] < 126-35) {
            rect(rememberX[j]-10, 0, 20, 1000);
            rect(0, rememberY[j]-10, 1000, 20);
            if (rememberX[j]-10 < player.x && player.x < rememberX[j]+10) player.damage(DMG/10);
            if (rememberY[j]-10 < player.y && player.y < rememberY[j]+10) player.damage(DMG/10);
            
            if (counter[j] < 5) for (int k = 0; k < 16; k++) bullets.add(new bullet(rememberX[j], rememberY[j], DMG/5, 10, 3, k*22.5, false, bc, gc));
          }
        }
      }
      
      if (i%15 == 0) {
        bullets.add(new bullet(random(50, 950), 0, DMG, 7, 4, 180, false, bc, gc));
      }
      
      if (i == 126-1) i = 0;
      else i++;
      
    } else if (attackVersion == 3) {
      
      if (i == 0) {
        rememberX[0] = random(150, 850);
        counter[0] = 140;
      } else if (i == 70) {
        rememberY[0] = random(150, 850);
        counter[1] = 140;
      }
      
      int size = 50;
      if (counter[0] != 0) {
        counter[0]--;
        if (counter[0] < 70) {
          fill(255, 0, 0, 220);
          rect(rememberX[0]-size, 0, -rememberX[0], 1000);
          rect(rememberX[0]+size, 0, 1000-rememberX[0], 1000);
          if (player.x < rememberX[0]-size || rememberX[0]+size < player.x) player.damage(DMG/5);
        } else {
          if (counter[0] > 130) {
            float temp = random(0, 2);
            bullets.add(new bullet(rememberX[0], (temp > 1 ? 0 : 1000), DMG/10, 5, 6, (temp > 1 ? 180 : 0), false, bc, gc));
          }
          fill (255, 0, 0, 120);
          rect(rememberX[0]-size, 0, -rememberX[0], 1000);
          rect(rememberX[0]+size, 0, 1000-rememberX[0], 1000);
        }
      }
      
      if (counter[1] != 0) {
        counter[1]--;
        if (counter[1] < 70) {
          fill(255, 0, 0, 220);
          rect(0, rememberY[0]-size, 1000, -rememberY[0]);
          rect(0, rememberY[0]+size, 1000, 1000-rememberY[0]);
          if (player.y < rememberY[0]-size || rememberY[0]+size < player.y) player.damage(DMG/5);
        } else {
          if (counter[1] > 130) {
            float temp = random(0, 2);
            bullets.add(new bullet((temp > 1 ? 0 : 1000), rememberY[0], DMG/2, 5, 6, (temp > 1 ? 90 : 270), false, bc, gc));
          }
          fill (255, 0, 0, 120);
          rect(0, rememberY[0]-size, 1000, -rememberY[0]);
          rect(0, rememberY[0]+size, 1000, 1000-rememberY[0]);
        }
      }
      
      
      if (i == 140-1) i = 0;
      else i++;
      
    }
    
    attackDuration--;
    if (attackDuration == 0) {
      if (attackVersion == 2) delayBetweenAttacks = 150;
      else delayBetweenAttacks = 90;
    }
  }
  
  void act() {
    if (delayBetweenAttacks > 1) delayBetweenAttacks--;
    else if (delayBetweenAttacks == 1) {
      attackDuration = 420;
      attackVersion++;
      //if (attackVersion == 3) attackDuration = 500;
      if (attackVersion == 4) attackVersion = 1;
      delayBetweenAttacks--;
      i = 0;
      rememberX = new float[3];
      rememberY = new float[3];
      counter = new int[3];
    } else {
      shoot();
    }
  }
  
  
  
  
  boolean movingRight = true;
  void move() {
    
    //px = x;
    //py = y;
    
    if (entranceCounts >= 0) {
      y += 2;
      entranceCounts--;
    }
    else {
      if (animationCounts == 360) animationCounts = 0;
      else animationCounts++;
      /*if (movingRight) {
        x += 5;
        if (x > 500) y += 1;
        else y -= 1;
      } else {
        x -= 5;
        if (x < 500) y += 1;
        else y -= 1;
      }
      if (x >= 900) movingRight = false;
      if (x <= 100) movingRight = true;*/
    }
    
    //if (px == x && py == y) bossMoved = false;
    //else bossMoved = true;
  }
  
  
  
  
  
  void drawBoss() {
    
    fill(255, 0, 0);
    image(smallBoss, x-25, y-25, 50, 50);
    
    // health bar
    
    float temp = dist(player.x, 50, player.x, player.y)-100;
    strokeWeight(2);
    stroke(255, 0, 0, temp);
    fill(0, temp);
    rect(50, 50, 900, 75);
    noStroke();
    fill(255, 0, 0, temp);
    rect(51, 51, map(HP, 0, initialHP, 0, 898), 73);
  }
  
  void damage(float dmg) {
    if (delayBetweenAttacks > 1) HP -= dmg;
    else if (attackVersion == 3) HP -= 0;
    else HP -= dmg/4;
    if (this.HP <= 0) {
      reward();
      this.oob = true;
    }
  }
  
  void reward() {
    player.giveReward(baseReward*400, levelIncrease - backgroundScore, baseReward*400);
  }
  
  void checkImpact() {
    for (bullet b : bullets) {
      if (this.x-25 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+25 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+25 && b.playerBullet) {
        b.oob = true;
        damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }
}

// different boss attacks for every difficulty

// big boss with "weak spot" (eye)
// centerxtopy boss but with more in-depth bullet patterns
// introduces bouncing bullets and bullet arcs

// super small boss v2
// introduces / plays a lot with "gravity" of bullets
// attack 1 idea: goes to bottom; shoots MANY bullets up that have a gravity going down, but once going down it goes very slowly down.

// boss that has a center, but has 2 spires on the side. Spires are vulnerable, but while up, main body is invulnerable
// plays a lot with bouncing and reversing bullets

// boss that can only be hurt when inside a specific barrier (centerxy but moves a little in a circle)
// plays a lot with bullet-based boundaries

// twin bosses

// mega carrier (like some battleship that shoots bullets and missles)
// mini droid (super small but not a lot of health. Can move below the screen, or purposely stay behind the player, can duplicate itself)
// "magician" (similar to droid except has the excuse to spawn bullets/missles and other stuff out of nowhere and not from a turret/slot)
// bullet master (can use bullets to create obsurd patterns... Like circular patterns, or make them go 90 degree angles... Only uses bullets)
// barrier master (same as above but with barriers)
// anti-player (could be "final boss"... may use player stats as a basis) (mega boss... PLENTY of move variations)
// ship sender

// maybe add missles/lazers???

// checks and reverses movement velocity first, and then moves the bullet
// bullet bounces

// have 2 parallel array that would contain seconds until and degree amounts for more complicated movements
// int to determine how many times the bullet will bounce off the wall
// float to determine how much of an arc (change in degree amount) a bullet has per frame, and another for "the maximum amount the bullet can turn

int numOfEnemyBullets = 0;
int numOfPlayerBullets = 0;
class bullet {  
  int id;
  
  float x;
  float y;
  
  float size;
  float damage;
  
  float speed;
  float degrees; // 0 being up, 90 being right, 180 being down, 270 being left
  
  boolean playerBullet;
  boolean oob = false;
  
  color bulletColor;
  color glowColor;
  
  bullet(float xx, float yy, float ndamage, float nsize, float nspeed, float ndegrees, boolean pb, color bc, color gc) {
    x = xx;
    y = yy;
    damage = ndamage;
    size = nsize;
    speed = nspeed;
    degrees = ndegrees;
    playerBullet = pb;
    if (pb) numOfPlayerBullets++;
    else numOfEnemyBullets++;
    id = bullets.size();
    bulletColor = bc;
    glowColor = gc;
  }
  
  void checkOutOfBounds() {
    if (x < 0 || 1000 < x || y < 0 || 1000 < y) oob = true;
  }
  
  void displayBullet() {
    if (playerBullet) {
      fill(bulletColor, min(255-numOfEnemyBullets, 255-numOfEnemyMissles));
    } else {
      fill(bulletColor);
    }
    //strokeWeight(10);
    //stroke(glowColor, 100);
    circle(x, y, size);
    //noStroke();
    
    // would've add glow effect but it get slow
    
    /*
    blendMode(ADD);
    strokeWeight(size/4);
    stroke(glowColor, 120);
    noFill();
    circle(x, y, size);
    blendMode(BLEND);
    */
  }
  
  void updateBullet() {
    x += Math.sin(radians(degrees))*speed;
    y -= Math.cos(radians(degrees))*speed;
  }
}

class button {
  
  int id;
  
  int x, y, l, w;
  color c1, c2; // hover, not hovered
  String s;
  
  boolean selected = false;
  
  button(int xx, int yy, int ll, int ww, color cc1, color cc2, String ss, int ID) {
    x = xx;
    y = yy;
    l = ll;
    w = ww;
    c1 = cc1;
    c2 = cc2;
    s = ss;
    
    id = ID;
  }
  
  void drawButton() {
    fill(c2);
    rect(x, y, l, w);
    
    stroke(255);
    strokeWeight(1);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(s, (x+(x+l))/2, (y+(y+w))/2);
    noStroke();
  }
  
  void mouseHover() {
    
    if (x < mouseX && mouseX < x+l && y < mouseY && mouseY < y+w) {
      fill(0, 100);
      stroke(255);
      strokeWeight(1);
      rect(x, y, l, w);
      
      fill(c1);
      textSize(20);
      textAlign(CENTER, CENTER);
      text(s, (x+(x+l))/2, (y+(y+w))/2);
      
      noStroke();
      
      selected = true;
    } else selected = false;
  }
  
  int select(int num) {
    if (!mousePressed) mouseClicked = false;
    if (mousePressed && selected && !mouseClicked) {
      mouseClicked = true;
      if (id == 1) return num -= 1;
      else if (id == 2) return num += 1;
    }
    return num;
  }
  
  void select() {
    if (!mousePressed) mouseClicked = false;
    if (mousePressed && selected && !mouseClicked) {
      mouseClicked = true;
      if (id == 1) { // ABOUT
        about = true;
      } else if (id == 2) { // INSTRUCTIONS
        instructions = true;
        pageNumber = 1;
      } else if (id == 3) { // EASY
        main = false;
        game = true;
        di = 1.2;
        spawnRate = 2;
        levelIncrease = 23;
        
        level = 1;
        score = 0;
        upgradePoints = 0;
        backgroundScore = 0;
        baseHP = 1;
        baseDMG = 1;
        baseReward = 2;
        
        player = new playerShip();
        
      } else if (id == 4) { // NORMAL
        main = false;
        game = true;
        di = 1.3;
        spawnRate = 3;
        levelIncrease = 23;
        
        level = 1;
        score = 0;
        upgradePoints = 0;
        backgroundScore = 0;
        baseHP = 1;
        baseDMG = 1;
        baseReward = 2;
        
        player = new playerShip();
        
      } else if (id == 5) { // HARD
        main = false;
        game = true;
        di = 1.4;
        spawnRate = 4;
        levelIncrease = 23;
        
        level = 1;
        score = 0;
        upgradePoints = 0;
        backgroundScore = 0;
        baseHP = 1;
        baseDMG = 1;
        baseReward = 2;
        
        player = new playerShip();
        
      } else if (id == 6) {
        main = true;
        about = false;
        instructions = false;
        bossPracticeMenu = false;
      } else if (id == 7) {
        main = false;
        bossPracticeMenu = true;
      } else if (id == 8) {
        enemies = new ArrayList<enemyShip>();
        
        baseHP = 1;
        baseDMG = 1;
        
        player = new playerShip();
        game = true;
        bossPractice = true;
        bossMode = true;
        level = 5;
      } else if (id == 9) {
        enemies = new ArrayList<enemyShip>();
        player = new playerShip();
        
        baseHP = 1;
        baseDMG = 1;
        
        game = true;
        bossPractice = true;
        bossMode = true;
        level = 10;
      } else if (id == 10) {
        enemies = new ArrayList<enemyShip>();
        player = new playerShip();
        
        baseHP = 1;
        baseDMG = 1;
        
        game = true;
        bossPractice = true;
        bossMode = true;
        level = 15;
      } else if (id == 11) {
        enemies = new ArrayList<enemyShip>();
        player = new playerShip();
        
        baseHP = 1;
        baseDMG = 1;
        
        game = true;
        bossPractice = true;
        bossMode = true;
        level = 20;
      } 
    }
  }
}

// boss with many aspects of it being randomized
// turns off spawning enemies
// every 5 levels
// BIG upgradePoint gain

// 3 different type of bosses

// Big in center center
//   High health
//   lots of bullets with medium damage
//   simple pattern bullet patterns (less locking on 30%, more pattern 70%)
//   minimal movement
//
// Big on top center
//   VERY high in health
//   medium-high amount of bullets with medium-high damage
//   simple locking on (less pattern 30%, more locking on 70%)
//   no movement
//
// Medium moving around
//   Medium health
//   high amount of bullets with medium damage
//   complex pattern (less locking on 15%, more pattern 85%)
//   medium movement
//


// working on big, in the centerx and centery of screen
boolean bossMoved = false;
class enemyBoss {
  
  float px, py, x, y;
  float initialHP, HP, DMG, speed;
  
  boolean oob;
  
  int attackVersion;
  int attackDuration;
  int delayBetweenAttacks;
  
  color bc = color(255, 0, 0);
  color gc = color(255, 0, 0);
  
  void shoot() {}
  
  void act() {}
  
  int animationCounts;
  int entranceCounts;
  void move() {}
  
  void drawBoss() {}
  
  void checkImpact() {}
  
  void damage(float dmg) {}
  
  
  void reward() {}
  
  boolean checkCollision(float x, float y, float size) {return false;}
}

// might add more ship types

// mini-bosses (1 per level, spawn upon mid level, not including every 5 levels (boss spawns every 5))
// Sniper (Shoots at a slow pace, but have fast/hard-hitting bullets
// Sentry (Shoots rapid fire towards player)
// Missle (homing instead of straight forward)
// Forker (Same as normal, but shoots multiple bullets)
// Scatter (Same as big, but shoots twice as fast and in three times as much different directions (in a circle) (Upon creation it chooses to be clockwise or counterclockwise)
// Rando (Similar to big, but shoots quickly bullets once at a time in a random direction in each quadrant)
// Carrier (Carries normal ships (pretty much doubles the spawn rate while alive))


class enemyShip {
  
  float x, y;
  int baseHP = 10, baseDMG = 10;
  float speed;
  
  int initialHP, HP;
  
  int cooldown;
  int counter;
  
  boolean oob;
  
  color bc = color(255, 0, 0);
  color gc = color(255, 0, 0);
  
  void move() {}
 
  void shoot() {}
  
  // will eventually use jpeg
  void drawEnemy() {}
  
  void damage(float dmg) {}
  
  // override if different conditions
  void giveReward() {
    score += ceil(initialHP);
    backgroundScore += ceil(initialHP);
    upgradePoints += ceil(initialHP);
  }
  
  // have to override because this determines hitbox
  void checkImpact() {}
  
  // helpful method just in case
  boolean checkCollision(float x, float y, float size) { return false; }
}

// should have a scrolling down black screen with somewhat transparant white stars

float upgradePoints = 0; // can buy things like player health/damage, percentage increases in upgrade points, num of bullets
                    // bullet spread (when bought makes a slider to allow range of bullet spread), homing bullets
                    // when bullets reach a certain distance from an enemy ship, etc.

int level = 1; // enemy health, damage, and upgrade point value increase somewhat exponentially based on difficulty
float di; // difficulty increase: rate in which the enemy stats increase
float levelIncrease; // backgroundScore needed to level up

float score = 0;
float backgroundScore = 0; // used to determine level up

int spawnRate = 1;
int maxSpawnRate;

// enemy stats
float baseHP = 1, baseDMG = 1, baseReward = 2;

int bombs = 3;

float maxTimeStop = 10;
float curTimeStop;
float timeStopRegen = 300;
float timeStopRegenRemember = 300;

enemyBoss boss;
boolean bossMode = false;
boolean bossSpawned = false;

boolean miniBossSpawned = false;

playerShip player = new playerShip();

// could optimize to an array of arraylists, one for player bullets and one for enemy bullets
ArrayList<bullet> bullets = new ArrayList<bullet>();
ArrayList<missle> missles = new ArrayList<missle
>(); 
ArrayList<enemyShip> enemies = new ArrayList<enemyShip>();

boolean death = false;
void drawGame() {
  noCursor();
  noStroke();
  
  drawBackground();
  
  if (!death) {
    drawPlayer();
  } else {
    player.deathAnimation();
  }
  
  if (!bossMode) {
    spawnEnemies();
    if (!miniBossSpawned && (backgroundScore > levelIncrease/2)) spawnMiniBoss();
  } else if (!bossSpawned && enemies.size() == 0) {
    spawnBoss();
  } else if (bossPractice && boss.oob) {
    bombs = 3;
    bombIt = 0;
    main = true;
    upgradeMenu = false;
    game = false;
    bossPracticeMenu = false;
    bossPractice = false;
    bossMode = false;
    bossSpawned = false;
    boss = null;
  } else updateBoss();
  
  if (!bossPractice) drawEnemies();
  
  drawAmunition();
  
  // total score
  // level
  // upgrade points available
  // amount of bombs left
  // points until next level
  if (bombIt > 0) bomb();
  drawGUI();
  
  //based on score
  checkLevelUp();
  
  
  curTimeStop += maxTimeStop/timeStopRegen;
  if (curTimeStop > maxTimeStop) curTimeStop = maxTimeStop;
  if (curTimeStop < 0) {
    frameRate(60);
    timeStopRegen = timeStopRegenRemember;
  }
  
}



int backgroundCount = 0;
void drawBackground() {
  
  if (!bossMode) {
    //image(background, 0, 0, 1000, 1000);
    
    fill(130);   
    rect(125, 0, 93, 1000);
    rect(782, 0, 93, 1000);
    
    //rect(378, 0, 243, 1000); // middle
    
    fill(224);
    rect(218, 0, 64, 1000);
    rect(718, 0, 64, 1000);
    
    
    //fill(206, 165, 165); //206 165 165
    //rect(282, 0, 62, 1000);
    //rect(656, 0, 62, 1000);
    
    //fill(197, 197, 197);
    //rect(344, 0, 34, 1000);
    //rect(622, 0, 34, 1000);
    
    fill(220);
    for (int i = 0; i < 3; i++) {
      rect(467, ((i-1)*500)+backgroundCount, 66, 192);
      image(light, 650, ((i-1)*500)+55+backgroundCount, 200, 50);
      
      translate(350, ((i-1)*500)+55+backgroundCount+50);
      rotate(radians(180));
      image(light, 0, 0, 200, 50);
      rotate(radians(180));
      translate(-350, -(((i-1)*500)+55+backgroundCount+50));
    }
    
    
    
    fill(0, 170);
    rect(0, 0, 1000, 1000);
  } else {
    
    background(0);
  }
  
  fill(255, 0, 0);
  /*
  PImage temp1 = background.get(0, 400-backgroundCount, 200, 200);
  image(temp1, 0, 0, 1000, 1000);
  if (backgroundCount > 600) {
    backgroundCount = 0;
  } else if (backgroundCount > 400) {
    PImage temp2 = background.get(0, 400, 200, 200);
    image(temp2, 0, map(backgroundCount, 400, 600, -1000, 0), 1000, 1000);
  }*/
  backgroundCount += 2;
  if (backgroundCount >= 500) backgroundCount = 0;
}


// X Sniper (Shoots at a slow pace, but have fast/hard-hitting bullets
// X Sentry (Shoots rapid fire towards player)
// X Shotty (shotguns player with bullets
// X Missler (homing instead of straight forward)
// X Forker (Same as normal, but shoots multiple bullets)
// X Scatter (Same as big, but shoots twice as fast and in three times as much different directions (in a circle) (Upon creation it chooses to be clockwise or counterclockwise)
// X Rando (Similar to big, but shoots quickly bullets once at a time in a random direction in each quadrant)
// X Carrier (Carries normal ships (pretty much doubles the spawn rate while alive... Triples while "docked"))
// X Charger (Moves towards player, dies within 10 seconds, but does a LOT of damage if come into contact)
// X MissleMaster (shoots a good amount of smart rockets at player)
void spawnMiniBoss() {
  // spawnMiniBoss
  if (bombIt == 0) {// other conditions met earlier
    int r = (int)random(0, 100);
    if (r < 10) {
      enemies.add(new sniper(baseHP, baseDMG, 1));
    } else if (r < 20){
      enemies.add(new sentry(baseHP, baseDMG, 1));
    } else if (r < 30){
      enemies.add(new shotty(baseHP, baseDMG, 1));
    } else if (r < 40){
      enemies.add(new missler(baseHP, baseDMG, 1));
    } else if (r < 50){
      enemies.add(new forker(baseHP, baseDMG, 1));
    } else if (r < 60){
      enemies.add(new scatter(baseHP, baseDMG, 1));
    } else if (r < 70){
      enemies.add(new rando(baseHP, baseDMG, 1));
    } else if (r < 80){
      enemies.add(new carrier(baseHP, baseDMG, 1));
    } else if (r < 90){
      enemies.add(new charger(baseHP, baseDMG, 1));
    } else {
      enemies.add(new missleMaster(baseHP, baseDMG, 1));
    }
    
    miniBossSpawned = true;
  }
}

void spawnBoss() {
  if (level == 5) boss = new centerxyBoss(baseHP, baseDMG, 5);
  else if (level == 10) boss = new centerxtopyBoss(baseHP, baseDMG, 5);
  else if (level == 15) boss = new fastBoss(baseHP, baseDMG, 5);
  else if (level == 20) boss = new smallBoss(baseHP, baseDMG, 5);
  else {
    boss = new fastBoss(baseHP, baseDMG, 5);
  }
  bossSpawned = true;
}

void updateBoss() {
  if (bossSpawned) {
    boss.move();
    boss.drawBoss();
    boss.act();
    boss.checkImpact();
  }
  
}




























































void drawPlayer() {
  player.displayShip();
  player.checkImpact();
  player.shoot();
  
}

void spawnEnemies() {
  textSize(20);
  if (bombIt == 0 && (frameCount%(300/spawnRate)==0 || enemies.size() == 0)) {
    int r = (int)random(0, 100);
    if (r < 60) {
      enemies.add(new enemyNormalShip(baseHP, baseDMG, 2.5));
    } else if (r < 90){
      enemies.add(new enemyBigShip(baseHP, baseDMG, 1));
    } else {
      enemies.add(new enemyHealShip(baseHP, baseDMG, 1.5));
    }
    if (enemies.size() == 0) frameCount = 300/spawnRate;
  }
}

void drawEnemies() {
  for (enemyShip e : enemies) {
    e.move();
    e.drawEnemy();
    e.checkImpact();
    
    if (e.counter >= e.cooldown) {
      e.shoot();
      e.counter = 0;
    } else e.counter++;
  }
  for (int i = 0; i < enemies.size(); i++) if (enemies.get(i).oob) enemies.remove(i);
}

void drawAmunition() {
  for (bullet b : bullets) {
    b.updateBullet();
    b.displayBullet();
    b.checkOutOfBounds();
  }
  for (int i = 0; i < bullets.size(); i++) if (bullets.get(i).oob) {
    if (bullets.get(i).playerBullet) numOfPlayerBullets--;
    else numOfEnemyBullets--;
    bullets.remove(i);
    i--;
  }
  
  for (missle m : missles) {
    m.updateMissle();
    m.displayMissle();
    m.checkOutOfBounds();
    m.missleContact();
  }
  for (int i = 0; i < missles.size(); i++) if (missles.get(i).oob) {
    if (missles.get(i).playerBullet) numOfPlayerMissles--;
    else numOfEnemyMissles--;
    missles.remove(i);
    i--;
  }
}

void drawGUI() {
  fill(115, 150, 190);
  rect(1000, 0, 400, 1000);
  
  fill(255, 0, 0);
  rect(1025, 20, 35, 960);
  fill(0, 255, 0);
  rect (1025, 980, 35, map(player.curHealth, 0, player.maxHealth, 0, -960));
  fill(50, 50, 255);
  rect (1050, 980, 10, map(player.curShield, 0, player.maxShield, 0, -960));
  
  // Upgrade
  fill(50);
  rect (1075, 20, 310, 200);
  fill(220);
  
  textSize(50);
  text("Upgrades", 1230, 50);
  textSize(20);
  text("Press 'E' to open", 1230, 100);
  textSize(35);
  text(upgradePoints, 1230, 140);
  
  
  // Score/ mini-data
  fill (100);
  rect(1075, 250, 310, 330);
  fill(240);
  textSize(50);
  text("Stats", 1230, 300);
  textSize(25);
  text("Score: " + score, 1230, 370);
  text("Level: " + level, 1230, 430);
  text("Points until next level:", 1230, 490);
  text(levelIncrease - backgroundScore, 1230, 520);
  
  // Bomb
  
  fill(0, 180, 0);
  for (int i = 0; i < bombs; i++) {
    fill(0);
    square(1125+(75 * i), 620, 50);
    fill(0, 0, 255);
    text("B", 1149+(75*i), 643);
  }
  
  // Time measure
  fill(160, 0, 0);
  rect(1100, 710, 250, 50);
  fill(0, 100, 255);
  rect(1100, 710, map(curTimeStop, 0, maxTimeStop, 0, 250), 50);
  strokeWeight(10);
  stroke(0);
  noFill();
  rect(1100, 710, 250, 50);
  noStroke();
  
  // Surrender
  fill(0);
  rect(1075, 780, 300, 200);
  fill(200);
  textSize(40);
  text("Surrender?", 1230, 820);
  fill(200, 0, 0);
  text("Press ESC", 1230, 900);
}

void checkLevelUp() {
  if (backgroundScore >= levelIncrease) {
    if (!bossPractice) {
      level++;
      backgroundScore = 0;
      levelIncrease = (int) (levelIncrease * 1.5);
      baseHP *= di;
      baseDMG *= di;
      baseReward *= 1.3;
      
      if (level%5 == 0) bossMode = true;      
      else {
        bossMode = false;
        bossSpawned = false;
        miniBossSpawned = false;
        
        if (level%5 == 1) {
        
          player.giveReward(numOfEnemyBullets+(numOfEnemyMissles*3), 0, numOfEnemyBullets+(numOfEnemyMissles*3));
          bullets = new ArrayList<bullet>();
          missles = new ArrayList<missle>();
          numOfEnemyBullets = 0;
          numOfEnemyMissles = 0;
          player.curHealth = player.maxHealth;
          player.curShield = player.maxShield;
        
        }
        
      }
    } else {
      if (!bossMode) {
        main = true;
        upgradeMenu = false;
        game = false;
        bossPractice = false;
        boss = null;
      }
    }
  }
}

void bomb() {
  bombAnimation();
}

int bombIt = 0;
float bombX = 0;
float bombY = 0;
void bombAnimation() {
  strokeWeight(3);
  noFill();
  stroke(0, 200, 0);
  circle(bombX, bombY, 3000-(bombIt*30));
  
  // I searched this up but I can't find solution. Tessellation Error causes this to become VERY VERY slow
  /*
  for (int i = 0; i < 3; i++) {
    stroke(0, map(i, 0, 10, 0, 255), 0);
    circle(bombX, bombY, 3000-((bombIt*30)-20*i));
  }*/
  
  // point basis for bombs is slightly different
  // important to note, PROGRESS DOESN'T ADVANCE WITH BOMBS
  // BOMBS GIVE UPGRADE POINTS AND SCORE, BUT DOESN'T CONTINUE
  // LEVEL
  // User has to choose between using bombs for economic
  // advantage (especially since bullets even count towards points)
  // or to use them for defense when things get rough
  for (enemyShip e : enemies) {
    float dist = sqrt(((e.x - bombX) * (e.x - bombX)) + ((e.y - bombY) * (e.y - bombY)));
    if (dist*2 < 3000-(bombIt*30)+200) e.oob = true;
    upgradePoints += e.HP;
    score += e.HP;
  }
  for (bullet b : bullets) {
    if (b.playerBullet) continue;
    float dist = sqrt(((b.x - bombX) * (b.x - bombX)) + ((b.y - bombY) * (b.y - bombY)));
    if (dist*2 < 3000-(bombIt*30)+200) {
      b.oob = true;
      upgradePoints += pow(level, di);
      score += pow(level, di);
    }
  }
  for (missle m : missles) {
    if (m.playerBullet) continue;
    float dist = sqrt(((m.x - bombX) * (m.x - bombX)) + ((m.y - bombY) * (m.y - bombY)));
    if (dist*2 < 3000-(bombIt*30)+200) {
      m.oob = true;
      upgradePoints += pow(level, di);
      score += pow(level, di);
    }
  }
  
  // add boss case here
  if (bossMode && !bombApplied) {
    bombToBoss();
  }
  
  noStroke();
  
  bombIt--;
}

boolean bombApplied = false;
void bombToBoss() {
  if (bossSpawned) {
    float temp = (boss.initialHP*4)/10;
    if (boss.HP <= temp) {
      score += ceil(boss.initialHP*10);
      backgroundScore += ceil(levelIncrease - backgroundScore);
      upgradePoints += ceil(boss.initialHP*10);
      boss.oob = true;
    } else {
      boss.HP -= temp;
    }
    bombApplied = true;
  }
}

int pausedVal = 0;
boolean ePressed = false;
void keyPressed() {
  if ((key == 'e' || key == 'E') && !bossSpawned) {
    if (game) {
      game = false;
      upgradeMenu = true;
      pausedVal = frameCount;
    } else if (upgradeMenu) {
      game = true;
      upgradeMenu = false;
      frameCount = pausedVal;
    }
  } else if (keyCode == SHIFT && curTimeStop > 0) { // a more "professional" way would be to get into every class and mess with the speeds
    timeStopRegen = -60;
    frameRate(30);

  } else if (bombIt == 0 && key == ' ' && bombs > 0) {
    bombs -= 1;
    bombIt = 100;
    bombX = player.x;
    bombY = player.y;
    bombApplied = false;
  } else if (keyCode == ESC) {
    key = 0;
    if (game) {
      game = false;
    } else if (upgradeMenu) {
      game = true;
      upgradeMenu = false;
    }
  }
}

void keyReleased() {
  if (keyCode == SHIFT) {
    frameRate(60);
    timeStopRegen = timeStopRegenRemember;
  }
}

boolean about = false;
boolean instructions = false;

int pageNumber = 1;
boolean mouseClicked = false; // helps so that mousePressed doesn't constantly click
void drawMainMenu() {
  cursor();
  if (about) {
    
    textAlign(CENTER, CENTER);
    textSize(30);
    
    fill(255);
    text("Welcome to the miniature bullet-hell game!", 700, 100);
    
    text("Simply put, this game was made for a CSS project in UWB", 700, 200);
    text("which wanted us students to make a simple interactive game.", 700, 250);
    
    text("I, on the other hand, wanted to try something fun and", 700, 350);
    text("difficult since I already knew how to code from before the", 700, 400);
    text("class, and I actually wanted to have fun with the project.", 700, 450);
    
    text("I really hope you enjoy the game!", 700, 550);
    
    text("Code: Antony Holshouser / Assets: Tim Minkin", 700, 650);
    text("CSS 101 / BIS 111", 700, 700);
    text("Spring Quarter, 2020", 700, 750);
    
    buttons[5].drawButton();
    buttons[5].mouseHover();
    buttons[5].select();
    
    
    
    
    
    
    
    
  } else if (instructions) {
    
    
    
    
    
    
    
    
    
    
    
    
    // deal with pageNumber situation later
    // Next/Prev buttons not working
    fill(255);
    textSize(20);
    text(pageNumber, 20, 20);
    
    if (pageNumber == 1) {
      textAlign(CENTER, CENTER);
      textSize(30);
      
      text("Welcome to the miniature bullet-hell game!", 700, 100);
      
      textSize(21);
      
      text("You play as a little ship that shoots other little ships. The goal of the game is to get the highest score possible.", 700, 175);
      
      text("As you play, enemies will gradually become more difficult. In order to upgrade your ship to deal with them, you have to", 700, 250);
      text("spend your upgrade points in the upgrade menu (which is opened by pressing \"E\")", 700, 275);
      
      text("You will automatically shoot, however, you can press the spacebar for a bomb that will eliminate all enemies on the screen, and", 700, 350);
      text("deal a considerable amount of damage to the boss. However, bewarned, you'll only have 3 bombs and you won't ever get them back.", 700, 375);
      
      text("Difficulty affects how fast enemies spawn, how fast they get stronger, how many upgrade points get dropped, and how", 700, 450);
      text("much score you recieve", 700, 475);
      
      text("There are 3 types of main enemies in the game outside of the 4 bosses that appear every 5 levels and the 10 mini-bosses that", 700, 550);
      text("appear in the second half of every level (outside of boss levels)", 700, 575);
      
      text("Especially when bosses or mini-bosses spawn, press SHIFT to slow down time so you can get out of tricky spots or situations.", 700, 650);
      
      text("The next pages will go into detail about the enemies you will encounter throughout the game, and some tips to get you started.", 700, 725);
      
      text("Good luck, and have fun!", 700, 800);
   
    
    } if (pageNumber == 2) {
      
      textSize(40);
      text("The 3 Main Enemies", 700, 100);
      
      textSize(21);
      text("The basic enemy", 400, 175);
      image(normalShip, 900, 175, 150, 150);
      
      text("This guy shoots a bullet towards you, the player. Be careful,", 400, 225);
      text("however. He might shoot slowly, but when there is a lot of enemies", 400, 250);
      text("on the screen, it can become devastating very fast. Out of the", 400, 275);
      text("3 main enemies, this guy has the least health. Getting rid of this", 400, 300);
      text("as soon as possible would be a wise move", 400, 325);
      
      text("The big enemy", 400, 400);
      image(bigShip, 900, 400, 150, 150);
      
      text("This enemy shoots a bullet in 8 directions, one bullet for every", 400, 450);
      text("45 degrees. He isn't that scary, but he does have a lot of health.", 400, 475);
      text("It would be best to consider getting rid of this guy last on the", 400, 500);
      text("screen, if you are worried about health. Otherwise, remember, that", 400, 525);
      text("this guy also holds the most points out of the 3 main enemies.", 400, 550);
      
      text("The healer enemy", 400, 625);
      image(healShip, 900, 625, 150, 150);
      
      text("This enemy is a problem. This doesn't appear often, but when it does,", 400, 675);
      text("just HOPE a lot don't spawn. This guy heals an enemy about the same", 400, 700);
      text("amount of damage a normal ship would deal to you. When dealing with a", 400, 725);
      text("lot of them, an enemy could end up having 10x more health than usual.", 400, 750);
      text("If you ever get into such a situation, I recommend focusing on other", 400, 775);
      text("ships and wait for that enemy to despawn at the bottom of the screen.", 400, 800);
      
    } else if (pageNumber == 3) {
      
      textSize(40);
      text("The Mini-Bosses", 700, 100);
      
      textSize(21);
      text("The Sniper", 400, 175);
      image(sniper, 900, 150, 150, 175);
      
      text("Stay FAR away from this enemy!!! If you don't, you'll see the game", 400, 225);
      text("over screen faster than it would take for you to realize that this", 400, 250);
      text("guy shot at you. It shoots 10 bullets with different speeds at you,", 400, 275);
      text("with the hardest hitting bullet going the fastest. Just like the other", 400, 300);
      text("mini-bosses, he \"docks\" at the middle of the screen. You have to kill him.", 400, 325);
      
      text("The Sentry", 400, 400);
      image(sentry, 900, 400, 150, 150);
      
      text("This enemy is very similar to the normal enemy, except it shoots a lot", 400, 450);
      text("faster. He is one of the lesser lethal enemies when you figure out how", 400, 475);
      text("to deal with it because of it's unlethal bullet damage and speed. Despite", 400, 500);
      text("being a mini-boss, if this appears, don't worry about it too much, if you", 400, 525);
      text("adept at bullet-hell games, this guy isn't a problem.", 400, 550);
      
      text("The Shotty", 400, 625);
      image(shotty, 900, 625, 150, 150);
      
      text("This enemy shoots just about as often as the normal guy does, but", 400, 675);
      text("instead shoots a ton of different bullets in your direction with", 400, 700);
      text("each bullet having a slightly different offset and speed. When", 400, 725);
      text("the board is cluttered, it is essential to get rid of this mini.", 400, 750);
      text("The bullet speed is somewhat fast, so like the sniper, it is best", 400, 775);
      text("to keep a far distance from it.", 400, 800);
      
      
    } else if (pageNumber == 4) {
      
      textSize(40);
      text("The Mini-Bosses", 700, 100);
      
      textSize(21);
      text("The Missler", 400, 175);
      image(missler, 900, 175, 150, 150);
      
      text("This enemy shoots missles at you, so if you don't deal with him,", 400, 225);
      text("be prepared to have some annoying missles following your tail", 400, 250);
      text("throught the game. I would consider this mini-boss low threat,", 400, 275);
      text("but if it is undealt with, especially when the screen is cluttered", 400, 300);
      text("with bullets,it could be real annoying to deal with.", 400, 325);
      
      text("The Forker", 400, 400);
      image(forker, 900, 400, 150, 150);
      
      text("This guy can be a pain. He shoots much faster than the normal enemy,", 400, 450);
      text("plus, he shoots a bunch of them an equal offset for each one. If you", 400, 475);
      text("have some experience with bullet-hells, it shouldn't be much of an", 400, 500);
      text("issue to deal with it, but if not, be ready to learn how.", 400, 525);
      
      text("The Scatter", 400, 625);
      image(scatter, 900, 625, 150, 150);
      
      text("Consider this enemy like the normal big enemy, excepted a bit", 400, 675);
      text("buffed. He shoots twice as fast, and while it shoots it 8", 400, 700);
      text("different directions, it rotates, so in reality it's 24", 400, 725);
      text("different directions, but 8 at a time. Again, this is a", 400, 750);
      text("low threat mini-boss; probably even the least threat.", 400, 775);
      
      
    } else if (pageNumber == 5) {
      
      textSize(40);
      text("The Mini-Bosses", 700, 100);
      
      textSize(21);
      text("The Rando", 400, 175);
      image(rando, 900, 175, 150, 150);
      
      text("These next 3 mini-bosses are very high threat. The rando shoots a", 400, 225);
      text("bullet in a random direction every 2 frames, so that's 30 bullets", 400, 250);
      text("per second, going all over the screen. This guy very quickly makes", 400, 275);
      text("the board cluttered. The bullets are slow, but if it isn't dealt", 400, 300);
      text("with, it gives a lot of room for many enemies to spawn.", 400, 325);
      
      text("The Carrier", 400, 400);
      image(carrier, 900, 400, 450, 150);
      
      text("The carrier pretty much increases the spawn rate considerably. Whenever", 400, 450);
      text("it flashes white, it just spawned an enemy. Unlike the rando, that gives", 400, 475);
      text("room for enemies to spawn, this MAKES enemies spawn. He about doubles the", 450, 500);
      text("spawn rate, or triples when docked. However, he is the only way for enemies", 450, 525);
      text("to spawn before a boss, so you can farm up some extra upgrade points", 400, 550);
      
      text("The Charger", 400, 625);
      image(charger, 900, 625, 150, 150);
      
      text("Like the name, this guy charges at you, at when it is close enough,", 400, 675);
      text("it self destructs and gives a lethal and devastating blow.", 400, 700);
      text("There are 2 ways to deal with it. One being avoiding it for several", 400, 725);
      text("seconds, or shooting it down, which shouldn't be too difficult considering", 400, 750);
      text("it has the least HP out of all the mini's. Either way, if the screen is", 400, 775);
      text("cluttered, this enemy could very likely cause you to lose.", 400, 800);
      
      
    } else if (pageNumber == 6) {
      
      textSize(40);
      text("The last Mini-Boss, and first 2 bosses", 700, 100);
      
      textSize(21);
      text("The Missle Master", 400, 175);
      image(missleMaster, 900, 175, 150, 150);
      
      text("Pretty much, another low threat mini-boss. This guy shoots missles,", 400, 225);
      text("just like the missler does, however instead of shooting missles", 400, 250);
      text("towards the player, it shoots plenty of them all around it. The", 400, 275);
      text("only difference is that the missles are a little bit smarter, and", 400, 300);
      text("dodging the missles has a slightly different dynamic to them.", 400, 325);
      
      text("The Square", 400, 400);
      image(centerxyBossBig, 900, 400, 150, 150);
      image(centerxyBossSmall, 900, 400, 150, 150);
      image(centerxyBossCenter, 900, 400, 150, 150);
      
      text("Consider this guy like an introduction to boss fighting. While it is", 400, 450);
      text("easily the easiest boss out of the current 4, it is not an easy fight.", 400, 475);
      text("If you are new to bullet hells, I recommend practice fighting this", 400, 500);
      text("boss until you can beat it easily, because if you can't beat this", 400, 525);
      text("boss, you'll be having a lot of difficulty with the future bosses.", 400, 550);
      
      text("The Big Boy", 400, 625);
      image(centerxtopyBoss, 900, 625, 450, 150);
      
      text("Also, consider this guy as an introductory course to boss fighting", 400, 675);
      text("101. There are certain patterns this boss uses, and each of these", 400, 700);
      text("patterns have easy ways to dodge all the bullets. If you pass this,", 400, 725);
      text("you most likely learned how to recognize how to easily avoid", 400, 750);
      text("seemingly complex bullet patterns with ease... Also, just a warning,", 400, 775);
      text("practice with this guy at least once to see all 3 attacks", 400, 800);
      
      
    } else if (pageNumber == 7) {
      
      textSize(40);
      text("The last 2 bosses", 700, 100);
      
      textSize(21);
      text("The Dragon", 400, 175);
      image(fastBoss, 900, 175, 150, 300);
      
      text("Okay, training wheels are gone. This boss shoots a blizzard of", 400, 225);
      text("bullets towards you. While there still are patterns like in the", 400, 250);
      text("second boss, these patterns are harder to recognize. Plus, even", 400, 275);
      text("if you do recognize these patterns, it requires quite a bit of skill", 400, 300);
      text("to avoid them.", 400, 325);
      
      text("the small cell", 400, 400);
      image(smallBoss, 950, 600, 100, 100);
      
      text("The picture is very big, but the boss in actual mid-game is pretty", 400, 450);
      text("small. This, for now, is the final boss. Even though it doesn't really", 400, 475);
      text("serve as a final boss (the actual final boss, or the planned one, is", 400, 500);
      text("much more difficult and complex). This guy shoots way more bullets,", 400, 525);
      text("and, well, plays a lot with some out of bound barriers. Beating this", 400, 550);
      text("guy requires knowledge of bullet patterns, skill, and knowing what", 400, 575);
      text("attack is coming next. Otherwise, you're going to be in trouble.", 400, 600);
      
      
    }
    
    if (pageNumber != 1) {
        buttons[6].drawButton();
        buttons[6].mouseHover();
        pageNumber = buttons[6].select(pageNumber);
      }
  
      buttons[5].drawButton();
      buttons[5].mouseHover();
      buttons[5].select();
      
      if (pageNumber /*last page*/ != 7) {
        buttons[7].drawButton();
        buttons[7].mouseHover();
        pageNumber = buttons[7].select(pageNumber);
      }
    
  } else {
    
    
    
    
    
    
    for(int i = 0; i < 5; i++) {
      buttons[i].drawButton();
      buttons[i].mouseHover();
      buttons[i].select();
    }
    buttons[10].drawButton();
    buttons[10].mouseHover();
    buttons[10].select();
    
    
    
  }

  
}

// maybe add missles/lazers???

// should have a certain duration the bullet exists so homing bullets will eventually disappear
// make missles go at bosses

int numOfEnemyMissles = 0;
int numOfPlayerMissles = 0;
class missle {  
  int id;
  
  float x;
  float y;
  
  int size;
  float damage;
  //float splash;
  
  float speed;
  float driftSpeed = 1;
  float degrees; // 0 being up, 90 being right, 180 being down, 270 being left
  int smartRating = 45; // rates from 30 degrees to 90 degrees (0 to 5) both included (range of view)
  
  boolean playerBullet;
  boolean oob = false;
  
  float splash;
  
  int duration;
  
  missle(float xx, float yy, float ndamage, int nsize, float nspeed, float ndegrees, boolean pb, int nsmartRating, float ndriftSpeed, float nsplash) {
    x = xx;
    y = yy;
    damage = ndamage;
    size = nsize;
    speed = nspeed;
    degrees = ndegrees;
    playerBullet = pb;
    if (pb) numOfPlayerMissles++;
    else numOfEnemyMissles++;
    id = missles.size();
    splash = nsplash;
    smartRating = nsmartRating;
    driftSpeed = ndriftSpeed;
    
    duration = -1;
  }
  
  void setDuration(int d) {
    duration = d; 
  }
  
  void checkOutOfBounds() {
    if (x < 0 || 1000 < x || y < 0 || 1000 < y) oob = true;
  }
  
  void displayMissle() {
    if (missleAnimation == 0) {
      if (playerBullet) fill(0, 255, 0, min(255-numOfEnemyBullets, 255-numOfEnemyMissles));
      else fill(255, 0, 0);
      
      translate(this.x, this.y);
      rotate(radians(this.degrees));
      rect(size/2, 0, this.size, -this.size*5);
      rotate(-radians(this.degrees));
      translate(-this.x, -this.y);
    } else if (missleAnimation == 1) {
      this.oob = true;
    } else {
      fill(255, 120, 120, missleAnimation*2);
      circle(x, y, splash);
      missleAnimation--;
    }
  }
  
  // should prioritze       degree range > closeness 
  // so far only goes until 90 degrees both sides IMPORTANT!!! GOT TO FIX!!! When fixed, add a type of counter for missle life duration
  void updateMissle() {
    if (missleAnimation == 0) {
      //float a = 0;
      //float b = 0;
      double c = 1070;
      float change = 0;
      if (playerBullet) {
        // for normal game
        if (!bossSpawned) {
          for (enemyShip e : enemies) {
            float atemp = this.x - e.x; // x between missle and target
            float btemp = this.y - e.y; // y betwwen missle and target
            double ctemp = Math.sqrt((atemp*atemp)+(btemp*btemp)); // hypotenuse
            
            float degtemp = degrees(acos((float)(((btemp*btemp)+(ctemp*ctemp)-(atemp*atemp))/(2*btemp*ctemp))));
            
            // find degtemp in 360 degree manner, normally
            if (atemp > 0) { // its on the left hand side of screen
              //degtemp -= 360; // get in terms of 360 degrees
              degtemp = 360 - degtemp;
            }
            
            if (degrees < 180 && degtemp > 180  && degtemp-degrees > 180) degtemp -= 360;
            else if (degrees > 180 && degtemp < 180 && (degrees-degtemp > 180 || degtemp-degrees < -180)) degtemp += 360;
            
            // rotate degtemp so 180 degrees lines up with bullet (current direction)
            /*float rotation = 180 - degrees;
            if (rotation <= 0) {
              rotation = 360 + rotation;
              left = true;
            }
            
            // find ship in relation to new axis
            //degtemp = degtemp + (rotation-180);
            if (left) {
              if (degtemp + rotation > 360) degtemp -= 360;
              else degtemp += rotation - 180;
            } else {
              if (degtemp + rotation > 360) degtemp -= 360;
            }
            
            degtemp += rotation - 180;*/
            
            float changetemp = degtemp-degrees;
            if (abs(changetemp) > smartRating) continue;
            if (ctemp != 0 && ctemp < c) {
              //a = atemp;
              //b = btemp;
              c = ctemp;
              change = changetemp;
            }
          }
        } else { // for boss
          if (bossMoved) {
            float atemp = this.x - boss.x; // x between missle and target
            float btemp = this.y - boss.y; // y betwwen missle and target
            double ctemp = Math.sqrt((atemp*atemp)+(btemp*btemp)); // hypotenuse
              
            float degtemp = degrees(acos((float)(((btemp*btemp)+(ctemp*ctemp)-(atemp*atemp))/(2*btemp*ctemp))));
              
              // find degtemp in 360 degree manner, normally
            if (atemp > 0) { // its on the left hand side of screen
               //degtemp -= 360; // get in terms of 360 degrees
              degtemp = 360 - degtemp;
            }              
            if (degrees < 180 && degtemp > 180  && degtemp-degrees > 180) degtemp -= 360;
            else if (degrees > 180 && degtemp < 180 && (degrees-degtemp > 180 || degtemp-degrees < -180)) degtemp += 360;
            
            float changetemp = degtemp-degrees;
            if (abs(changetemp) <= smartRating) {;
              if (ctemp != 0 && ctemp < c) {
                //a = atemp;
                //b = btemp;
                c = ctemp;
                change = changetemp;
              }
            }
          }
        }
      } else if (playerMoved)/* not player missle */{
        
        
        float atemp = this.x - player.x; // x between missle and target
        float btemp = this.y - player.y; // y betwwen missle and target
        double ctemp = Math.sqrt((atemp*atemp)+(btemp*btemp)); // hypotenuse
        
        float degtemp = degrees(acos((float)(((btemp*btemp)+(ctemp*ctemp)-(atemp*atemp))/(2*btemp*ctemp))));
        if (atemp > 0) {
          degtemp = 360 - degtemp;
        }
        
        // if degtemp + degrees == 360 that means the direction of missle and direction of target are opposites
        if (degrees < 180 && degtemp > 180  && degtemp-degrees > 180) degtemp -= 360;
        else if (degrees > 180 && degtemp < 180 && (degrees-degtemp > 180 || degtemp-degrees < -180)) degtemp += 360;
        
        /*
        float rotation = 180 - degrees;
        if (rotation <= 0) {
          rotation = 360 + rotation;
          left = true;
        }
        if (left) {
          if (degtemp + rotation > 360) degtemp -= 360;
          else degtemp += rotation - 180;
        } else {
          if (degtemp + rotation > 360) degtemp -= 360;
          
        }
        degtemp += rotation - 180;*/
        float changetemp = degtemp-degrees;
        if (abs(changetemp) <= smartRating) {
          c = ctemp;
          change = changetemp;
        }
      }
      
      
      if (change > 0) {
        if (change >= driftSpeed) degrees += driftSpeed;
        else degrees += change;
      }
      else if (change < 0) {
        if (change <= -driftSpeed) degrees -= driftSpeed;
        else degrees += change;
      }
      
      
      if (degrees < 0) degrees = 360+degrees;
      if (degrees > 360) degrees %= 360;
      
      x += Math.sin(radians(degrees))*speed;
      y -= Math.cos(radians(degrees))*speed;
    }
  }
  
  int missleAnimation = 0;
  void missleContact() {
    if (missleAnimation == 0 || duration == 0) {
      if (playerBullet) {
        if (!bossSpawned) {
          for (enemyShip e : enemies) {
            if (e.checkCollision(x, y, size)) {
              e.damage(damage*2);
              this.oob = true;
              // make splash damage
              
              if (splash > 0) {
                missleAnimation = 60;
                for (enemyShip e2 : enemies) {
                  if (dist(x, y, e2.x, e2.y) < splash+25 ) e2.damage(damage);
                }
              }
            }
          }
        } else {
          if (boss.checkCollision(x, y, size)) { // add these to bosses. use enemyShips for reference
              boss.damage(damage*3);
              this.oob = true;
              // make splash damage
              if (splash > 0) missleAnimation = 60;
          }
        }
      } else {
        if (player.checkCollision(x, y, size)) {
          player.damage(damage*3);
          this.oob = true;
        }
      }
    }
    duration--;
  }
}

boolean playerMoved;
class playerShip {
  float x, y;
  
  float maxHealth;
  float curHealth;
  
  float maxShield;
  float curShield;
  float shieldCooldown;
  float shieldCooldownCount;
  float shieldRegen;
  
  float damage;
  int numOfBullets;
  float bulletSize;
  int numOfMissles;
  
  int smartRating;
  float rocketDrift;
  float missleSplash;
  
  float nullifyChance;
  float blockedPercent;
  
  float upgradePointMultiplier;
  float levelMultiplier;
  
  float difficultyScoreChanger;
  float difficultyRewardChanger;
  
  playerShip() {
    maxHealth = 10;
    curHealth = 10;
    
    maxShield = curShield = 5;
    shieldCooldown = 300;
    shieldCooldownCount = 0;
    shieldRegen = 0.001;
    
    damage = 1;
    numOfBullets = 1;
    numOfMissles = 0;
    
    
    bulletCooldown = 10; //10 start, 0.5 min;
    bulletCooldownRemember = bulletCooldown;
    bulletSize = 5;
    
    missleCooldown = 60;
    missleCooldownRemember = missleCooldown;
    smartRating = 30;
    rocketDrift = 1;
    missleSplash = 0;
    
    nullifyChance = 0;
    blockedPercent = 0;
    
    upgradePointMultiplier = 1;
    levelMultiplier = 1;
    
    if (di == 1.2) difficultyScoreChanger = 0.5;
    else if (di == 1.3) difficultyScoreChanger = 2;
    else difficultyScoreChanger = 8;
    
    if (di == 1.2) difficultyRewardChanger = 0.75;
    else if (di == 1.3) difficultyRewardChanger = 1;
    else difficultyRewardChanger = 1.5;
    
    playerMoved = false;
  }
  
  void giveReward(float s, float bs, float up) {
    score += ceil((s*levelMultiplier*difficultyScoreChanger)/1.3);
    backgroundScore += ceil(bs*levelMultiplier);
    upgradePoints += ceil((up*levelMultiplier*upgradePointMultiplier/difficultyRewardChanger)*1.3);
  }
  
  void displayShip() {
    
    if (shieldCooldownCount > 0) shieldCooldownCount--;
    else if (curShield < maxShield) curShield += maxShield*shieldRegen;
    else if (curShield > maxShield) curShield = maxShield;
    
    if (mouseX == x && mouseY == y) playerMoved = false;
    else {
      playerMoved = true;
      if (mouseX > 1000) x = 1000;
      else x = mouseX;
      y = mouseY;
    }
    
    image(playerShip, x-28, y-30, 56, 56);
    
    // before player ship asset was created
    /*
    fill(255);
    triangle(x-20, y+30, x, y-20, x, y);
    triangle(x+20, y+30, x, y-20, x, y);
    fill(255, 0, 0);
    circle(x, y, 10);*/
    
    // player stats on ship
    fill(0, 255, 0);
    rect(x-20, y+32.5, map(curHealth, 0, maxHealth, 0, 40), 2.5);
    fill(0, 200, 200);
    rect(x-20, y+35, map(curShield, 0, maxShield, 0, 40), 1.5);
    if (curShield > 0) {
      fill(0, 200, 200, map(curShield, 0, maxShield, 50, 100));
      circle(x, y, 30);
    }
    
  }
  
  // is in relation to how many times shoot is called
  float bulletCooldownRemember;
  float bulletCooldown;
  float missleCooldownRemember;
  float missleCooldown;
  void shoot() { // add a for loop to determine this
    if (bulletCooldown <= 0) {
      
      for (int i = 0; i < numOfBullets; i++) bullets.add(new bullet(x, y, damage, bulletSize, 10, 0-(10*(numOfBullets-1))+(i*20), true, color(0, 255, 0), color(0, 255, 0)));
      
      bulletCooldown = bulletCooldownRemember;
    } else bulletCooldown--;
    if (missleCooldown <= 0) {
      for (int i = 0; i < numOfMissles; i++) missles.add(new missle(x, y, damage, 5, 10, 0-(30*(numOfMissles-1))+(i*60), true, smartRating, 1, missleSplash));
      missleCooldown = missleCooldownRemember;
    } else missleCooldown--;
    
  }
  
  // helpful especially for boundary-related damage
  void damage(float dmg) {
    if (random(0, 100) > nullifyChance) {
      
      dmg = dmg - (dmg*blockedPercent);
      
      shieldCooldownCount = shieldCooldown;
      
      if (curShield >= dmg) curShield -= dmg;
      else if (curShield != 0) curShield = 0;
      else curHealth -= dmg;
      
      if (this.curHealth <= 0) death = true;
    }
  }
  
  void checkImpact() {
    for (bullet b : bullets) {
      if (curShield > 0) {
        if (x-10 < b.x+(b.size/2) && b.x-(b.size/2) < x+10 && y-10 < b.y+(b.size/2) && b.y-(b.size/2) < y+10 && !b.playerBullet) {
          b.oob = true;
          damage(b.damage);
        } 
      } else {
        if (x-3 < b.x+(b.size/2) && b.x-(b.size/2) < x+3 && y-3 < b.y+(b.size/2) && b.y-(b.size/2) < y+3 && !b.playerBullet) {
          b.oob = true;
          damage(b.damage);
        } 
      }
    }
  }
  
  int deathCounts = 60;
  void deathAnimation() {
    for (int i = 0; i < 50; i++) {
      float randRotation = random(0, 360);
      float randDistanceFromCenter = random(0, 50);
      float xAdd = sin(radians(randRotation))*randDistanceFromCenter;
      float yAdd = cos(radians(randRotation))*randDistanceFromCenter;
      
      fill(random(100, 255), random(0, 150), random(0, 50), map(deathCounts, 60, 0, 255, 0)); // makes explosions fade out
      circle(x+xAdd, y+yAdd, 50-((i*50)/60));
          
    }
    deathCounts--;
    if (deathCounts == 0) {
      if (bossPractice) {
        bombs = 3;
        bombIt = 0;
        main = true;
        upgradeMenu = false;
        game = false;
        bossPracticeMenu = false;
        bossPractice = false;
        bossMode = false;
        bossSpawned = false;
        boss = null;
        death = false;
        deathCounts = 60;
      }
      game = false;
    }
  }
  
  boolean checkCollision(float x, float y, float size) {
    if (this.x-3 < x+(size/2) && x-(size/2) < this.x+3 && this.y-3 < y+(size/2) && y-(size/2) < this.y+3) return true;
    else return false;
  }
}

class enemyNormalShip extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  
  enemyNormalShip(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 40;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp;
    DMG = dmg;
  }
  
  void shoot() {
    
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    
    
    if (a < 0) {
      right = true;
    }
    
    float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    
    
    if (!right) {
      deg = 360 - deg;
    }
    
    bullets.add(new bullet(x, y, DMG, 5, 6, deg, false, bc, gc));
  }
  
  void move() {
    y += speed;
  }
  
  void drawEnemy() {
    image(normalShip, x-20, y-20, 40, 40);
    strokeWeight(1);
    stroke(255);
    noFill();
    square(x-20, y-20, 40);
    noStroke();
    /*
    fill(255, 0, 0);
    square(x-20, y-20, 40);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    fill(0);
    text('N', x, y);
    */
    
    fill(255, 0, 0);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward, baseReward, baseReward);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-20 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+20 && this.y-20 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+20 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-20 < x+(size/2) && x-(size/2) < this.x+20 && this.y-20 < y+(size/2) && y-(size/2) < this.y+20) return true;
    else return false;
  }

}

class enemyHealShip extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  
  enemyHealShip(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 72;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp;
    DMG = dmg;
  }
  
  void shoot() {
    
    boolean right = false;
    
    float a = 0;
    float b = 0;
    double c = 1070;
    for (enemyShip e : enemies) {
      float atemp = this.x - e.x; // x between ship and healing target
      float btemp = this.y - e.y; // y betwwen ship and healing target
      double ctemp = Math.sqrt((atemp*atemp)+(btemp*btemp)); // hypotenuse
      if (ctemp != 0 && ctemp < c) {
        a = atemp;
        b = btemp;
        c = ctemp;
      }
    }
    
    if (a < 0) {
      right = true;
      a *= -1;
    }
    
    // helps shoot lower than target to have a higher hit rate
    if (200 < a) b += 10;
    if (500 < a) b += 10;
    if (700 < a) b += 10;
    
    
    
    
    float deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    
    
    if (!right) {
      deg = 360 - deg;
    }
    
    float tempx = x;
    float tempy = y;
    if (deg <= 90) {
      tempx = x+20;
      tempy = y-20;
    } else if (deg <= 180) {
      tempx = x+20;
      tempy = y+20;
    } else if (deg <= 270) {
      tempx = x-20;
      tempy = y+20;
    } else {
      tempx = x-20;
      tempy = y-20;
    }
    
    bullets.add(new bullet(tempx, tempy+20, -DMG, 5, 15, deg, true, bc, gc));
  }
  
  void move() {
    y += speed;
  }

  void drawEnemy() {
    image(healShip, x-17.5, y-17.5, 35, 35);
    strokeWeight(1);
    stroke(255);
    noFill();
    square(x-17.5, y-17.5, 35);
    noStroke();
    /*
    fill(255, 0, 0);
    circle(x, y, 35);
    rect(x-17.5, y-22.5, map(HP, 0, initialHP, 0, 35), 2.5);
    fill(0);
    text('H', x, y);*/
    
    fill(255, 0, 0);
    rect(x-17.5, y-22.5, map(HP, 0, initialHP, 0, 35), 2.5);
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*1.5, baseReward*1.5, baseReward*1.5);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-17.5 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+17.5 && this.y-17.5 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+17.5 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-17.5 < x+(size/2) && x-(size/2) < this.x+17.5 && this.y-17.5 < y+(size/2) && y-(size/2) < this.y+17.5) return true;
    else return false;
  }
  
}

class enemyBigShip extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  
  enemyBigShip(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 120;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*3;
    DMG = dmg*2;
  }
  
  void shoot() {
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 0, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 45, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 90, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 135, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 180, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 225, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 270, false, bc, gc));
    bullets.add(new bullet(x, y, DMG, 10, 2.5, 315, false, bc, gc));
  }
  
  void move() {
    y += speed;
  }
  
  void drawEnemy() {
    
    image(bigShip, x-25, y-25, 50, 50);
    strokeWeight(1);
    stroke(255);
    noFill();
    square(x-25, y-25, 50);
    noStroke();
    /*
    fill(255, 0, 0);
    square(x-25, y-25, 50);
    rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
    fill(0);
    text('B', x, y);*/
    
    fill(255, 0, 0);
    rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*2, baseReward*2, baseReward*2);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-25 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+25 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+25 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }
  
}





























//MiniBosses
// DEAL WITH AWARD AMOUNTS LATER
// SOME MINI'S CAN BE HARDER THAN OTHERS

// X Sniper (Shoots at a slow pace, but have fast/hard-hitting bullets
// X Sentry (Shoots rapid fire towards player) 40x40
// X Shotty (shotguns player with bullets with random spread) 40x40
// X Missle (shoots homing rockets towards player) 50x50
// X Forker (Same as normal, but shoots multiple bullets with even spread) 40x40
// X Scatter (Same as big, but shoots twice (maybe thrice) as fast and in three times as much different directions, rotating) 50x50
// X Rando (Similar to big, but shoots quickly bullets once at a time in a random direction in each quadrant) (might not need asset because of random nature)
// X Carrier (Carries normal ships (pretty much doubles the spawn rate while alive... Triples while "docked")) 40x100
// X Charger ("Suicide Bomber") (Moves towards player, dies within 10 seconds, but does a LOT of damage if come into contact) 50x50
// X MissleMaster (shoots about 10 rockets at once, but in many different directions instead of towards player) 50x50

// If game was maybe longer
// Guardian (Everyone is invincible until it is dead)

// make it so that when docked and player doesn't move, it doesn't compute the degree amount

class sniper extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  float deg;
  
  sniper(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 150;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*6;
    DMG = dmg/2;
  }
  
  void shoot() {
    for (int j = 0; j < 10; j++) bullets.add(new bullet(x, y, DMG*j, 2*j, 2*j, deg, false, bc, gc));
  }
  
  void move() {
    if (y < 600) y += speed;
    
    // to save future computation time since this has to be calculated for every frame
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    if (a < 0) {
      right = true;
    }
    deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    if (!right) {
      deg = 360 - deg;
    }
  }
  
  void drawEnemy() {
    
    image(sniper, x-20, y-25, 40, 60);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-20, y-25, 40, 60);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-20, y-30, map(HP, 0, initialHP, 0, 40), 2.5);
    
    /*//body
    square(x-20, y-20, 40);
    circle(x-20, y-20, 15);
    circle(x-20, y+20, 15);
    circle(x+20, y-20, 15);
    circle(x+20, y+20, 15);
    
    //turret
    strokeWeight(2);
    stroke(0);
    translate(x, y);
    rotate(radians(deg));
    rect(-5, 0, 10, -50);
    rotate(radians(-deg));
    translate(-x, -y);
    noStroke();
    
    rect(x-20, y-30, map(HP, 0, initialHP, 0, 40), 2.5);
    fill(0);
    text("Sn", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-20 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+20 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+35 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }

}



class sentry extends enemyShip {
  
  float initialHP, HP, DMG, speed, deg;
  
  sentry(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 8;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*7;
    DMG = dmg;
  }
  
  void shoot() {
    bullets.add(new bullet(x, y, DMG, 4, 5, deg, false, bc, gc));
  }
  
  void move() {
    if (y < 600) y += speed;
    
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    if (a < 0) {
      right = true;
    }
    deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    if (!right) {
      deg = 360 - deg;
    }
  }
  
  void drawEnemy() {
    
    image(sentry, x-28, y-28, 56, 56);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-20, y-20, 40, 40);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    
    /*fill(255, 0, 0);
    square(x-20, y-20, 40);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    
    strokeWeight(2);
    stroke(0);
    translate(x, y);
    rotate(radians(deg));
    rect(-4, 0, 8, -30);
    rotate(radians(-deg));
    translate(-x, -y);
    noStroke();
    
    fill(0);
    text("Se", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-20 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+20 && this.y-20 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+20 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-20 < x+(size/2) && x-(size/2) < this.x+20 && this.y-20 < y+(size/2) && y-(size/2) < this.y+20) return true;
    else return false;
  }

}

class shotty extends enemyShip {
  
  float initialHP, HP, DMG, speed, deg;
  
  shotty(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 90;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*4;
    DMG = dmg;
  }
  
  void shoot() {
    for (int i = 0; i < 10; i++) bullets.add(new bullet(x, y, DMG, 4, random(6, 10), random(deg-10, deg+10), false, bc, gc));
  }
  
  void move() {
    if (y < 600) y += speed;
    
    
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    if (a < 0) {
      right = true;
    }
    deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    if (!right) {
      deg = 360 - deg;
    }
  }
  
  void drawEnemy() {
    
    image(shotty, x-28, y-28, 56, 56);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-20, y-20, 40, 40);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    
    /*fill(255, 0, 0);
    square(x-20, y-20, 40);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    
    strokeWeight(2);
    stroke(0);
    fill(255, 0, 0);
    translate(x, y);
    rotate(radians(deg));
    triangle(0, 0, -10, -40, 10, -40);
    rotate(radians(-deg));
    translate(-x, -y);
    noStroke();
    
    fill(0);
    text("Sh", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-20 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+20 && this.y-20 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+20 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-20 < x+(size/2) && x-(size/2) < this.x+20 && this.y-20 < y+(size/2) && y-(size/2) < this.y+20) return true;
    else return false;
  }

}

class missler extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  float deg;
  
  missler(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 30;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*5;
    DMG = dmg*5;
  }
  
  void shoot() {
    missles.add(new missle(x, y, DMG, 5, 3, deg, false, 60, 1, 0));
  }
  
  void move() {
    if (y < 600) y += speed;
    
    // to save future computation time since this has to be calculated for every frame
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    if (a < 0) {
      right = true;
    }
    deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    if (!right) {
      deg = 360 - deg;
    }
  }
  
  void drawEnemy() {
    
    image(missler, x-30, y-30, 60, 60);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-25, y-25, 50, 50);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
    
    /*
    //body
    square(x-20, y-20, 40);
    circle(x-20, y-20, 15);
    circle(x-20, y+20, 15);
    circle(x+20, y-20, 15);
    circle(x+20, y+20, 15);
    
    //turret
    strokeWeight(2);
    stroke(0);
    translate(x, y);
    rotate(radians(deg));
    rect(-5, 0, 10, -50);
    rotate(radians(-deg));
    translate(-x, -y);
    noStroke();
    
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    fill(0);
    text("Mi", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-25 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+25 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+25 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }

}

class forker extends enemyShip {
  
  float initialHP, HP, DMG, speed, deg;
  
  forker(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 45;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*4;
    DMG = dmg;
  }
  
  void shoot() {
    for (int i = 0; i < 11; i++) bullets.add(new bullet(x, y, DMG, 6, 5, deg-30+(i*6), false, bc, gc));
  }
  
  void move() {
    if (y < 600) y += speed;
    
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    if (a < 0) {
      right = true;
    }
    deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    if (!right) {
      deg = 360 - deg;
    }
  }
  
  void drawEnemy() {
    
    image(forker, x-28, y-28, 56, 56);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-20, y-20, 40, 40);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    
    /*square(x-20, y-20, 40);
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    
    strokeWeight(2);
    stroke(0);
    fill(255, 0, 0);
    translate(x, y);
    rotate(radians(deg));
    triangle(0, 0, -10, -40, 10, -40);
    rotate(radians(-deg));
    translate(-x, -y);
    noStroke();
    
    fill(0);
    text("Fo", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-20 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+20 && this.y-20 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+20 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-20 < x+(size/2) && x-(size/2) < this.x+20 && this.y-20 < y+(size/2) && y-(size/2) < this.y+20) return true;
    else return false;
  }

}

class scatter extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  
  scatter(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 45;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*8;
    DMG = dmg*2;
  }
  
  int i = 0;
  void shoot() {
    if (i == 0) for (int j = 0; j < 8; j++) bullets.add(new bullet(x, y, DMG, 10, 2.5, 45*j, false, bc, gc));
    else if (i == 1) for (int j = 0; j < 8; j++) bullets.add(new bullet(x, y, DMG, 10, 2.5, 30+(45*j), false, bc, gc));
    else if (i == 2) for (int j = 0; j < 8; j++) bullets.add(new bullet(x, y, DMG, 10, 2.5, 60+(45*j), false, bc, gc));
    
    if (i == 2) i = 0;
    else i++;
  }
  
  void move() {
    if (y < 600) y += speed;
  }
  
  int j = 0;
  void drawEnemy() {
    
    translate(x, y);
    rotate(radians(j*5));
    image(scatter, -30, -30, 60, 60);
    rotate(-radians(j*5));
    translate(-x, -y);
    if (j == 17) j = 0;
    else j++;
    
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-25, y-25, 50, 50);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
    
    /*square(x-25, y-25, 50);
    rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
    
    translate(x, y);
    rotate(radians(45));
    square(-25, -25, 50);
    rotate(radians(-45));
    translate(-x, -y);
    noStroke();
    
    fill(0);
    text("Sc", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-25 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+25 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+25 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }
  
}

class rando extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  
  rando(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 1;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*8;
    DMG = dmg*2;
  }
  
  
  void shoot() {
    bullets.add(new bullet(x, y, DMG, 10, 2.5, random(0, 360), false, bc, gc));
  }
  
  void move() {
    if (y < 600) y += speed;
  }
  
  void drawEnemy() {
    
    image(rando, x-30, y-30, 60, 60);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-30, y-30, 60, 60);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-30, y-35, map(HP, 0, initialHP, 0, 50), 2.5);
    
    /*float rand = random(20, 40);

    rect(x-25, y-40, map(HP, 0, initialHP, 0, 50), 2.5);
    
    rand = random(0, 90);
    float rand2 = random(20, 40);
    translate(x, y);
    rotate(radians(rand));
    square(-rand2/2, -rand2/2, rand2);
    rotate(radians(-rand));
    translate(-x, -y);
    noStroke();
    
    fill(0);
    text("R", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-30 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+30 && this.y-30 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+30 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }
  
}

class carrier extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  boolean docked;
  
  carrier(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 158;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*10;
    DMG = dmg*2;
    
    docked = false;
  }
  
  int frameCountRemember;
  void shoot() {
    if (cooldown != 2) {
      frameCountRemember = frameCount;
      frameCount = (300/spawnRate)-1;
      cooldown = 2;
      animationCount = 120;
    } else {
      frameCount = frameCountRemember;
      if (docked) cooldown = 88;
      else cooldown = 158;
    }
  }
  
  void move() {
    if (y < 600) y += speed;
    else docked = true;
  }
  
  int animationCount = 0;
  void drawEnemy() {
    
    image(carrier, x-50, y-20, 100, 40);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-50, y-20, 100, 40);
    noStroke();
    
    fill(255, animationCount*2);
    rect(x-50, y-20, 100, 40);// change this later
    animationCount--;
    
    fill(255, 0, 0);
    rect(x-50, y-25, map(HP, 0, initialHP, 0, 100), 2.5);
    
    /*fill(255, animationCount*2, animationCount*2);
    animationCount--;
    rect(x-20, y-50, 40, 100);
    
    stroke(0);
    strokeWeight(2);
    circle(x, y-33, 20);
    circle(x, y, 20);
    circle(x, y+33, 20);
    noStroke();
    
    fill(0);
    text("Ca", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-50 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+50 && this.y-20 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+20 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-20 < x+(size/2) && x-(size/2) < this.x+20 && this.y-50 < y+(size/2) && y-(size/2) < this.y+50) return true;
    else return false;
  }
  
}

class charger extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  float deg;
  boolean blown;
  
  charger(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 300;
    counter = 0;
    
    speed = 10;
    initialHP = HP = hp*1.5;
    DMG = dmg*10;
    
    blown = false;
  }
  
  void shoot() {
    if (!blown && cooldown == 300) {
      
      blown = true;
      cooldown = 80;
    } else {
      this.oob = true;
    }
  }
  
  void move() {
    if (!blown) {
      if (sqrt(((this.x-player.x)*(this.x-player.x)) + ((this.y-player.y)*(this.y-player.y))) < 40) {
        shoot();
        counter = 0;
      }
      // to save future computation time since this has to be calculated for every frame
      boolean right = false;
      float a = this.x - player.x; // x between ship and player
      float b = this.y - player.y; // y betwwen ship and player
      double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
      if (a < 0) {
        right = true;
      }
      deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
      if (!right) {
        deg = 360 - deg;
      }
      
      
    
    
      x += Math.sin(radians(deg))*speed;
      y -= Math.cos(radians(deg))*speed;
    }
  }
  
  void drawEnemy() {
    if (!blown) {
      
      translate(x, y);
      rotate(radians(deg+180));
      image(charger, -28, -28, 56, 56);
      rotate(-radians(deg+180));
      translate(-x, -y);
      
      strokeWeight(1);
      stroke(255);
      noFill();
      rect(x-25, y-25, 50, 50);
      noStroke();
    
      fill(255, 0, 0);
      rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
      
      /*
      //body
      circle(x, y, 50);
      
      //turret
      strokeWeight(2);
      stroke(0);
      translate(x, y);
      rotate(radians(deg));
      triangle(-20, 30, 0, -20, 0, 0);
      triangle(20, 30, 0, -20, 0, 0);
      rotate(radians(-deg));
      translate(-x, -y);
      noStroke();
      
      rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
      fill(0);
      text("CH", x, y);*/
    } else {
      fill(map(counter, 0, 80, 255, 0), 255-(counter*4), 255-(counter*4), 240-counter*3);
      circle(x, y, 150);
      if (counter < 10) {
        if (sqrt(((this.x-player.x)*(this.x-player.x)) + (this.y-player.y)*(this.y-player.y)) < 75) {
          player.damage(DMG);
        }
      }
    }
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      counter = cooldown-1;
      giveReward();
    }
  }
  
  boolean awardGiven = false;
  void giveReward() {
    if (!awardGiven) {
      player.giveReward(baseReward*15, 0, baseReward*15);
      awardGiven = true;
    }
  }
  
  void checkImpact() {
    if (!blown) {
      for (bullet b : bullets) {
        if (this.x-25 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+25 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+25 && b.playerBullet) {
          b.oob = true;
          this.damage(b.damage);
          if (this.oob) break;
        }
      }
    }  
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }

}

class missleMaster extends enemyShip {
  
  float initialHP, HP, DMG, speed;
  float deg;
  
  missleMaster(float hp, float dmg, float s) {
    x = (int) random(50, 950);
    y = 0;
    
    cooldown = 180;
    counter = 0;
    
    speed = s;
    initialHP = HP = hp*7;
    DMG = dmg;
  }
  
  void shoot() {
    for (int i = 0; i < 16; i++) missles.add(new missle(x, y, DMG, 4, 3, deg+(22.5*i), false, 45, 1.5, 0));
  }
  
  void move() {
    if (y < 600) y += speed;
    
    // to save future computation time since this has to be calculated for every frame
    boolean right = false;
    float a = this.x - player.x; // x between ship and player
    float b = this.y - player.y; // y betwwen ship and player
    double c = Math.sqrt((a*a)+(b*b)); // hypotenuse
    if (a < 0) {
      right = true;
    }
    deg = degrees(acos((float)(((b*b)+(c*c)-(a*a))/(2*b*c))));
    if (!right) {
      deg = 360 - deg;
    }
  }
  
  void drawEnemy() {
    
    image(missleMaster, x-28, y-28, 56, 56);
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x-25, y-25, 50, 50);
    noStroke();
    
    fill(255, 0, 0);
    rect(x-25, y-30, map(HP, 0, initialHP, 0, 50), 2.5);
    
    /*
    //body
    square(x-20, y-20, 40);
    circle(x-20, y-20, 15);
    circle(x-20, y+20, 15);
    circle(x+20, y-20, 15);
    circle(x+20, y+20, 15);
    
    //turret
    strokeWeight(2);
    stroke(0);
    translate(x, y);
    rotate(radians(deg));
    rect(-5, 0, 10, -50);
    rotate(radians(-deg));
    translate(-x, -y);
    noStroke();
    
    rect(x-20, y-25, map(HP, 0, initialHP, 0, 40), 2.5);
    fill(0);
    text("MM", x, y);*/
  }
  
  void damage(float dmg) {
    HP -= dmg;
    if (this.HP <= 0) {
      giveReward();
      this.oob = true;
    }
  }
  
  void giveReward() {
    player.giveReward(baseReward*15, 0, baseReward*15);
  }
  
  void checkImpact() {
    if (this.y > 1000) oob = true;
    for (bullet b : bullets) {
      if (this.x-25 < b.x+(b.size/2) && b.x-(b.size/2) < this.x+25 && this.y-25 < b.y+(b.size/2) && b.y-(b.size/2) < this.y+25 && b.playerBullet) {
        b.oob = true;
        this.damage(b.damage);
        if (this.oob) break;
      }
    }
  }
  
  // assumes x/y to be center
  boolean checkCollision(float x, float y, float size) {
    if (this.x-25 < x+(size/2) && x-(size/2) < this.x+25 && this.y-25 < y+(size/2) && y-(size/2) < this.y+25) return true;
    else return false;
  }

}


int page = 1;

upgrade[][] upgrades = new upgrade[3][16];
// first is used for page number (offense, defense, other)
// second is used for upgrades within page number


// will have to add a special variable in every ship for how much it gives (probably have a "base reward")
// will tweak numbers later

void drawUpgradeMenu() {
  cursor();
  
  drawUpgradeBackground();
  
  showOptions();
}

void drawUpgradeBackground() {
  background(10);
  
  fill(50);
  rect(0, 0, 1400, 200);
  fill(220);
  textSize(100);
  text("Upgrades", 695, 90);
  
  textSize(50);
  text("Upgrade Points Available: " + upgradePoints, 680, 250); 
}

void showOptions() {
  if (page == 1) {
    textSize(30);
    text("Offense", 695, 170);
    
    fill(50);
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (upgrades[0][j + (3*i)] != null) {
          upgrades[0][j+(3*i)].setArea(200+(350*j), 325+(175*i), 300, 125);
          upgrades[0][j+(3*i)].drawButton();
        }
      }
    }
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (upgrades[0][j + (3*i)] != null) {
          upgrades[0][j+(3*i)].mouseHover();
          upgrades[0][j+(3*i)].select();
        }
      }
    }
    
              
    
    
    
  } else if (page == 2) {
    textSize(30);
    text("Defense", 695, 170);
    
    fill(50);
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (upgrades[1][j + (3*i)] != null) {
          upgrades[1][j+(3*i)].setArea(200+(350*j), 325+(175*i), 300, 125);
          upgrades[1][j+(3*i)].drawButton();
        }
      }
    }
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (upgrades[1][j + (3*i)] != null) {
          upgrades[1][j+(3*i)].mouseHover();
          upgrades[1][j+(3*i)].select();
        }
      }
    }
    
  } else if (page == 3) {
    textSize(30);
    text("Other", 695, 170);
    
    fill(50);
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (upgrades[2][j + (3*i)] != null) {
          upgrades[2][j+(3*i)].setArea(200+(350*j), 325+(175*i), 300, 125);
          upgrades[2][j+(3*i)].drawButton();
        }
      }
    }
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (upgrades[2][j + (3*i)] != null) {
          upgrades[2][j+(3*i)].mouseHover();
          upgrades[2][j+(3*i)].select();
        }
      }
    }
    
  }
  
  
  
  
  
  noStroke();
  if (page != 1) {
    buttons[8].drawButton();
    buttons[8].mouseHover();
    page = buttons[8].select(page);
  } else {
    fill(50);
    rect(0, 200, 100, 1000);
  }
      
  if (page /*last page*/ != 3) {
    buttons[9].drawButton();
    buttons[9].mouseHover();
    page = buttons[9].select(page);
  } else {
    fill(50);
    rect(1300, 200, 100, 1000);
  }
}










// button dedicated to upgrades
class upgrade {
  int id;
  
  float x, y, l, w;
  
  color c;              // color of hover
  String name;          // name is what is printed on the button
  String description;   // description should explain what upgrade does
  String[] effects;     // shows all the effects of the upgrade in equation format (old + increment(green) = new)
  float cost;
  int counter;
  
  boolean selected = false;
  boolean maxed = false;
  
  upgrade(String n, String d, String[] e, float cost, int ID) {
    name = n;
    description = d;
    this.cost = cost;
    if (id == 16) counter = 1;
    else counter = 0;
    
    effects = new String[e.length];
    for (int i = 0; i < e.length; i++) effects[i] = e[i];
    
    id = ID;
  }
  
  void setArea(float xx, float yy, float ll, float ww) {
    x = xx;
    y = yy;
    l = ll;
    w = ww;
  }
  
  void drawButton() {
    fill(150);
    rect(x, y, l, w);
    
    stroke(255);
    fill(0);
    textSize(21);
    textAlign(CENTER, BOTTOM);
    text(name, (x+(x+l))/2, -10+(y+(y+w))/2);
    textAlign(CENTER, TOP);
    text(cost, (x+(x+l))/2, 10+(y+(y+w))/2);
    textAlign(CENTER, CENTER);
    
    noStroke();
  }
  
  void mouseHover() {
    
    if (x < mouseX && mouseX < x+l && y < mouseY && mouseY < y+w) {
      
      stroke(255);
      strokeWeight(1);
      fill(100, 100, 0, 100);
      rect(x, y, l, w);
      
      fill(50, 255);
      if (mouseX > 900 && mouseY > 700) {
        rect(mouseX-400, mouseY-250, 400, 250);
      } else if (mouseX > 900) {
        rect(mouseX-400, mouseY, 400, 250);
      } else if (mouseY > 700) {
        rect(mouseX, mouseY-250, 400, 250);
      } else {
        rect(mouseX, mouseY, 400, 250);
      }
      fill(200);
      textAlign(CENTER, TOP);
      textSize(20);
      
      if (mouseX > 900 && mouseY > 700) {
        text(description, mouseX-400, mouseY-250+20, 400, 200);
        for (int i = 0; i < effects.length; i++) text(effects[i], mouseX-400+200, mouseY-250+220-(30*(effects.length-i)));  
      } else if (mouseX > 900) {
        text(description, mouseX-400, mouseY+20, 400, 200);
        for (int i = 0; i < effects.length; i++) text(effects[i], mouseX-400+200, mouseY+220-(30*(effects.length-i)));
      } else if (mouseY > 700) {
        text(description, mouseX, mouseY-250+20, 400, 200);
        for (int i = 0; i < effects.length; i++) text(effects[i], mouseX+200, mouseY-250+220-(30*(effects.length-i)));
      } else {
        text(description, mouseX, mouseY+20, 400, 200);
        for (int i = 0; i < effects.length; i++) text(effects[i], mouseX+200, mouseY+220-(30*(effects.length-i)));
      }
      
      selected = true;
    } else selected = false;
  }
  
  void select() {
    if (!mousePressed) mouseClicked = false;
    if (mousePressed && selected && !mouseClicked && !maxed) {
      mouseClicked = true;
      if (upgradePoints >= cost){
        upgradePoints -= cost;
        
        switch (id) {
          case 1:
            player.damage *= 2;
            
            player.curHealth += player.maxHealth;
            player.maxHealth *= 2;
            
            player.curShield += player.maxShield;
            player.maxShield *= 2;
            
            cost *= 4;
            
            effects[0] = "Damage: " + player.damage + " + " + player.damage + " = " + (player.damage*2);
            effects[1] = "Health: " + player.maxHealth + " + " + player.maxHealth + " = " + (player.maxHealth*2);
            effects[2] = "Shield: " + player.maxShield + " + " + player.maxShield + " = " + (player.maxShield*2);
            
            break;
          case 2:
          
            player.bulletCooldownRemember -= 1;
            if (player.bulletCooldownRemember == 1) maxed = true;
            
            
            cost *= 7;
            
            effects[0] = "Rate of Fire: " + player.bulletCooldownRemember + " - " + 1 + " = " + (player.bulletCooldownRemember-1);

            break;
          case 3:
            
            player.numOfBullets++;
            if (player.numOfBullets == 5) maxed = true;
          
            cost *= 5;
            
            effects[0] = "Amount of Bullets: " + player.numOfBullets + " + " + 1 + " = " + (player.numOfBullets+1);
            
            break;
          case 4:
            
            player.bulletSize += 2.5;
            if (player.bulletSize >= 12) maxed = true;
            
            cost *= 10;
            
            effects[0] = "Bullet size: " + player.bulletSize + " + 2.5 = " + (player.bulletSize+2.5);

          
            break;
          case 5:
          
            player.numOfMissles++;
            if (player.numOfMissles == 3) maxed = true;
            
            cost *= 10;
          
            effects[0] = "Amount of Missles: " + player.numOfMissles + " + " + 1 + " = " + (player.numOfMissles+1);  
            
            break;
            
            // left off here
          case 6:
          
            player.missleSplash += 50;
            if (player.missleSplash >= 250) maxed = true;
            
            cost *= 6;
          
            effects[0] = "Splash Diameter: " + player.missleSplash + " + " + 50 + " = " + (player.missleSplash+50); 
            
            break;
            
          case 7:
          
            player.smartRating += 10;
            if (player.smartRating >= 90) maxed = true;
            
            cost *= 7;
          
            effects[0] = "Smart rating: " + player.smartRating + " + " + 10 + " = " + (player.smartRating+10); 
            
            break;
            
          case 8:
          
            player.rocketDrift += 0.2;
            if (player.rocketDrift >= 2) maxed = true;
            
            cost *= 7;
          
            effects[0] = "Rocket drift: " + player.rocketDrift + " + " + 0.2 + " = " + (player.rocketDrift+0.2);
            
            break;
            
          case 9:
          
            player.missleCooldownRemember -= 10;
            if (player.missleCooldownRemember <= 10) maxed = true;
            
            cost *= 8;
          
            effects[0] = "Missle rate of fire: " + player.missleCooldownRemember + " - " + 10 + " = " + (player.missleCooldownRemember-10);
            
            break;
            
          case 10:
          
            player.shieldCooldown -= 50;
            if (player.shieldCooldown <= 150) maxed = true;
            
            cost *= 4;
            
            effects[0] = "shield cooldown: " + player.shieldCooldown + " - " + 50 + " = " + (player.shieldCooldown-50);
            
            break;
          case 11:
          
            if (player.shieldRegen == 0.001) player.shieldRegen += 0.004;
            else {
              player.shieldRegen += 0.005;
              maxed = true;
            }
            
            cost *= 7;
          
            effects[0] = "shield regeneration: " + player.shieldRegen + " + " + 0.005 + " = " + (player.shieldRegen+0.005);
            
            break;
          case 12:
          
            player.nullifyChance += 5;
            if (player.nullifyChance >= 10) maxed = true;
            
            cost *= 10;
          
            effects[0] = "nullification chance: " + player.nullifyChance + " + " + 5 + " = " + (player.nullifyChance+5);
          
            break;
          case 13:
          
            player.blockedPercent += 10;
            if (player.blockedPercent >= 90) maxed = true;
          
            cost *= 8;
          
            effects[0] = "blocked percent: " + player.blockedPercent + " + " + 10 + " = " + (player.blockedPercent+10);
            
            break;
          case 14:
          
            player.upgradePointMultiplier += 0.2;
            if (player.upgradePointMultiplier >= 2) maxed = true;
            
            cost *= 5;
          
            effects[0] = "upgrade point drop multiplier: " + player.upgradePointMultiplier + " + " + 0.2 + " = " + (player.upgradePointMultiplier+0.2);
          
            break;  
          case 15:
          
            player.levelMultiplier += 0.5;
            if (player.levelMultiplier >= 4) maxed = true;
            
            cost *= 4;
          
            effects[0] = "level progression multiplier: " + player.levelMultiplier + " + " + 0.2 + " = " + (player.levelMultiplier+0.5);
          
            break;
          case 16:
          
            cost *= 80; // 40/4 = 20x the cost increase
            counter *= 4;
          
            for (int i = 0; i < 3; i++) {
              for (int j = 0; j < upgrades[i].length; j++) {
                if (upgrades[i][j] != null) upgrades[i][j].cost /= 3;
              }
            }
          
            effects[0] = "upgrade point cost decrease: " + counter + "x * 4x";
            
            break;
          case 17:
          
            timeStopRegenRemember -= 50;
            if (timeStopRegenRemember <= 100) maxed = true;
            
            cost *= 8;
          
            effects[0] = "time stop regen: " + timeStopRegenRemember + " - " + 50 + " = " + (timeStopRegenRemember-50);
            
            break;  
          case 18:
          
            maxTimeStop += 10;
            if (maxTimeStop >= 50) maxed = true;
            
            cost *= 7;
          
            effects[0] = "time stop capacity: " + maxTimeStop + " + " + 10 + " = " + (maxTimeStop+10);
          
            break;
          case 19:
          
            baseDMG /= di;
            baseHP /= di;
          
            cost *= 6;
            counter++;
            if (counter >= 10) maxed = true;
            effects[0] = "levels degressed: " + counter + " + 1";
          
            break;
          default:
        }
      }
    }
  }
}




// defensive
// shield cooldown
// shield regen (percentage value)
// nullify chance (keep pretty low, even at max (10% max))



// other
// rate of upgradePoint (multiplies by 1.2 per upgrade, Max: 10)
// progress of level (enemy drops multiply by 2, makes game progress faster, and makes bosses worth a lot)
// upgradePoint cost decrease
// SlowMo regen
// SlowMo capacity
// decrease enemy base stats for a level (Max: 10)









/*
UPDATE LOG

05/14/2020
  Started main menu
  Built button class
  Built player class
  Built enemyShip class
  Built a normal / big / heal ship
  Built Bullet class
  Tweaked difficulty-increment values
  
05/15/2020
  Started upgrade menu
  Started instructions menu  
  Built first boss
  Built additional helper methods to several classes
  Built reward system
  Built GUI
  Built bomb
  Built level system
  Tweaked main menu
  
05/16/2020
  Built 2nd and 3rd boss
  Built minimal boss animations
  Built Missle class
  Built time slow
  Built 8 types of "mini-bosses" or special units that appear once per wave
  Built some more helper methods
  Built upgrade button class
  Built surrender option
  Tweaked some award system values
  Tweaked button alignments in main menus
         
05/17/2020
  Started upgrade button to upgrade menu implimentation
  Built player shield
  Built mini-boss implimentation
  Built 2 more types of "mini-bosses" (10 total)
  Tweaked boss spawn conditions... Now waits until there are no enemies on screen until boss spawn
  Tweaked first boss animation
  Tweaked how rate of fire works for player
  Tweaked how GUI shows time slow
  Fixed missle tracking
  
05/18/2020
  Continued upgrade implimentation
  Fixed surrender option
  
05/21/2020
  Built actual player ship asset
  Built actual enemy normal ship asset
  Built actual enemy big ship asset
  Built actual enemy heal ship asset
  Built actual background
  Built some more upgrades
  Tweaked renderer
  Tweaked bullets for custom colors for center and glow
  Tweaked background behavior upon incoming boss
  Attempted bullet glow effect
  
05/22/2020
  Built actual boss 3 asset

05/23/2020
  Built road lights
  Built actual boss 2 asset
  Built death animation
  Tweaked boss health display
  Optimized missle tracking

05/26/2020
  Built actual boss 1 asset
  Built offensive tab in upgrades
  Tweaked boss 2 animation
  Fixed player death animation
  Fixed being able to put up upgrade menu before boss (but still [and intentionally so] can't open up upgrade menu during boss fight)
  
05/30/2020
  Built all upgrade tabs
  Tweaked mini-boss stats
  Tweaked reward system
  
05/31/2020
  Built 9 mini-boss assets
  Tweaked boss 2 health
  Tweaked boss rewards
  Fixed/Tweaked scoring system based on difficulty
  Fixed upgrade that lowers other upgrade costs
  Fixed carrier spawn rate
  
06/01/2020
  Built Boss 4 attack 1/2
  
06/02/2020
  Started some play tests
  Built actual boss 4 asset
  Built Boss 4 attack 3
  Tweaked upgrade reduction cost upgrade
  
06/03/2020
  Fixed instructions
  Fixed about
  
06/04/2020
  Built boss tests (plus boss test replayability)
  

// order
  // Started
  // Built
  // Optimized
  // Tweaked
  // Attempted
  
What would change if I could start over
 bullets determine the impact (like in missle class) and have a special method for hitbox
 be more specific with fill/stroke methods
 consistancy in code

*/
