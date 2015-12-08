class Graph  //super class for the line and bar graphs
{
  float border; //to indent each side of the graph a certain amount, to allow for the axes
  float x1, x2, xY, y1, y2, yX; //variables for drawing the axes
  
  Graph()  //constructor, assigning values to the variables
  {
    border = (float) width * 0.15f;
    x1 = border - (width * 0.02f);
    x2 = width - border;
    xY = height - border + 1;
    y1 = border;
    y2 = height - border + (width * 0.02f);
    yX = border - (border * 0.01f);
  }
  
  //method for drawing axes
  void drawAxes()
  {
    stroke(255);
    strokeWeight(1);
    line(x1, xY, x2, xY);
    line(yX, y1, yX, y2);
  }
  
}
