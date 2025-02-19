% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Methmean_match.R
\name{Methmean_region}
\alias{Methmean_region}
\title{Calculate the methylation mean for regions.}
\usage{
Methmean_region(inputmethfile_QC, inputrefseqfile,
  cpgifeaturefile = NULL, chrnum = "all", posistart = NULL,
  posiend = NULL, featureid = NULL, featurename = NULL)
}
\arguments{
\item{inputmethfile_QC}{refers to the input of methylation file after quality control.}

\item{inputrefseqfile}{refers to the input file with regions e.g., inputrefseqfile/inputcpgifile with 4 columns or inputgenebodyfile/inputcpgifeaturefile with 5 columns.}

\item{cpgifeaturefile}{refers to the input of CpG island feature file e.g., inputcpgifeaturefile, with default NULL.
If provided, the output file is methylation mean of inputrefseqfile or inputgenebodyfile with CpG island and CpG island shore features.}

\item{chrnum}{refers to the chromosome number or all chromosomes (all) or all chromosomes with unannotated sites (alls), with default "all".}

\item{posistart}{refers to start position if requested, with default NULL.}

\item{posiend}{refers to end position if requested, with default NULL.}

\item{featureid}{refers to NCBI ID of specific gene or all the genes, with default NULL.
The CpG id can also be used like "cpgi1" or "shore2".}

\item{featurename}{refers to different gene body features of promoter, exon, intron and TSSes.
The CpG island  features can also be used that are "CpGisland" and "Shores".}
}
\value{
Outputs a data frame of the methylation mean of provided regions with/without different features.
}
\description{
This function outputs the methylation mean for different groups based on gene and CpG island regions by matching with cytosine. 
It is also for gene body of promoter, exon, intron and TSSes regions, cgpi feature of CpG island and CpG island shores and their interactive regions e.g., promoter CpG island.
}
\examples{
Methmean_region(inputmethfile_QC, inputrefseqfile, chrnum = "alls", featureid = c("NM_001244353", "NM_001244864")) # find sepecific gene by NCBI ID #

Methmean_region(inputmethfile_QC, inputrefseqfile, chrnum = "chr1", posistart = 21800, posiend = 21900)
regiongenechr <- Methmean_region(inputmethfile_QC, inputrefseqfile, chrnum = c("chr1","chr2"))
regiongeneall <- Methmean_region(inputmethfile_QC, inputrefseqfile, chrnum = "all")
DMC_regiongeneall <- Methmean_region(DMC_inputmethfile_QC, inputrefseqfile, chrnum = "all") # Calculate DMC first and then recalculate the methylation mean by replacing the RRBS cytosine sites #
regiongenealls <- Methmean_region(inputmethfile_QC, inputrefseqfile, chrnum = "alls") # alls include unannotated CpG site like chrUn_NW_018084826v1 #
Methmean_region(inputmethfile_QC,inputcpgifile,"chr1", 21800, 21900) # acturally regiongenepart = regioncpgpart #
regioncpgchr <- Methmean_region(inputmethfile_QC, inputcpgifile, chrnum = c("chr1","chr2"))
regioncpgall <- Methmean_region(inputmethfile_QC, inputcpgifile, chrnum = "all")
regioncpgalls <- Methmean_region(inputmethfile_QC, inputcpgifile)

regiongenebodychr <- Methmean_region(inputmethfile_QC, inputgenebodyfile, chrnum = c("chr1","chr2"))
regiongenebodyall <- Methmean_region(inputmethfile_QC, inputgenebodyfile, chrnum = "all")
regiongenebodyalls <- Methmean_region(inputmethfile_QC, inputgenebodyfile)
regioncpgifeaturechr <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, chrnum = c("chr1","chr2"))
regioncpgifeatureall <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, chrnum = "all")
regioncpgifeaturealls <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile)

partgenebody <- Methmean_region(inputmethfile_QC, inputgenebodyfile, featureid = "NM_001244353")
partgenebodyexon <- Methmean_region(inputmethfile_QC, inputgenebodyfile, featureid = "NM_001244353", featurename = "exons")
partgenebodyall <- Methmean_region(inputmethfile_QC, inputgenebodyfile, featureid = "NM_001244353", featurename = c("promoters","exons","introns","TSSes"))
genebodypromoterall <- Methmean_region(inputmethfile_QC, inputgenebodyfile, featureid = "all", featurename = "promoters")
genebodyexonall <- Methmean_region(inputmethfile_QC, inputgenebodyfile, featureid = "all", featurename = "exons") 
genefeatureall <- Methmean_region(inputmethfile_QC, inputgenebodyfile, featureid = "all", featurename = c("promoters","exons","introns","TSSes")) #long time #
partcpgi <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, featureid = "cpgi1")
partshore <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, featureid = "shore10")
cpgislandall <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, featureid = "all", featurename = "CpGisland")
cpgshoreall <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, featureid = "all", featurename = "Shores") #long time #
cpgfeatureall <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, featureid = "all", featurename = c("CpGisland", "Shores") #long time #

genebodychr_promoter <- Methmean_region(inputmethfile_QC, inputgenebodyfile, chrnum = "chr1", featureid = "all", featurename = "promoters")
cpgchr_island <- Methmean_region(inputmethfile_QC, inputcpgifeaturefile, chrnum = "chr1", featureid = "all", featurename = "CpGisland")

# when the cpgifeaturefile = inputcpgifeaturefile is provided # 
regiongenechr_cpgfeature <- Methmean_region(inputmethfile_QC, inputrefseqfile, cpgifeaturefile = inputcpgifeaturefile, chrnum = c("chr1","chr2"))
regiongeneall_cpgfeature <- Methmean_region(inputmethfile_QC, inputrefseqfile, cpgifeaturefile = inputcpgifeaturefile, chrnum = "all")
regiongenealls_cpgfeature <- Methmean_region(inputmethfile_QC, inputrefseqfile, cpgifeaturefile = inputcpgifeaturefile, chrnum = "alls")
genebodypromoterall_cpgfeature <- Methmean_region(inputmethfile_QC, inputgenebodyfile, cpgifeaturefile = inputcpgifeaturefile, featureid = "all", featurename = "promoters") 
genebodyexonall_cpgfeature <- Methmean_region(inputmethfile_QC, inputgenebodyfile, cpgifeaturefile = inputcpgifeaturefile, featureid = "all", featurename = "exons") 
genefeatureall_cpgfeature <- Methmean_region(inputmethfile_QC, inputgenebodyfile, cpgifeaturefile = inputcpgifeaturefile, featureid = "all", 
featurename = c("promoters","exons","introns","TSSes")) #long time #

# windows # 
windowfileall <- Methmean_region(inputmethfile_QC, windowfile, chrnum = "all")
windowfilealls <- Methmean_region(inputmethfile_QC, windowfile, chrnum = "alls")

}
