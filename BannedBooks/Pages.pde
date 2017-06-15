final int START_SCREEN = 0;
final int BOOK_SCREEN = 1;
final int AUTHOR_SCREEN = 2;
final int STATE_SCREEN = 3;
int screen = START_SCREEN;

void drawStartScreen() {
  background(255);
  drawProgramName();
  drawWelcome();
  drawDescription();
  drawClickInstruction();
  drawName();
}

void drawProgramName() {
  fill(0);
  textAlign(CENTER, BOTTOM);
  textSize(60);
  text("Banned and Challenged Book Statistics", width / 2, 3 * height / 8);
}

void drawWelcome() {
  fill(0);
  textSize(50);
  textAlign(CENTER, BOTTOM);
  text("Welcome!", width / 2, height / 2 - (50 / 3));
}

void drawDescription() {
  fill(0);
  textSize(30);
  textAlign(CENTER, TOP);
  text("This is for the stories that were almost never read, for the authors who almost lost their voices, and for the people who almost missed out on a really good book.", width / 4, height / 2, width / 2, 6 * height / 8);
}

void drawClickInstruction() {
  fill(0, 0, 255);
  textSize(25);
  textAlign(CENTER, TOP);  
  text("Click to begin", width / 2, 6 * height / 8);
}

void drawName() {
  fill(0);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Brittni Watkins", 25, 25);
}

void drawMenu() {
  if (mouseOnMenu()) {
    stroke(200);
    fill(200, 100);
    rectMode(CORNER);
    for (int i = 0; i < 300; i += 100) {
      rect(i, 0, 100, 25);
    }
    fill(100);
    textAlign(CENTER, BOTTOM);
    textSize(20);
    text("Books", 50, 25);
    text("Authors", 150, 25);
    text("States", 250, 25);
  }
}

void mousePressed() {
  if (screen == START_SCREEN) {
    screen = BOOK_SCREEN;
  } else if (screen != START_SCREEN) {
    if (bookButton()) {
      screen = BOOK_SCREEN;
    } else if (authorButton()) {
      screen = AUTHOR_SCREEN;
    }  else if (stateButton()) {
      screen = STATE_SCREEN;
    }
  }
}

boolean mouseOnMenu() {
  if (mouseY > 0 && mouseY < 25 && mouseX > 0 && mouseX < 300) {
    return true;
  } else {
    return false;
  }
}

boolean bookButton() {
  if (mouseOnMenu() && mouseX > 0 && mouseX < 100) {
    return true;
  } else {
    return false;
  }
}

boolean authorButton() {
  if (mouseOnMenu() && mouseX > 100 && mouseX < 200) {
    return true;
  } else {
    return false;
  }
}

boolean stateButton() {
  if (mouseOnMenu() && mouseX > 200 && mouseX < 300) {
    return true;
  } else {
    return false;
  }
}

void drawInstructions() {
  fill(150);
  textAlign(CENTER);
  textSize(20);
  if (screen == BOOK_SCREEN) {
    text("Hover over a circle to see the title of the book. Click for more information.", width / 2, height / 2);
  } else if (screen == AUTHOR_SCREEN) {
    text("Hover over a square to see the name of the author. Click for more information.", width / 2, height / 2);
  } else if (screen == STATE_SCREEN) {
    text("Hover over a flag to see the name of that state/country. Click for more information.", width / 2, height / 2);
  }
}
