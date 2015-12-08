class PopData  //class for Population data
{
  //variables for storing different parts of of the population data
  int year;
  float totalPop;
  float malePop;
  float femPop;
  float red;
  float green;
  float blue;
  color c;
  
  PopData(String line)  //constructor, splits each line on a tab, which seperates the different types of data
                        //stores them in the appropriate variables
  {
    String[] elements = line.split("\t");
    year = Integer.parseInt(elements[0]);
    totalPop = Float.parseFloat(elements[1]);
    malePop = Float.parseFloat(elements[2]);
    femPop = Float.parseFloat(elements[3]);
    red = random(30, 155);
    green = random(30, 155);
    blue = random(30, 155);
    c = color(red, green, blue);
  }
}
