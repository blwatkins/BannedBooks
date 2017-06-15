class Author extends Visual {
  
  int authorNumber; 
  
   
  Author(int authorNumber) {
    super();
    this.authorNumber = authorNumber;
    TableRow row = authorTable.getRow(authorNumber);
    count = row.getInt("count") + row.getInt("bookCount");
    name = row.getString("author");
    numberOfBooks = row.getInt("bookCount");
    for (int i = 0; i < 6; i++) {
      namesOfBooks[i] = row.getString("book" + (i + 1));
    }
    w = count * 20;
    h = count * 20;
    shade = color(random(50, 100), random(50, 100), random(100, 255));
    type = AUTHOR;
  }
  
  void draw() {
    stroke(shade);
    fill(shade, 100);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}


