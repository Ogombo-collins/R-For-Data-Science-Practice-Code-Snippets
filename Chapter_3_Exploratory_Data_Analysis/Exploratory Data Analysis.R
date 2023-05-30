##-- Exploratory Data Analysis ----

#EDA is an iterative cycle that facilitates:
# a) Generation of questions about our data
# b) Obtain answers to our questions via visualizing, transforming, and modeling our data
# c) Utilize insights learnt to refine your questions and/or generate new questions

#Data cleaning relies on EDA. 
#To execute data cleaning, you'll need to deploy all the tools of EDA: visualization, transformation, and modeling

#The goal of EDA involves helping you understand your data.
#Questions act as tools to guide your data investigation.
#When you ask a question, the question focuses your attention on a specific part of your dataset.
#This  helps you decide which graphs, models, or transformations to make.
#Like a detective, quality and leading questions leads you to more discovery:
#thus enabling you piece specific insights and collate answers  related to a specific problem/crime you want to solve.

#Generally, there is no rule of thumb of which questions you will ask your data.
#Two types of questions will always be useful for making discoveries within your data include:
# 1) What type of variation occurs within my variables?
# 2) What type of covariation occurs between my variables?

library(tidyverse)

#---- Visualize Categorical Variable ----
ggplot2::diamonds
#Bar charts are used to examine the distribution of categorical variables.
#Using diamonds dataset, let's examine the distribution of values in cut variable
cut_barplot <- ggplot(data = diamonds, mapping = aes(x = cut)) +
  geom_bar()
cut_barplot
#Height of the bar corresponds to number of observations within each x_axis value
dplyr::count()
no_observations_cut <- diamonds %>% 
  count(cut) %>% 
  arrange()
no_observations_cut

# ---- Visualize Continuous Variable
#Histograms are ideal for examining the distribution of a continuous variable
carat_histogram <- ggplot(diamonds, mapping = aes(x = carat), binwidth = 0.5) +
  geom_histogram()
carat_histogram

#probing the distribution in terms of:
#where values are highly concentrated, why they are concentrated in one place, any unusual patterns is part of EDA

#--- Outliers ----
#Outliers are unusual observations present in a distribution.
#They do not fit the pattern of our data points.
#Sometimes they can be data entry errors or reveal important new science

#Using diamonds dataset's y variable(measures dimension of a diamond in mm), we can discover outliers
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))
#Three dimensions are outliers: 0, 30 and 60.
#They can be excluded(reasons stated for excluding) if they have minimal effect on results 

#-- Patterns and Modules ----
#Patterns in data provide clues about relationships.

#Key questions to ask if a pattern exists between variables:
#  Could this pattern be due to coincidence (i.e., random chance)?
#. How can you describe the relationship implied by the pattern?
# . How strong is the relationship implied by the pattern?
# . What other variables might affect the relationship?
# . Does the relationship change if you look at individual subgroups of the data?

#Models are a tool for extracting patterns out of data.

#---- Workflow Projects ----

