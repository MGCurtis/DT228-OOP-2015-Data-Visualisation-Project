void setup()
{
  size(500, 500);
}

//ArrayList<ArrayList<Float>> data = new ArrayList<ArrayList<Float>>();

/*void loadData()
 {
 String[] lines = loadStrings("fireAmt.txt");
 
 for(String s : lines)
 {
 String[] elements = s.split(",");
 ArrayList<Float> lineData = new ArrayList<Float>();
 
 for (int i = 0 ; i < elements.length ; i ++)
 {
 lineData.add(Float.parseFloat(elements[i]));
 }
 //data.add(lineData);
 }
 }*/

void trendLineGraph(ArrayList<Float> data, String title)
{
  background(0);
  float border = width * 0.1f;
  // Print the text 
  textAlign(CENTER, CENTER);   
  float textY = (border * 0.5f); 
  text("Fire Service Data 1996 - 2012", width * 0.5f, textY);

  drawAxis(data, 8, 10, 38000, border);   
  float windowRange = (width - (border * 2.0f));
  float dataRange = 38000;      
  float lineWidth =  windowRange / (float) (data.size() - 1) ;

  stroke(0, 255, 255);
  for (int i = 1; i < data.size (); i ++)
  {
    float x1 = map(i - 1, 0, data.size(), border, border + windowRange);
    float x2 = map(i, 0, data.size(), border, border + windowRange);
    float y1 = map(data.get(i - 1), 20000, dataRange, height - border, (height - border) - windowRange);
    float y2 = map(data.get(i), 20000, dataRange, height - border, (height - border) - windowRange);
    line(x1, y1, x2, y2);
  }
}

void drawAxis(ArrayList<Float> data, int horizIntervals, int vertIntervals, float vertDataRange, float border)
{
  stroke(200);
  fill(200);  

  line(border, height - border, width - border, height - border);

  float windowRange = (width - (border * 2.0f));  
  float tickSize = border * 0.1f;

  for (int i = 0; i <= horizIntervals; i ++)
  {   
    float x = map(i, 0, horizIntervals, border, border + windowRange);
    line(x, height - (border - tickSize)
      , x, (height - border));    

    textAlign(CENTER, CENTER);   
    float textY = height - (border * 0.5f); 
    text((int) map(i, 0, horizIntervals, 1996, 2012), x, textY);
  } 

  line(border, border, border, height - border);

  for (int i = 0; i <= vertIntervals; i ++)
  {
    float y = map(i, 0, vertIntervals, height - border, border);
    line(border - tickSize, y, border, y);
    float hAxisLabel = map(i, 0, vertIntervals, 20000, vertDataRange);

    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
}

void draw()
{
  String[] lines = loadStrings("fireAmt.txt");
  ArrayList<Float> lineData = new ArrayList<Float>();
  for (String s : lines)
  {
    String[] elements = s.split("\n");


    for (int i = 0; i < elements.length; i ++)
    {
      lineData.add(Float.parseFloat(elements[i]));
    }
  }
  trendLineGraph(lineData, "1996");
}

