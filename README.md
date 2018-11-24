## Hertzsprung-Russell
R package to explore stellar evolution based on the Hertzsprung-Russell diagram
Tony Gojanovic  
November 2018  

### Background

This package provides tools for visual exploration of stellar data using the Hertzsprung-Russell diagram with two types of data sets.

### What is the Hertzsprung-Russell diagram

The Hertzsprung-Russell diagram, or H-R diagram, is a powerful tool classifying stars in order to understand the nature of stellar evolution.  More specifically, from Wikipedia, we have "The Hertzsprung–Russell diagram, abbreviated H–R diagram, HR diagram or HRD, is a scatter plot of stars showing the relationship between the stars' absolute magnitudes or luminosities versus their stellar classifications or effective temperatures. More simply, it plots each star on a graph measuring the star's brightness against its temperature (color). It does not map any locations of stars. The related colour–magnitude diagram (CMD) plots the apparent magnitudes of stars against their colour, usually for a cluster so that the stars are all at the same distance. The diagram was created circa 1910 by Ejnar Hertzsprung and Henry Norris Russell and represents a major step towards an understanding of stellar evolution."

For more information, see references below.

### Theoretical H-R Diagram

The following diagram is an example of a theoretical H-R diagram based on the McDonald Observatory data (n = 55 data points).  The example is not interactive, but the graphic produced by the R package is designed to interactive.

![Theoretical H-R Diagram](Theoretical.png)

### Observation H-R Diagram

The following diagram is an example of an observational H-R diagram based on the Yale Trigonometric Parallax Dataset (n=6220 data points).

![Observation H-R Diagram](Observational.png)

### Package Details

Specific details on the package HRDiagram may be obtained through the vignette files.  The vignette files show specific usage and syntax.

### Package Name and Location

To install this package and begin exploring stellar life, use devtools and the following:

```r
devtools::install_github('cowboy2718/HRDiagram')
library(HRDiagram)
```

### Travis Badge

The following indicates the status of the most recent build with Travis:

### References

The following are useful resources.

Audouze and Guy Israel, editors, *The Cambridge Atlas of Astronomy,* Third Edition, Cambridge University Press, 1996.

North, Gerald, *Astronomy Explained,* Springer, London, 1998.

[More info on H-R Diagrams from Wikipedia](https://en.wikipedia.org/wiki/Hertzsprung%E2%80%93Russell_diagram)


