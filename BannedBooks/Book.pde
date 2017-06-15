class Book extends Visual {
  
  int bookNumber;
  
  Book(int bookNumber) {
    super();
    this.bookNumber = bookNumber;
    TableRow row = bookTable.getRow(bookNumber);
    count = row.getInt("count");
    name = row.getString("title");
    authorOfBook = row.getString("author");
    for (int i = 0; i < 11; i++) {
      statesBanned[i] = row.getString("state" + (i + 1));
    }
    w = count * 40;
    h = count * 40;
    shade = color(random(255), random(255), random(255));
    type = BOOK;
  }
  
  void draw() {
    stroke(shade);
    fill(shade, 100);
    ellipse(x, y, w, h);
  }  
}

