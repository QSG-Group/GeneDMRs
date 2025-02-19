% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Methmean_match.R
\name{Methmean_site}
\alias{Methmean_site}
\title{Calculate the methylation mean for cytosine sites.}
\usage{
Methmean_site(inputmethfile_QC)
}
\arguments{
\item{inputmethfile_QC}{refers to the input of methylation file after quality control.}
}
\value{
Outputs a data frame of the methylation mean of provided cytosine sites.
}
\description{
This function outputs the methylation mean for each cytosine site. It will calculate methylation difference along each group. 

Formula:The mean methylation of a cytosine of one treatment group was calculated by: 
E((E[MR]_i )/(E[TR]_i ))*W_i and W_i =  (E[TR]_i )/(EE[TR]_i ), 
where [MR]_i and [TR]_i are methylated and total reads number of the CpG, 
n is the total individual number of one treatment group, and 
W_i is the weight of reads of the CpG of individual i.
}
\examples{
siteall <- Methmean_site(inputmethfile_QC)

}
