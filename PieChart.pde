class PieChart  //declaring class
{
  //delcaring variables
  float centreX;
  float centreY;
  float radius;
  
  PieChart()  //constructor, initializing variables
  {
    centreX = width/2;
    centreY = height/2;
    radius = (float) width * 0.7;
  }
  
  //method for drawing pie chart, with parameters popYears of type ArrayList<PopData> and y of type int
  //y tells the method which PopData in the arraylist to display
  void drawPopPie(ArrayList<PopData> popYears, int y)
  {
    PopData year = popYears.get(y);  //gets the year at position y in the arraylist
    float sum = year.totalPop;  //stores the total population
    //both following for use with the arc
    float lastAngle = 0;
    float cumulative = 0;
    stroke(0);
    
    //adds the male population for the year to cumulative
    cumulative += year.malePop;
    //maps the cumulative from the range 0 to sum on to 0 to 2 pi and stores it as current
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    //the following lines establish the angle made by the current mouse position with the centre point of the pie chart
    float toMouseX = mouseX - centreX;
    float toMouseY = mouseY - centreY;  
    float angle = atan2(toMouseY, toMouseX);  
    //if angle goes below 0 map it back on to the range of pi to 2 pi
    if (angle < 0)
    {
      angle = map(angle, -PI, 0, PI, TWO_PI);
    }
    
    fill(0,100,255);
    //draw the arc using the lastAngle (0 for the first arc), and current values 
    arc(centreX, centreY, radius, radius, lastAngle, current);
    
    textAlign(CENTER);
    textSize(12);
    
    //if the mouse position makes and angle between the values used in the first arc
    //display the male population for the year
    if (angle > lastAngle && angle < current)
    {
      
      text("The male population for the year " + year.year + " is " + (int)year.malePop, width/2, height * 0.9);
    }
    
    lastAngle = current;  //make lastAngle equal to current
    cumulative += year.femPop;  //adds female population for the year to cumulative
    current = map(cumulative, 0, sum, 0, TWO_PI);  //repeats previous mapping function
    fill(255,105,180);
    arc(centreX, centreY, radius, radius, lastAngle, current);  //makes another arc from where the last one ended to the new value of current
    
    //if the mouse position makes and angle between the values used in the second arc
    //display the female population for the year
    if (angle > lastAngle && angle < current)
    {
      text("The female population for the year " + year.year + " is " + (int) year.femPop, width/2, height * 0.9);
    }
    
    fill(255);
    //displays headings for graph
    text("Pie Chart of Population Divided by Gender Census Data of Ireland in " + year.year, width/2, height*0.08f);
    text("Mouse over a section of the pie chart to see associated value", width/2, height *0.1f);
    text("The total population was " + (int)year.totalPop, width/2, height * 0.93);
  }
}
