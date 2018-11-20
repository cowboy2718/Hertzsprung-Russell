# Astronomy: Exploring Space and Time
# University of Arizona
# Fall 2018
# Created by Tony Gojanovic

#' Interactive H-R Diagram Data Import
#' 
#' @description This function imports an Excel file based on the McDonald Observatory data set.
#' @details 
#' Note that the McDonald Observatory data set has been updated to include right ascension, declination, spectral types and general notes.
#' Follow the instructions on the NOAA site for downloading the entire dataset to a tab delimited file.
#' Star data from tables B and C in the McDonald Observatory data set were usized.
#' \url{https://mcdonaldobservatory.org/sites/default/files/pdfs/teachers/hrd.pdf}
#' @param filename Filename in the Excel format to be read. The file must be located in the working directory.
#' @importFrom readxl read_excel
#' @return Returns a data frame from an Excel file into a dataframd called "mcdonaldstars".
#' @note 
#' @examples 
#' # Downloaded mcdonaldstars.xlsx file to your working directory.
#' # Returns a dataframe with the default name "mcdonaldstar"
#' \dontrun{
#' 
#' library(readxl)
#' df<-import_mcdonald_data("mcdonaldstars.xlsx")
#' 
#' }

  import_mcdonald_data<-function(filename){
  mcdonaldstars <- read_excel(filename)
}

  
  #' Creating an Interactive H-R Diagram
  #'
  #' @description
  #' This function creates an interactive H-R diagram on a limited dataset from the McDonald Observatory.
  #' @return An interactive plot with stars of differing temperatures and absolute magnitudes.  Star postions are given as well in the dataset.
  #' @import ggplot2 dplyr 
  #' @note The routine also assigns spectral types to the McDonald data set.
  #' @examples 
  #' \dontrun{
  #' 
  #' # Use the dataframe name from the import routine.
  #' 
  #' library(dplyr)
  #' library(ggplot2)
  #' library(plotly)
  #' interactiveHR(filename)
  #' 
  #' }   
  #' 
  interactiveHR<-function(filename){
  
  mcdonaldstars<-filename  
  mcdonaldstars<-mcdonaldstars%>% mutate(spectral_type = ifelse(temp <=3500  & temp > 2000, "M", ifelse(temp <=4900 & temp >3500, "K",ifelse(temp <=6000 & temp > 4900,"G",ifelse(temp <=7400 & temp > 60000,"F",ifelse(temp  <=9900 & temp > 7400,"A",ifelse(temp<=28000 & temp > 9900, "B",ifelse(temp <=50000 & temp > 28000,"O","F"))))))))  
    
  p1<-ggplot(mcdonaldstars,aes(temp,absolute,label=star))+geom_point(aes(color=temp))
  p1<-p1+scale_x_reverse(breaks = seq(5000, 30000, by = 5000))+scale_y_reverse(breaks = seq(-10,20,by=2))
  p1<-p1+guides(color=F, alpha=F)+
    scale_alpha_continuous(range=c(0,1))+
    scale_color_gradientn(
      colours=c("red","skyblue","blue","white","white"),
      limits= c(1000,30000))
  p1<-p1+ggtitle("Simple H-R Diagram")+ylab("Absolute Magnitude")+xlab("Degrees Kelvin")
  p1<-p1+theme(panel.background = element_rect(fill = "black"))+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p1<-ggplotly(p1,tooltip = c("temp","star","absolute"))
  p1
  }
  