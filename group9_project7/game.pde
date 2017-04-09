class game {

  String state;
  String character;
  timer clock;
  score player_score;
  String command;
  game () {
    state = "init";
    character = "none";
    command = "none";
    player_score = new score (300, 60, 50);
    clock = new timer (0, 30);
  }
  
  
  void run () {
    if (this.state == "init") {
      this.display_init ();
    }
    else if (this.state == "play") {
       this.display_play (); 
    }
    else if (this.state == "pause") {
      this.display_paused ();
    }
    else if (this.state == "over") {
      this.display_over ();
    }
  }
  
  void display_command () {
    textAlign (CENTER);
    fill (53, 84, 175);
    textSize (40);
    text ("Press " + this.command.toUpperCase () + " to increase score", 700, 400);
  }
  
  
  void display_init () {
    if (this.character == "none") {
      background (0);
      textAlign (CENTER);
      fill (127, 79, 191);
      textSize (40);
      text ("Pick your character by pressing A, B, C, or D", 700, 400);
    } 
    else {
      this.state = "play";
      this.clock.paused = false;
    } 
  }
  
  
  void display_play () {
    if (this.clock.completed == false) {
      background (0);
      if (this.clock.time_ellapsed < 60) {
        textAlign (CENTER);
        fill (53, 84, 175);
        textSize (40);
        text ("You selected character " + this.character, 700, 400);
      }
      else {
        this.display_command ();
      }
      
      textAlign (RIGHT);
      fill (53, 84, 175);
      textSize (30);
      text ("clock:  " + str (this.clock.time_ellapsed), 1350, 40);
      text ("to pause press p", 1350, 70);
      
      
      if (this.clock.time_ellapsed % 120 == 0) {
        int r = int (random (4));
        if (r == 0) {
          this.command = "w";
        }
        else if (r == 1) {
          this.command = "a";
        }
        else if (r == 2) {
          this.command = "s";
        }
        else if (r == 3) {
          this.command = "d";
        }
      }
      
      this.player_score.display ();
      this.clock.update ();
    }
    else {
      this.character = "none";
      this.state = "over";
    }
  }
  
  
  void display_paused () {
    background (0);
    textAlign (CENTER);
    fill (198, 38, 113);
    textSize (40);
    text ("The game is paused", 700, 400);
    
    textAlign (RIGHT);
    fill (198, 38, 113);
    textSize (30);
    text ("clock:  " + str (this.clock.time_ellapsed), 1350, 40);
    text ("to play press p", 1350, 70);
    
    this.player_score.display ();
  }
  
  
  void display_over () {
    background (0);
    textAlign (CENTER);
    fill (44, 173, 68);
    textSize (40);
    text ("The game is over. If you would like to play again, press Q", 700, 400);
  }
  

}