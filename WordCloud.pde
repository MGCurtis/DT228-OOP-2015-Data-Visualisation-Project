class WordCloud  //class for the WordCloud graph
{
  //declaring variables
  float textX, textY;
  int textSize;
  
  WordCloud()  //constructor
  {
  }
  
  //method for drawing word cloud, takes parameter of type ArrayList<PopData>
  void drawWordCloud(ArrayList<PopData> popYears)
  {
    float xGap = 3.0f;  //variable for space on the x axis between values
    float yGap = 23.6f;  //variable for space on the y axis between lines of values
    int count = 1;  //used to count what line it's on
    float posX = width * 0.2f;  //declares starting x position
    float posY = width * 0.4f;  //declares starting y position
    float max = Float.MIN_VALUE;  //for storing max value
    float min = Float.MAX_VALUE;  //for storing min value
    for(PopData year : popYears)  //loops through array, find max value
    {
      if(year.totalPop > max)
      {
        max = year.totalPop;
      }
    }
    
    for(PopData year : popYears)  //loops through array, find min value
    {
      if(year.totalPop < min)
      {
        min = year.totalPop;
      }
    }
    
    //for loop to work through arraylist
    for(int i = 0; i < popYears.size(); i++)
    {
      PopData year = popYears.get(i);  //current element in array
      int popText = (int)year.year;  //year of current element, to be displayed
      float popTotal = year.totalPop;  //population of that year
      int wcTextSize = (int) map(popTotal, min, max, 12, 60);  //maps population for the year from range from min to max on to range from 12 to 60, for text size
      
      fill(year.red + 60, year.green + 60, year.blue + 60);
      textSize(wcTextSize);  //declaring text size for current element
      textAlign(CENTER);
      text(popText, posX, posY);  //prints current value
      
      //if on first line
      if(count == 1)
      {
        //if statement to see if mouse is over an element
        if(mouseX < posX + (xGap*6) && mouseX > posX - (xGap*6) && mouseY < posY + (yGap - 26) && mouseY > posY - (yGap))
        {
          textSize(12);
          //prints total population for that year
          text("Total population for the year " + year.year + " was " + year.totalPop, width/2, height * 0.14f);
        }
      }
      //if on second line
      else if(count == 2)
      {
        //if statement to see if mouse is over an element
        if(mouseX < posX + (xGap*14) && mouseX > posX - (xGap*14) && mouseY < posY + (yGap-26) && mouseY > posY - (yGap))
        {
          textSize(12);
          //prints total population for that year
          text("Total population for the year " + year.year + " was " + year.totalPop, width/2, height * 0.14f);
        }
      }
      //otherwise, i.e. on third line
      else
      {
        //if statement to see if mouse is over an element
        if(mouseX < posX + (xGap*20) && mouseX > posX - (xGap*20) && mouseY < posY + (yGap-26) && mouseY > posY - (yGap+26))
        {
          textSize(12);
          //prints total population for that year
          text("Total population for the year " + year.year + " was " + year.totalPop, width/2, height * 0.14f);
        }
      }
      
      //adds xgap * text size, so bigger years get more space
      posX += xGap * wcTextSize;
      //if posX is past width x 0.9 drop a line and reset to start of x and increase count
      if(posX >= width * 0.9)
      {

        posX = width * 0.2f;
        posY += yGap * count;
        count ++;
      }
      
      

        
    }
    textSize(12);
    fill(255);
    //display headings
    text("Word Cloud of Total Population Census Data in Ireland 1926 - 2011", width/2, height * 0.08f);
    text("Size corresponds to total population for the year", width/2, height * 0.11f);
    text("Hover over a year to see the population for the year", width/2, height * 0.9);
  }
}
