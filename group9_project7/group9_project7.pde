import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Dennis{
Minim minim; 
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;
// }Dennis

game game_1;






void setup () {
  size (1400, 800);
  
  // Dennis{
  minim = new Minim(this);   
  mySound = minim.loadFile("RickRoll.mp3");
  // }Dennis
  
  game_1 = new game(minim,mySound,beat,bl);


}


void draw () {
  if (game_1.state == "quit") {
    exit ();
  }
  else {
    //if(this.beat.isOnset()){this.onBeat=true;};
    game_1.run();
  }

}

void keyPressed () {
  //print(key);
  
  if (game_1.state == "init") {
    if ((key == 'a')) {
      game_1.character = "Banana";
    }
    else if ((key == 'b')) {
      game_1.character = "Goku";
    }
    else if ((key == 'c')) {
      game_1.character = "Sonic";
    }
     else if ((key == 'd')) {
      game_1.character = "Aqua";
    }
    
  }

  else if ((game_1.state == "play") && (key == 'p')) {
    game_1.state = "pause";
    game_1.clock.paused = true;
  }
  
  
  //// I can't get this score update to work
  //else if ((game_1.state == "play") && (key == game_1.command.charAt (0))) {
  //  game_1.player_score.update (10);
  //}

  // I can't get this score update to work
  else if ((game_1.state == "play") && (key == Character.toLowerCase(game_1.Letters.get(0).command)) && (game_1.Letters.get(0).letter_in_circle())) {
    //print("Key Pressed"+key);
    if(game_1.Letters.get(0).command == 'A'){
      //print("A");
      noStroke();
      fill(0,250,0);
      ellipse(50,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("Awesome!",170,200);
    }
    else if(game_1.Letters.get(0).command == 'W'){
      //print("W");
      noStroke();
      fill(0,250,0);
      ellipse(130,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("Incredible!",170,200);
    }
    else if(game_1.Letters.get(0).command == 'S'){
      //print("S");
      noStroke();
      fill(0,250,0);
      ellipse(210,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("WOW!",170,200);
    }
    else if(game_1.Letters.get(0).command == 'D'){
      //print("D");
      noStroke();
      fill(0,250,0);
      ellipse(290,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("Keep it up!",170,200);
    }
    game_1.player_score.update (10);
  }
  else if( (game_1.state == "play") && ( (key != Character.toLowerCase(game_1.Letters.get(0).command)) || !(game_1.Letters.get(0).letter_in_circle()) ) ){
    if(key=='a'){
      noStroke();
      fill(250,0,0);
      ellipse(50,700,78,78);
      game_1.player_score.update(-10);
    }
    if(key=='w'){
      noStroke();
      fill(250,0,0);
      ellipse(130,700,78,78);
      game_1.player_score.update(-10);
    }
    if(key=='s'){
      noStroke();
      fill(250,0,0);
      ellipse(210,700,78,78);
      game_1.player_score.update(-10);
    }
    if(key=='d'){
      noStroke();
      fill(250,0,0);
      ellipse(290,700,78,78);
      game_1.player_score.update(-10);
    }    
  }
  
  
  
  else if ((game_1.state == "pause") && (key == 'p')) {
    game_1.state = "play";
    game_1.clock.paused = false;
  }
  else if ((game_1.state == "pause") && (key == 'q')) {
    game_1.state = "quit";
  }
  else if ((game_1.state == "over") && (key == 'a')) {
    game_1.state = "init";
    game_1.clock = new timer (millis (), 60);
  }
  else if ((game_1.state == "over") && (key == 'q')) {
    game_1.state = "quit";
  }
}