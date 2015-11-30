class Graph
{
  float border;
  float x1, x2, xY, y1, y2, yX;
  
  Graph()
  {
    border = (float) width * 0.1f;
    x1 = border - (width * 0.02f);
    x2 = width - border;
    xY = height - border + 1;
    y1 = border;
    y2 = height - border + (width * 0.02f);
    yX = border - (border * 0.01f);
  }
  
  void drawAxes()
  {
    stroke(255);
    line(x1, xY, x2, xY);
    line(yX, y1, yX, y2);
  }
  
}
