class BarGraph extends Graph  //declaring the class and inheriting from the superclass Graph
{
  BarGraph()  //constructor
  {
    super();  //calling everything called in the superclasses constructor
  }
  
  //method to draw the bar graph, using the parameter popYears of type ArrayList<PopData>
  void drawPopBars(ArrayList<PopData> popYears)
  {
    float gap = (float) (width - (2*border)) / popYears.size(); //width of the bars
    float max = 0;  //used to store the maximum value
    //for each variable year of type PopData in popYears if the total population for the year
    //is greater than the value in max then store that value in max
    for (PopData year : popYears)
    {
      if(year.totalPop * 2 > max)
      {
        max = year.totalPop * 2;
      }
    }
    //for loop to iterate through the popYears arraylist
    for (int i = 0; i < popYears.size(); i++)
    {
      PopData year = popYears.get(i);  //makes a variable year of type PopData of the PopData variable in the current place of the for loop in the arraylist
      strokeWeight(1);
      //makes the stroke and fill to be the colour values stored in year, for the bottome sections of each bar
      stroke(year.c);
      fill(year.c);
      //makes the colours for the middle and top sections, each brighter than the one below
      color c2 = color(year.red + 50, year.green + 50, year.blue + 50);
      color c3 = color(year.red + 100, year.green + 100, year.blue + 100);
      //declaring the x and y's needed for each bar
      float x = i * gap;
      //maps the total, male, and female population from year from 0 to the max on to the range 0 to the top of the graph
      float y = map(year.totalPop, 0, max, 0, height - (2 * border));
      float y2 = map(year.malePop, 0, max, 0, height - (2 * border));
      float y3 = map(year.femPop, 0, max, 0, height - (2 * border));
      //drawing the sections of the bars
      rect(x + border, height - border, gap, -y);
      fill(c2);
      rect(x + border, height - border - y, gap, -y2);
      fill(c3);
      rect(x + border, height - border - y - y2, gap, -y3);
      
      textAlign(CENTER);
      textSize(12);
      
      //if the mouse is over a bar and over the bottom section of it display the total population for the year
      if(mouseX < x + border + gap && mouseX > x + border && mouseY > height - border - y && mouseY < height - border)
      {
        fill(year.c);
        text("The total population for the year " + year.year + " is: " + year.totalPop, width/2, height*0.09f);
      }
      //if the mouse is over a bar and over the middle section of it display the male population for the year
      if(mouseX < x + border + gap && mouseX > x + border && mouseY > height - border - y - y2 && mouseY < height - border - y)
      {
        fill(c2);
        text("The male population for the year " + year.year + " is: " + year.malePop, width/2, height*0.09f);
      }
      //if the mouse is over a bar and over the top section of it display the female population for the year
      if(mouseX < x + border + gap && mouseX > x + border && mouseY > height - border - y - y2 - y3 && mouseY < height - border - y - y2)
      {
        fill(c3);
        text("The female population for the year " + year.year + " is: " + year.femPop, width/2, height*0.09f);
      }
    }
    fill(255);
    
    text("Bar Graph of Total Population Census Data in Ireland 1926 - 2011", width/2, height*0.06f); //displays the heading for the graph
    
  }
}
