# DT228-OOP-2015-Data-Visualisation-Project
Data visualisation project for my Object Oriented Programming class in 2015.
In this project I intend to take a dataset of information relating to the emergency fire services of Ireland between the years 1996 and 2011
and represent that data visually using multiple different types of data visualisation, eg bar charts, trend graphs etc.

I altered the scope of my project so instead of using a dataset of information relating to the emergency fire services it now works off of a dataset
of census information of Ireland. The graphs used are a bar graph, line graph, pie chart, and a word cloud.

	WRITE UP:
To start with on this project I made a BarGraph class with the appropriate fields and methods to be used in the draw method to draw the graph. This method takes a parameter of type ArrayList<PopData>. I also made a class for the dataset with the appropriate fields for each type of date being read in from the dataset. In this class is also a constructor that takes in the data and separates it based on where there are tabs, which are what separate the different data types (year, total population, etc).
	In the main tab I wrote a method to load in the dataset and store each line of it in an arraylist of the type of the class I'd made for the dataset. Then I started to make a class for a line graph and realised I could use inheritance from a super class to save me having to repeat some of my code, so I made a class called Graph that the LineGraph and BarGraph classes inherit (extend) from. In this are the variables and methods used to draw the axes for the graphs, as the axes are the same for each graph.
	After that I went back to writing my LineGraph class, which was quite similar to my BarGraph class and truthfully I could likely include more than just the axes related methods and fields but I felt due to time constraints it was wiser just to keep going rather than refactor further and risk breaking parts of it.
	Then I wrote PieChart class. This didn’t extend the Graph super class as it didn’t need the axes. The method to draw the pie chart takes a parameter of type ArrayList<PopData>. The pie chart gave me some trouble as I didn’t remember quite how to use the variables to draw it, but after having a look at the processing reference site I got it working.
	Finally I decided to try and make a word cloud for a graph of my own type. For this I made a WordCloud class. The way this works is it takes in a parameter of type ArrayList<PopData> like the others and functions the same way of reading it in through a for loop. But instead of plotting points relating to the values of the population for the year the value actually gets mapped into a range of 12 – 60 to be used as the text size, so the larger the population size for a year the bigger it will be when printed to the screen.
	The position is decided by applying a base xGap value multiplied by the text size so that the bigger years get more space. The gap for between the rows is done by multiplying a base yGap value by the count, which starts at 1 and increases with each line (so on line 1 count = 1, line 2 count = 2 etc). This is similarly to ensure that as the numbers get bigger as they go on there is more vertical space to accommodate the increasing text size.
	I went back to my bar graph at this point and made it so that it displayed the total population for the year at the bottom, then the male population in a slightly lighter shade on top of that, and then the female population for the year in a lighter shade again on top of the male population.
	With all of that finished I retooled some things in the graphs to make them a bit nicer. Hovering over the points on the line graph, sections of the pie chart, and years in the word count displayed the associated population values. The bar graph has the same function it will detect what bar you’re on and also what section you’re on then display the total, male or female population for the year depending.
	After getting all of the graphs to work as I wanted, except the pie graph which was missing one bit of functionality, I put in buttons, using the controlP5 libraries, up the top of the screen that allow you to select which graph to view. I was previously navigating between the graphs by using the keyboard but having to display all of the instructions would have taken up a lot of space and buttons seemed more user friendly.
	Once those buttons were implemented I tried to put in a slider using the same libraries that would allow you to select the year to display a pie chart for. This proved a bit too complicated as I tried to have it only display when the pie chart was selected. The problem was having it in the draw method caused it to always be the default value. To work around this I changed the slider out for buttons down the right side of the screen, one for each year. I was also unable to make these only display when the pie chart was selected so I just printed out instructions above the buttons to state that they only effected the pie chart. It only occurred to me after I had this all done that I could have saved some space by having the slider always displayed along with instructions instead of the buttons but I was again discouraged by the time constraints from further toying with the program.

	


Screenshots:
Starting screen



Bar Graph

Hovering over a section displays the corresponding total, male, or female population.


Line Graph

Hovering between the x values of 2 points on the line displays the population values of the point ahead of the mouse.


Pie Chart

The pink text changes between pink and showing the female population and blue and showing the male population depending on which arc the mouse is between the angles of. The buttons on the side allow the user to select the year to be displayed.


Word Cloud

Hovering over a year displays the population value for that year.
