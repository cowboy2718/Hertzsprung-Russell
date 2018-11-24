# Astronomy: Exploring Space and Time
# University of Arizona
# Fall 2018
# Created by Tony Gojanovic

#' McDonald Observatory Dataset Import
#' 
#' @description This function imports an Excel file based on the McDonald Observatory data set.
#' @details 
#' Note that the McDonald Observatory data set is an updated data set that includes right ascension, declination, spectral types and general notes.
#' Follow the instructions on the NOAA site for downloading the entire dataset to a tab delimited file.
#' Star data from tables B and C in the McDonald Observatory data set were used as the basis of this data set.
#' \url{https://mcdonaldobservatory.org/sites/default/files/pdfs/teachers/hrd.pdf}
#' @param filename Filename in the Excel format to be read. The file must be located in the working directory.
#' @import readxl
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

  #' Convert stellar temperatures to spectral types based on degrees Kelvin.
  #' 
  #' @description This function adds spectral types to a dataframe given a column of stellar temperatures.
  #' @details
  #' @param filename Filename is the data frame to be manipulated. 
  #' @import dplyr 
  #' @return Returns a data frame with spectral types.
  #' @note This function is generic and can be used to provide spectral types to any dataframe with a column of stellar temperatures in degrees Kelvin.
  #' @examples 
  #' \dontrun{
  #' library(dplyr)
  #' df<-spectral(filename) 
  #' 
  #' }  
  
  spectral<-function(filename){
  mcdonaldstars<-filename%>% mutate(spectral_type = ifelse(temp <=3500  & temp > 2000, "M", ifelse(temp <=4900 & temp >3500, "K",ifelse(temp <=6000 & temp > 4900,"G",ifelse(temp <=7400 & temp > 60000,"F",ifelse(temp  <=9900 & temp > 7400,"A",ifelse(temp<=28000 & temp > 9900, "B",ifelse(temp <=50000 & temp > 28000,"O","F"))))))))    

  }
  
  #' Simple Interactive H-R Diagram (McDonald Observatory Dataset)
  #'
  #' @description
  #' This function creates an interactive (theoretical) H-R diagram on a small dataset (n=55 stars) from McDonald Observatory.
  #' @return An interactive plot with stars of differing temperatures and absolute magnitudes.  Star postions are given as well in the dataset.
  #' @import ggplot2 dplyr plotly
  #' @note This graph is based on absolute magnitude and degrees Kelvin of the stars plotted.
  #' @examples 
  #' \dontrun{
  #' 
  #' # Use the dataframe name from the import routine.
  #' 
  #' library(dplyr)
  #' library(ggplot2)
  #' library(plotly)
  #' interactiveHR(filename) #Filename will be the imported McDonald Observatory Dataset.
  #' 
  #' }   
  #' 
  interactiveHR<-function(filename){
  
    
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
  
#' Hertzsprung-Russell Diagram (Yale Trigonometric Parallax Dataset)
#'   
  #' @description
  #' This function creates an observational H-R diagram on a dataset from the Yale Trigonometric Parallax Dataset.
  #' @return Returns a H-R plot based on absolute magnitude and color of stars.
  #' @import ggplot2 dplyr 
  #' @note The data comes from the R package GDAdata which must be installed.  It plots absolute magnitude by color index.
  #' @examples 
  #' \dontrun{
  #' 
  #' # Use the dataframe name from the import routine.
  #' 
  #' library(dplyr)
  #' library(ggplot2)
  #' install.packages("GDAdata")
  #' data(HRstars, package="GDAdata")
  #' yale_hr_diagram
  #' 
  #' }   
  #' 
 yale_hr_diagram<-function(){
  p2<-ggplot(HRstars,aes(BV,V))+geom_point(shape=16, size=.5,aes(color=BV))
  p2<-p2+scale_x_continuous(limits=c(-.5,2.5))+scale_y_reverse(breaks = seq(-24,24,by=2))
  p2<-p2+guides(color=F, alpha=F)+
    scale_alpha_continuous(range=c(0,1))+
    scale_color_gradientn(
      colours=c("blue","skyblue","white","orange","red"),
      limits= c(-.5,2.5))
  p2<-p2+ggtitle("Hertzprung Russell Diagram (Yale Trigonometric Parallax Dataset)")+xlab("Color Index B-V")+ylab("Abolute Magnitude")
  p2<-p2+annotate("text",x=0,y=15,label="White Dwarfs",size=4,hjust=0,vjust=0,color="white")+annotate("text",x=1.75,y=12,label="Main Sequence",size=4,hjust=0,vjust=0,color="white")+annotate("text",x=1.9,y=4,label="Giants",size=4,hjust=0,vjust=0,color="white")+annotate("text",x=2,y=-0,label="Supergiants",size=4,hjust=0,vjust=0,color="white")
  p2<-p2+theme(panel.background = element_rect(fill = "black"))+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p2 
  }