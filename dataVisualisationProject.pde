
ArrayList<FireData> years = new ArrayList<FireData>();

void setup()
{
  size(500, 500);
  loadData();
}

void loadData()
{
  String[] lines = loadStrings("fireData_T.txt");
  for (int i = 0; i < lines.length; i++){
    FireData fireData = new FireData(lines[i]);
    years.add(fireData);
  }
}

void drawCostBars()
{
  float gap = (float) width / years.size();
  float max = 0;
  for (FireData year : years)
  {
    println(year);
    if(year.totalCost > max)
    {
      max = year.totalCost;
    }
  }
  
  for (int i = 0; i < years.size(); i++)
  {
    FireData year = years.get(i);
    strokeWeight(1);
    stroke(year.colour);
    fill(year.colour);
    float x = i * gap;
    float y = map(year.totalCost, 0, max, 0, height);
    rect(x, height, gap, -y);
  }
}

void drawTotalAmtTrend()
{
  float gap = (float) width / (years.size() - 1);
  float max = Float.MIN_VALUE;
  for(FireData year : years)
  {
    if(year.totalAmt > max)
    {
      max = year.totalAmt;
    }
  }
  
  for(int i = 1; i < years.size(); i++)
  {
    FireData year = years.get(i);
    FireData prevYear = years.get(i-1);
    
    float x1 = i * gap;
    float x2 = (i - 1) * gap;
    float y1 = map(year.totalAmt, 0, max, 0, height);
    float y2 = map(prevYear.totalAmt, 0, max, 0, height);
    strokeWeight(1);
    stroke(255);
    line(x1, height - y1, x2, height - y2);
    stroke(255);
    strokeWeight(4);
    point(x1, height - y1);
  }
}

int which = 0;

void draw()
{
  background(0);
  if(keyPressed)
  {
    if (key == '0')
    {
      which = 0;
    }
    if (key == '1')
    {
      which = 1;
    }
  }
  if (which == 0)
  {
    drawCostBars();
  }
  else
  {
    drawTotalAmtTrend();
  }  
}
