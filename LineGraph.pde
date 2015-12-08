class LineGraph extends Graph  //declaring the class and inheriting from the superclass Graph
{
  LineGraph()
  {
    super();  //calling everything called in the superclasses constructor
  }
  
  //method for drawing line/trend graph
  void drawTotalPopTrend(ArrayList<PopData> popYears)
  {
    float gap = (float) (width - (2 * border)) / (popYears.size() - 1);  //variable to store the gap between each point
    float max = Float.MIN_VALUE;   //variable to store the maximum value
    for(PopData year : popYears)
    {
      if(year.totalPop > max)
      {
        max = year.totalPop;
      }
    }
    
    for(int i = 1; i < popYears.size(); i++)
    {
      PopData year = popYears.get(i);
      PopData prevYear = popYears.get(i-1);
      
      float x1 = i * gap + border;  //makes x1 the value of gap times the number the for loop is currently on
      float x2 = (i - 1) * gap + border;  //makes x2 the value of gap times the number before the one the for loop is currently
      //mapping the total population values from the range of 0 to the max value on to the range 0 to the top of the graph as y1 and y2
      float y1 = map(year.totalPop, 0, max, 0, height - border);
      float y2 = map(prevYear.totalPop, 0, max, 0, height - border);
      strokeWeight(1);
      stroke(255);
      line(x1, height - y1, x2, height - y2); //drawing the line
      stroke(255);
      strokeWeight(4);
      point(x1, height - y1); //drawing a point at each x1
      
      textSize(12);
      textAlign(CENTER);
      
      
      if(i == 1) //if on the first iteration
      {
        if(mouseX <= border && mouseX >= border - gap)  //if the mouse is between the border and one gap value before the border
                                                        //display the first year down the bottom and the first population along the side
        {
          PopData first = popYears.get(0);
          ellipse(x2, height - y2, (width * 0.01f), (height * 0.01f));
          text("Year: " + prevYear.year , x2, height - border + (height * 0.05));
          text("Population: ", border - (width * 0.06) , height - y1);
          text((int)prevYear.totalPop, border - (width * 0.06), height - y1 + (height * 0.05));
        }
      }
      
      //if the mouse is before x1 and after x2 display the year, down the bottom, and population, on the side, for the year of x1
      if(mouseX <= x1 && mouseX >= x2)
      {
        line(x1, height - y1, border, height - y1);
        ellipse(x1, height - y1, (width * 0.01f), (height * 0.01f));
        text("Year: " + year.year, x1, height - border + (height * 0.05));
        text("Population:   ", border - (width * 0.06) , height - y1);
        text((int)year.totalPop, border - (width * 0.06), height - y1 + (height * 0.05));
      }
    }
    fill(255);
    textAlign(CENTER);
    text("Line Graph of Total Population Census Data in Ireland 1926 - 2011", width/2, height*0.08f);  //displays heading for the graph
  }
}
