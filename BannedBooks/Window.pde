class Window {
  float x;
  float y;
  Visual topic;
  
  Window(Visual thing) {
    topic = thing;
    x = topic.x;
    y = topic.y + (topic.h / 2) + 20;
  }

  void draw() {
    fill(0);
    textAlign(CENTER);
    textSize(20);
    if (topic.type == BOOK) {
      text("Author: " + topic.authorOfBook, x, y);
      text("Ban Count: " + topic.count, x, y + 25);
      text("States Where Banned:", x, y + 50);
      for (int i = 0; i < 11; i++) {
        text(topic.statesBanned[i], x, y + 75 + (25 * i));
      }
    } else if (topic.type == AUTHOR) {
      text("Ban Count: " + topic.count, x, y);
      text("Books Banned: ", x, y + 25);
      for (int i = 0; i < 6; i++) {
        text(topic.namesOfBooks[i], x, y + 50 + (25 * i));
      }
    } else if (topic.type == STATE) {
      text(topic.name, x, y);
      text("Ban Count: " + topic.count, x, y + 25);
    }
  }
}
