class State extends Visual {
  
  int stateNumber;

  State(int stateNumber) {
    super();
    this.stateNumber = stateNumber;
    TableRow row = stateTable.getRow(stateNumber);
    count = row.getInt("count");
    name = row.getString("state");
    w = 225 + ((count - 1) * 5);
    h = 150 + ((count - 1) * 5);
    type = STATE;
  }
  
  void draw() {
    noStroke();
    tint(255, 190);
    imageMode(CENTER);
    image(flags[stateNumber], x, y, w, h);
  }
  
  void name() {
    fill(0);
    textSize(count + 14);
    textAlign(CENTER);
    if (shouldPause()) {
      text(name, x, y - ((h / 2) + 25) + ((count + 25) / 4));
    }
  }
  
  boolean shouldPause() {
    return dist(x, y, mouseX, y) < (w / 2) && dist(x, y, x, mouseY) < (h / 2);
  }
}
