library(tidyverse)
library(dplyr)
library(readr)
library(janitor)
library(ggplot2)
library(dplyr)
library(stringr)

#Inventory data load
data = ("https://raw.githubusercontent.com/japhet125/Data_Science_605_Hws/refs/heads/main/inventory.csv")
inventory_data = read.csv(data)
inventory_data
#Demand data load
data2 = ("https://raw.githubusercontent.com/japhet125/Data_Science_605_Hws/refs/heads/main/demand.csv")
inventory_data2 = read.csv(data2)
inventory_data2
#Tasks

#Part A: Inventory Analysis

#Using vector operations:
inventory_data$Region1
inventory_data$Region2
inventory_data$Region3

#  Calculate total inventory available in each region.
total_inventory <- c(
  sum(inventory_data$Region1),
  sum(inventory_data$Region2),
  sum(inventory_data$Region3)
)
total_inventory

#Calculate inventory surplus or shortage relative to demand.
region1 <- sum(inventory_data$Region1) - inventory_data2$Demand[1]
region1
region2 <- sum(inventory_data$Region2) - inventory_data2$Demand[2]
region2
region3 <- sum(inventory_data$Region3) - inventory_data2$Demand[3]
region3

# we could also use this vector operation R
surplus_shortage <- total_inventory - inventory_data2$Demand
surplus_shortage

#Identify which region is most at risk of stock shortages.
surplus_shortage <- min(total_inventory - inventory_data2$Demand)
surplus_shortage

#Interpret the business implications.
##Region 3 has the greatest risk of an inventory shortage because its available 
##an inability to fulfill customer orders. The company should consider reallocating
##inventory from regions with larger surpluses to Region 3 or
##increasing future inventory shipments to Region 3.


