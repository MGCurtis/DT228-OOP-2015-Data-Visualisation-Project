class BarGraph extends Graph
{
  BarGraph()
  {
    super();
  }
  
  void drawCostBars(ArrayList <FireData> years)
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
}
