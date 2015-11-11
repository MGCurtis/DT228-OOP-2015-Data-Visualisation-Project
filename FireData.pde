class FireData
{
  float totalCost;
  float totalAmt;
  float totalAmtDomestic;
  float fatalities;
  color colour;
  
  FireData(String line)
  {
    String[] elements = line.split("\t");
    totalCost = Float.parseFloat(elements[0]);
    totalAmt = Float.parseFloat(elements[1]);
    totalAmtDomestic = Float.parseFloat(elements[2]);
    fatalities = Float.parseFloat(elements[3]);
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }
}
