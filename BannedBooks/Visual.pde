class Visual { 
  String name;
  String authorOfBook;
  String[] namesOfBooks = new String[6];
  String [] statesBanned = new String[11];
  int numberOfBooks;
  int count; 
  int x;
  int y;
  int xSpeed;
  int ySpeed;
  float w;
  float h;
  color shade;
  boolean paused;
  boolean displayWindow;
  int type;

  Visual() {
    x = int(random(-1000, width + 1000));
    y = int(random(-1000, height + 1000));
    xSpeed = int(random(-2, 3));
    ySpeed = int(random(-2, 3));
    if (xSpeed == 0) {
      xSpeed = 1;
    } 
    if (ySpeed == 0) {
      ySpeed = 1;
    }
    paused = false;
    displayWindow = false;
  }
  
  void draw() {
  }
  
  void name() {
    fill(0);
    textSize(count + 14);
    textAlign(CENTER);
    if (shouldPause()) {
      text(name, x, y + ((count + 25) / 4));
    } 
  }
  
  void pause() {
    paused = true;
  }
  
  void unPause() {
    paused = false;
  }
  
  boolean isPaused() {
    return paused;
  }
  
  void move() {
    if (paused) {
      return;
    } else {
      x += xSpeed;
      y += ySpeed;
      unPause();
      if (hitsHorizontalEdge()) {
        xSpeed *= -1;
      }
      if (hitsVerticalEdge()) {
        ySpeed *= -1; 
      }
    }
  }
  
  boolean hitsHorizontalEdge() {
    return x < -1000 || x > width + 1000;
  }
  
  boolean hitsVerticalEdge() {
    return y < -1000 || y > height + 1000;
  }
  
  boolean shouldPause() {
    return dist(x, y, mouseX, mouseY) < (w / 2) && dist(x, y, mouseX, mouseY) < (h / 2);
  } 
}
