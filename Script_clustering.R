# Script clustering

set.seed(123)

library(umap)

somaPH_log_diffHCNoPH_umap<-umap(somaPH_log_diffHCNoPH)


library(NbClust)

nbPH_diffHCNoPH<- NbClust (somaPH_log_diffHCNoPH_umap$layout, distance="euclidean", min.nc=2, max.nc=10, method= "kmeans")


#*** : The Hubert index is a graphical method of determining the number of clusters.
#In the plot of Hubert index, we seek a significant knee that corresponds to a 
#significant increase of the value of the measure i.e the significant peak in Hubert
#index second differences plot. 

#*** : The D index is a graphical method of determining the number of clusters. 
#In the plot of D index, we seek a significant knee (the significant peak in Dindex
# second differences plot) that corresponds to a significant increase of the value of
#the measure. 

#******************************************************************* 
#  * Among all indices:                                                
#  * 5 proposed 2 as the best number of clusters 
# * 4 proposed 3 as the best number of clusters 
# * 6 proposed 4 as the best number of clusters 
# * 1 proposed 5 as the best number of clusters 
# * 4 proposed 6 as the best number of clusters 
# * 2 proposed 8 as the best number of clusters 
# * 1 proposed 9 as the best number of clusters 

# ***** Conclusion *****                            
  
#  * According to the majority rule, the best number of clusters is  4 


nbPH_diffHCNoPH$Allindex


nbPH_diffHCNoPH$Best.nc


nbPH_diffHCNoPH$All.CriticalValues

nbPH_diffHCNoPH$Best.partition

clusterumap_diffHCNoPH <- nbPH_diffHCNoPH$Best.partition
somaPH_log_diffHCNoPH_ID$Cluster_umap_diffHCNoPH <- clusterumap_diffHCNoPH

table(somaPH_log_diffHCNoPH_ID$Cluster_umap_diffHCNoPH)
# 1   2   3   4 
# 105 141  59 165 