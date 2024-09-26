#https://swcarpentry.github.io/r-novice-inflammation/02-func-R.html

#Function Components
#1. name | environment _ the “map” of the location of the function’s variables.
#2. formals | arguments | Parameters _ These are the values or variables that the function takes in. 
#                                       They are used to provide data that the function will process.
#3. body _ the code inside the function.


#User-Defined Functions
#Defining a Function
my_first_function <- function() {
  print("Hello World!")
}
my_first_function()   # call the function named my_function


#Arguments
#Information can be passed into functions as arguments.
#Arguments are specified after the function name, inside the parentheses. 
#You can add as many arguments as you want, just separate them with a comma.
#The following example has a function with one argument (fname). 
#When the function is called, we pass along a first name, 
#which is used inside the function to print the full name:
my_second_function <- function(fname) {
  paste("Hello,", fname)
}
my_second_function("Shaka")

#number of arguments
my_arguments_function <- function(fname, lname) {
  paste(fname, lname)
}
my_arguments_function("Shaka", "Zulu")


#Calling a Function with Default Argument
new.function <- function(a = 3, b = 6) {
  result <- a * b
  print(result)
}

# Call the function without giving any argument.
new.function()

# Call the function with giving new values of the argument.
new.function(9,5)




fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)   #return statement:to send a result back to whoever asked for it.
  }

#Calling a function
fahrenheit_to_celsius(212)

#In R, it is not necessary to include the return statement. 
#R automatically returns whichever variable is on the last 
#line of the body of the function. 
#While in the learning phase, we will explicitly define the return statement.


#Let’s try running our function. 
#Calling our own function is no different from calling any other function:
# freezing point of water
fahrenheit_to_celsius(32)

# boiling point of water
fahrenheit_to_celsius(212)



#Now that we’ve seen how to turn Fahrenheit into Celsius, 
#we can also turn Celsius into Kelvin:
celsius_to_kelvin <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}
celsius_to_kelvin(0)


#Exercise:Create a Function
#If the variable v refers to a vector, 
#then v[1] is the vector’s first element and 
#v[length(v)] is its last 
#(the function length returns the number of elements in a vector). 
#Write a function called edges,
#that returns a vector made up of just the first and last elements of its input:
#THE ANSWER:
edges <- function(v) {
  first <- v[1]
  last <- v[length(v)]
  answer <- c(first, last)
  return(answer)
}
dry_principle <- c("Don't", "repeat", "yourself", "or", "others")
edges(dry_principle)



#TWO WAYS NESTED FUNCTIONS
#Composing Functions
#function composition
#1_The immediate application of one function to the result of another, such as f(g(x)).
fahrenheit_to_kelvin <- function(temp_F) {
  temp_C <- fahrenheit_to_celsius(temp_F)
  temp_K <- celsius_to_kelvin(temp_C)
  return(temp_K)
}
# freezing point of water in Kelvin
fahrenheit_to_kelvin(32.0)

#This is our first taste of how larger programs are built: 
#we define basic operations, 
#then combine them in ever-larger chunks to get the effect we want. 
#Real-life functions will usually be larger than the ones shown here–typically 
#half a dozen to a few dozen lines–but they shouldn’t ever be much longer than that, 
#e next person who reads it won’t be able to understand what’s going on.




#2_Nesting Function Calls
#This example showed the output of fahrenheit_to_celsius assigned to temp_C, 
#which is then passed to celsius_to_kelvin to get the final result. 
#It is also possible to perform this calculation in one line of code, 
#by “nesting” one function call inside another, like so:
celsius_to_kelvin(fahrenheit_to_celsius(32.0)) #nesting function calls

#Here, we call fahrenheit_to_celsius to convert 32.0 from Fahrenheit to Celsius, 
#and immediately pass the value returned from fahrenheit_to_celsius to celsius_to_kelvin 
#to convert from Celsius to Kelvin. Our conversion from Fahrenheit to Kelvin is done, 
#all in one go!
#This is convenient, 
#but you should be careful not to nest too many function calls at once - 
#it can become confusing and difficult to read!



#NAMED VARIABLES AND THE SCOPE OF VARIABLES
#global variable:
#Variables that are created outside of a function are known as global variables.
##Global variables can be used by everyone, both inside of functions and outside.
input_1 <- 20   #global variable


#Functions can accept arguments explicitly assigned to a variable name in the 
#function call functionName(variable = value), as well as arguments by order:
mySum <- function(input_1, input_2 = 10) {       #used inside
  output <- input_1 + input_2
  return(output)
}
mySum(2,5)

txt <- "awesome"
my_inside_function <- function() {
  paste("R is", txt)          #used outside
}
my_inside_function()






#Q1.Given the above code was run, which value does mySum(input_1 = 1, 3) produce?
#answer=a
#4
#11
#23
#30
#Q2.If mySum(3) returns 13, why does mySum(input_2 = 3) return an error?
#answer=Read the error message: argument "input_1" is missing, 
#with no default means that no value for input_1 is provided in the function call,
#and neither in the function’s definition. Thus,
#the addition in the function body can not be completed.


#Documentation
#A common way to put documentation in software is to add comments like this:
mySum <- function(input_1, input_2 = 10) {
  # return a new vector containing the original data centered around the
  # midpoint.
  # Example: center(c(1, 2, 3), 0) => c(-1, 0, 1)
  output <- input_1 + input_2
  return(output)
}
#Writing Documentation
#Formal documentation for R functions is written in separate .Rd using a markup language similar to LaTeX. 
#You see the result of this documentation when you look at the help file for a 
#given function, e.g. ?read.csv. The roxygen2 package allows R coders to write 
#documentation alongside the function code and then process it into the appropriate
#.Rd files. You will want to switch to this more formal method of writing documentation 
#when you start writing more complicated R projects.

#InLine Functions
f = function(x) x^2*4+x/3
f(9)




new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}
new.function(10)





#Functions to Create Graphs
W#rite a function called analyze that takes a filename as an argument and displays 
#the three graphs produced in the previous lesson (average, min and max inflammation over time). 
#analyze("data/inflammation-01.csv") should produce the graphs already shown, 
#while analyze("data/inflammation-02.csv") should produce corresponding graphs for the second data set.
#Be sure to document your function with comments.
analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}
analyze("inflammation-01.csv")
analyze("inflammation-02.csv")



Sum.Series <- function(number)
{
  if(number == 0) {
    return (0)
  } else {
    return ((number * number ) + Sum.Series(number - 1))
  }
}
Sum.Series(4)






#Functions in R Packages
#The great majority of functions to perform these tasks are available in external 
#packages or libraries. Packages are collections of R functions, data, and compiled 
#code in a well-defined format created to add specific functionality. 
#Most of these packages can be used for free, and can be found in popular packages
#repositories, such as CRAN, which currently feature nearly 20,000 contributed packages. 
#To use the functions available in a package, you first will need to install it.
#For example, if you want to install dplyr, a popular package to work with regular expressions,
# you can use the following statement:

install.packages('dplyr')
library(dplyr)
ls("package:dplyr")     #list of functions
help(package = dplyr)  #explanation of functions
library(base)
?sum()    #Function documentation




#Exercise 2
#This code makes a list of all functions in the {base} package.
objs <- mget(ls("package:base", all = TRUE), inherits = TRUE)
funs <- Filter(is.function, objs)
#Use it to answer the following questions:
#a.  Which base function has the most arguments?
#b.  How many base functions have no arguments? What’s special about those functions?
#c.  How could you adapt the code to find all primitive functions?
#Answers
#a.  To find the function with the most arguments, we first compute the length of formals().
#    (Access to and Manipulation of the Formal Arguments)
library(purrr)
n_args <- funs %>% 
  map(formals) %>%
  map_int(length)
#Then we sort n_args in decreasing order and look at its first entries.
n_args %>% 
  sort(decreasing = TRUE) %>%
  head()
#> scan format.default source
#> 22 16 16
#> formatC library merge.data.frame
#> 15 13 13

#b.  We can further use n_args to find the number of functions with no arguments:
sum(n_args == 0)
#However, this over counts because formals() returns NULL for primitive functions, 
#and length(NULL) is 0. To fix this, we can first remove the primitive functions:
n_args2 <- funs %>% 
discard(is.primitive) %>% 
map(formals) %>%
map_int(length)
sum(n_args2 == 0)

#c.  To find all primitive functions, 
#we can change the predicate in Filter() from is.function() to is.primitive():
funs <- Filter(is.primitive, objs)
length(funs)



#testing a R function
#library(testthat)

#F_to_C <- function(F_temp){   #function
 # C_temp <- (F_temp - 32) * 5/9;
  #return(C_temp);
#}
#test_that(desc = "Fahrenheit to Celsius", code = {  # test
  
 
# temp_C <- F_to_C(50); # Runs the function
  
  # Test that the result is the correct value
 # expect_that( object = temp_C, condition = equals(10) );
  
  # Test that the result is numeric
  #expect_that( object = is.numeric(temp_C), condition = equals(TRUE) );
#})
