// Brittni Watkins
// Term Project
// Banned Book Statistics

/* This program renders a visual, interactive representation of all the books 
   that have been challenged or banned in in the past decade. There are three 
   main parts to the program: the book screen, the author screen, and the state 
   screen. On the book screen there will be a visual representaion of each book
   that has been banned in the past decade; the size will be dependent on the
   number of times that book was challenged. The representations will float
   freely into and out of the screen. When a "book" is clicked on, a small pop-up
   window will appear with some statistics on that book. The same basic concept
   applies to the author and state screens. Author size will be dependent on the
   number of books and number of times those books have been challenged, and
   state size will very according to the number of challenges that have been
   filed in that state.*/
 
/* Note: Menu hidden in top left corner. It will not appear until the mouse
   hovers over it. */

// State and country flag images taken from:
//   http://www.factmonster.com/spot/stateflags1.html
//   http://www.factmonster.com/countries.html
PImage[] flags = new PImage[63];

Table bookTable;
Table authorTable;
Table stateTable;

ArrayList<Visual> visuals = new ArrayList<Visual>();

final int START = 0;
int bookStart = START;
int bookEnd = 339;
int authorStart = bookEnd;
int authorEnd = 635;
int stateStart = authorEnd;
int stateEnd = 698;
int end = stateEnd;

Window popUp;

boolean currentlyPausing = false;

final int BOOK = 1;
final int AUTHOR = 2;
final int STATE = 3;

void setup() {
  size(displayWidth, displayHeight);
  
  for (int i = 0; i < flags.length; i++) {
    flags[i] = loadImage(i + ".gif");
  }
  
  bookTable = loadTable("books.csv", "header");
  authorTable = loadTable("authors.csv", "header");
  stateTable = loadTable("states.csv", "header");
  
  for (int i = START; i < end; i++) {
    if (i >= bookStart && i < bookEnd) {
      visuals.add(new Book(i));
    } else if (i >= authorStart && i < authorEnd) {
      visuals.add(new Author(i - authorStart));
    } else if (i >= stateStart && i < stateEnd) {
      visuals.add(new State(i - stateStart));
    }
  }
  
}

void draw() {
  int m = millis();
  if (screen == START_SCREEN) {
    drawStartScreen();
  } else if (screen != START_SCREEN) {
    if (screen == BOOK_SCREEN) {
      drawBookScreen();
    } else if (screen == AUTHOR_SCREEN) {
      drawAuthorScreen();
    } else if (screen == STATE_SCREEN) {
      drawStateScreen();
    }
    if (m % 60000 >= 0 && m % 60000 <= 10000) {
     drawInstructions();
    }
    drawMenu();
    checkPausing();
    drawWindow();
  }
}

void drawBookScreen() {
  background(255);
  for (int i = bookStart; i < bookEnd; i++) {
    visuals.get(i).move();
    visuals.get(i).draw();
    visuals.get(i).name();
  }
}

void drawAuthorScreen() {
  background(255);
  for (int i = authorStart; i < authorEnd; i++) {
    visuals.get(i).move();
    visuals.get(i).draw();
    visuals.get(i).name();
  }
}

void drawStateScreen() {
  background(255);
  for (int i = stateStart; i < stateEnd; i++) {
    visuals.get(i).move();
    visuals.get(i).draw();
    visuals.get(i).name();
  }
}

void checkPausing() {
   boolean anyVisualsPaused = false;
  for (int i = START; i < end; ++i) {
    if (!currentlyPausing && visuals.get(i).shouldPause()) {
      if(visuals.get(i).type == BOOK && screen == BOOK_SCREEN || visuals.get(i).type == AUTHOR && screen == AUTHOR_SCREEN || visuals.get(i).type == STATE && screen == STATE_SCREEN) {
        visuals.get(i).pause();
        currentlyPausing = true;
      } 
    }
    if (!visuals.get(i).shouldPause()) {
      visuals.get(i).unPause();
      visuals.get(i).displayWindow = false;
    }
    anyVisualsPaused = anyVisualsPaused || visuals.get(i).isPaused();
  }
  currentlyPausing = anyVisualsPaused;
}

void mouseClicked() {
  for (int i = START; i < end; i++) {
    if (visuals.get(i).shouldPause() && visuals.get(i).isPaused()) {
      visuals.get(i).displayWindow = !visuals.get(i).displayWindow;
    }
  }
}

void drawWindow() {
  for (int i = START; i < end; i++) {
    if (visuals.get(i).displayWindow) {
      popUp = new Window(visuals.get(i));
      popUp.draw();
    }
  }
}
