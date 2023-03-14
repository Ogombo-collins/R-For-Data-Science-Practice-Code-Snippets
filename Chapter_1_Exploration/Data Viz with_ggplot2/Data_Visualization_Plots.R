library(tidyverse)
#---First Visualization---- 
library(ggplot2)
#--Key Questions to Answer:
#--1) Do cars with big engines use more fuel than cars with small engines?
#--2) What does the relationship between engine size and fuel efficiency look like? 
#Is it linear? Positive?Negative? Non-linear?

#---Key Assumption
#--a)A car with a low fuel efficiency consumes more fuel than a car with a high fuel efficiency when they travel the same distance.

#-- Step 1: Load mpg dataset from the ggplot2 package.
#The mpg dataset describes observations collected by the US Environment Protection Agency on (38) car_models  

cars_dataset <- ggplot2::mpg
cars_dataset

#Two key variables from the dataset determining fuel efficiency are: displ and hwy
#dsipl: car's engine size, in liters
#hwy: a car's fuel efficiency on the highway, in miles per gallon(mpg).

#-- Step2: Create a plot to answer our  questions; a point(scatter plot) would be appropriate
cars_dataset_plot <- ggplot(data = cars_dataset, mapping = aes(x = displ, y = hwy))+
  geom_point()

#-- Step 3: Display the plot saved as variable
cars_dataset_plot
#Plot shows negative relationship between dsipl(engine size) and hwy(fuel efficiency)
#In a nutshell, cars with big engines use more fuel.

cars_dataset
#Exercises: other plots from cars_dataset
#Quiz 1: Make a scatter plot of hwy versus cyl.
plot1 <- cars_dataset %>% 
  ggplot(mapping = aes(x =cyl, y = hwy)) +
  geom_point()
plot1 #The plot shows no relationship between number of cylinders and fuel efficiency

plot2 <-  cars_dataset %>% 
  ggplot(mapping = aes(x =model, y = hwy)) +
  geom_col()
plot2

#Adjusting elements in our cars_dataset_plot
cars_dataset_plot
cars_dataset_plot <- ggplot(data = cars_dataset, mapping = aes(x = displ, y = hwy, color = class, size = 5))+
  geom_point()
cars_dataset_plot #Three outliers belonging to SUV class

cars_dataset_plot2 <- ggplot(data = cars_dataset, mapping = aes(x = displ, y = hwy, alpha= class))+
  geom_point()
cars_dataset_plot2

#Manually setting aesthetics of our plot
Cars_dataset_plot3 <-ggplot(data = cars_dataset, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
Cars_dataset_plot3


## -- Facets --

#Facets are subplots that display subsets of data.
#They split your plot into subplots. Quite useful for categorical data
#To facet your plot by a single variable, use facet_wrap(). 
#The first argument of facet_wrap() should be a formula, you create with ~ followed by a variable name(single variable only)
#The variable that you pass to facet_wrap() should be discrete.

cars_facet_plot1 <- ggplot(cars_dataset, aes(x = displ, y = hwy)) +
  geom_point()+
  facet_wrap(~class, nrow = 2)
cars_facet_plot1  
  
#facet_grid allows us facet combination of two variables
#The formula should contain two variable names separated by a ~

cars_facet_grid_plot <- ggplot(cars_dataset, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl)
cars_facet_grid_plot

## -- Geometric Objects --

#A geom is the geometrical object that a plot uses to represent data
#Plots are described by the type of geom the plot uses;bar, scatter, line etc
#To change the geom in your plot, change the geom function that you add to ggplot().

#Example of multiple geom objects in the same plot
geom_multiple <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
geom_multiple

#If you place mappings in a geom function, ggplot2 will treat them as local mappings for the layer.
#It will use these mappings to extend or overwrite the global mappings for that layer only

geom_multiple2 <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()
geom_multiple2


## -- Statistical Transformations ---

# 1) Bar Graphs
 ggplot2::diamonds

#Let's build a bar chart using diamond's dataset
 bar_plot <- ggplot(data = diamonds, mapping = aes(x=cut)) +
   geom_bar()
bar_plot 

# 2) Customizing Bar Graphs
#Involves adding elements such as color and fill

bar_plot <- ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity)) +
  geom_bar()
bar_plot

bar_plot2 <- ggplot(data = diamonds, mapping = aes(x=cut, color = cut)) +
  geom_bar()
bar_plot2

#Let's use position adjustments
# a)Identity position
bar_plot3 <- ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity)) +
  geom_bar(alpha = 0.5, position = "identity") 
bar_plot3
#The identity position adjustment is more useful for 2D geoms,like points, where it is the default.

# b) fill position
bar_plot4 <- ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity)) +
  geom_bar(position = "fill")
bar_plot4
#fill position enables one to compare proportions across groups

# c) dodge position
bar_plot5 <- ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity)) +
  geom_bar(position = "dodge")
bar_plot5
#dodge position enables one compare individual values