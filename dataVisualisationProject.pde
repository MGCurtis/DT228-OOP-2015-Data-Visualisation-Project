
import controlP5.*;  //importing controlP5 library

ControlP5 cp5;  //declaring a controlP5
ArrayList<PopData> popYears = new ArrayList<PopData>();  //declaring and initializing population Data arraylist

void setup()
{
  size(500, 500);
  loadPData();  //loading population data
  cp5 = new ControlP5(this);  //initializing controlP5
  
  textSize(12);
  
  //adding buttons to navigate graphs
  cp5.addButton("bargraph")
  .setPosition(width*0.15, height *0.005)
  .setSize(60, 15);
    
  cp5.addButton("linegraph")
  .setPosition(width*0.35, height *0.005)
  .setSize(60, 15);
  
  cp5.addButton("piechart")
  .setPosition(width*0.55, height *0.005)
  .setSize(60, 15);
  
  cp5.addButton("wordcloud")
  .setPosition(width*0.75, height *0.005)
  .setSize(60, 15);
  
  //adding buttons to select the year to be displayed in the pie chart
  cp5.addButton("year1")
  .setLabel("1926")
  .setPosition(width*0.9, height *0.2)
  .setSize(30, 15);
  
  cp5.addButton("year2")
  .setLabel("1936")
  .setPosition(width*0.9, height *0.233)
  .setSize(30, 15);
  
  cp5.addButton("year3")
  .setLabel("1946")
  .setPosition(width*0.9, height *0.266)
  .setSize(30, 15);
  
  cp5.addButton("year4")
  .setLabel("1951")
  .setPosition(width*0.9, height *0.3)
  .setSize(30, 15);
  
  cp5.addButton("year5")
  .setLabel("1961")
  .setPosition(width*0.9, height *0.333)
  .setSize(30, 15);
  
  cp5.addButton("year6")
  .setLabel("1966")
  .setPosition(width*0.9, height *0.366)
  .setSize(30, 15);
  
  cp5.addButton("year7")
  .setLabel("1971")
  .setPosition(width*0.9, height *0.4)
  .setSize(30, 15);
  
  cp5.addButton("year8")
  .setLabel("1979")
  .setPosition(width*0.9, height *0.433)
  .setSize(30, 15);
  
  cp5.addButton("year9")
  .setLabel("1981")
  .setPosition(width*0.9, height *0.466)
  .setSize(30, 15);
  
  cp5.addButton("year10")
  .setLabel("1986")
  .setPosition(width*0.9, height *0.5)
  .setSize(30, 15);
  
  cp5.addButton("year11")
  .setLabel("1991")
  .setPosition(width*0.9, height *0.533)
  .setSize(30, 15);
  
  cp5.addButton("year12")
  .setLabel("1996")
  .setPosition(width*0.9, height *0.566)
  .setSize(30, 15);
  
  cp5.addButton("year13")
  .setLabel("2002")
  .setPosition(width*0.9, height *0.6)
  .setSize(30, 15);
  
  cp5.addButton("year14")
  .setLabel("2006")
  .setPosition(width*0.9, height *0.633)
  .setSize(30, 15);
  
  cp5.addButton("year15")
  .setLabel("2011")
  .setPosition(width*0.9, height *0.666)
  .setSize(30, 15);
}

//method to load the population data
void loadPData()
{
  String[] lines = loadStrings("popData.txt");  //loads the popData.txt file into an array of strings, called lines, line by line
  for (int i = 0; i < lines.length; i++){  //for each line in the array lines make a new variable of type PopData and add it to the popData arraylist
    PopData popData = new PopData(lines[i]); 
    popYears.add(popData);
  }
}

//integers for selecting graphs and years
int whichGraph = 0;
int whichYear = 0;


void draw()
{
  background(0);
  textAlign(LEFT);
  textSize(10);
  text("Select", width*0.9, height * 0.12);
  text("year", width*0.9, height * 0.14);
  text("for pie", width*0.9, height * 0.16);
  text("chart:", width*0.9, height * 0.18);
  
  //if statements for seeing which graph should be displayed
  if (whichGraph == 1)
  {
    BarGraph barGraph = new BarGraph(); //delcaring and initializing barGraph of type BarGraph
    barGraph.drawAxes();  //calling the drawAxes method inherited from the Graph class
    barGraph.drawPopBars(popYears);  //calling the drawPopBars method with the arraylist popYears as the parameter
  }
  else if (whichGraph == 2)
  {
    LineGraph lineGraph = new LineGraph();  //delcaring and initializing barGraph of type BarGraph
    lineGraph.drawAxes();  //calling the drawAxes method inherited from the Graph class
    lineGraph.drawTotalPopTrend(popYears);  //calling the drawTotalPopTrend method with the arraylist popYears as the parameter
  }
  if (whichGraph == 3)
  {
    PieChart piechart = new PieChart();
    piechart.drawPopPie(popYears, whichYear);  //calling the drawPopPie method with the arraylist popYears and the integer whichYear as the parameters
  }
  if (whichGraph == 4)
  {
    WordCloud wordCloud = new WordCloud();
    wordCloud.drawWordCloud(popYears);  //calling the drawWordCloud method with the arraylist popYears as the parameter
    
  }
}


//controller for the buttons
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

//methods for the graph selecting buttons, each button assigns the whichGraph variable a different value
public void bargraph()
{
  whichGraph = 1;
}

public void linegraph()
{
  whichGraph = 2;
}

public void piechart()
{
  whichGraph = 3;
}

public void wordcloud()
{
  whichGraph = 4;
}

//methods for the year selecting buttons for the pie chart, each button assigns the whichYear variable a different value
public void year1()
{
  whichYear = 0;
}

public void year2()
{
  whichYear = 1;
}

public void year3()
{
  whichYear = 2;
}

public void year4()
{
  whichYear = 3;
}

public void year5()
{
  whichYear = 4;
}

public void year6()
{
  whichYear = 5;
}

public void year7()
{
  whichYear = 6;
}

public void year8()
{
  whichYear = 7;
}

public void year9()
{
  whichYear = 8;
}

public void year10()
{
  whichYear = 9;
}

public void year11()
{
  whichYear = 10;
}

public void year12()
{
  whichYear = 11;
}

public void year13()
{
  whichYear = 12;
}

public void year14()
{
  whichYear = 13;
}

public void year15()
{
  whichYear = 14;
}
