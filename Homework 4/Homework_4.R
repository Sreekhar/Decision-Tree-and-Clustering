#ANSWER 1

#ENTERING THE GIVEN DATA AS MENTIONED IN THE QUESTION
XValues <- c(6, 19, 15, 11, 18, 9, 19, 18, 5, 4, 7, 21, 1, 1, 0, 5)
YValues <- c(12, 7, 4, 0, 12, 20, 22, 17, 11, 18, 15, 18, 19, 4, 9, 11)
TwoDdata <- data.frame(XValues, YValues)

Max_NumberOfClusters <- 4
Threshold_Theta <- 12

#CREATE A FUNCTION TO CALCULATE THE MINIMUM DISTANCE
MinDistance_WithCenter <- function(datapoints,centers,tempcluster)
{  
  #DECLARING THE VARIABLE WITH LENGTH 4 AS THE MAX NUMBER OF CLUSTERS IS 4
  #FIRST ELEMENT INITIALIZED TO 0 AND REMAINING ELEMENTS ARE OF HIGHER VALUES
  distance <- c(0,250,250,250)
  for(i in 1:tempcluster)
  {
    distance[i] <- sqrt((datapoints[1,1]-centers[i,1])^2+(datapoints[1,2]-centers[i,2])^2)
  }

  #CALCULATING MINIMUM DISTANCE
  MinDistance <- min(distance,na.rm = TRUE);
  #center calac
  Center_Element <- which(distance == MinDistance)
  Center_Element_Value <- centers[Center_Element,]
  MinDistance_WithCenter_Value <- c(MinDistance,as.matrix(Center_Element_Value))
  
  return(MinDistance_WithCenter_Value) 
}

#DECLARE THE VARIABLE FOR STORING CLUSTERS ALONG WITH THEIR CENTERS
Clusters_with_center <- data.frame(matrix(NA, nrow = 16, ncol = 5))

#START FROM THE FIRST DATA POINT TO THE LAST

#AS THE FIRST DATA POINT IS (6,12)
Clusters_with_center[1,] <- c(6,12,6,12,1)

Cluster_Center <- TwoDdata[1,] 
centers <- TwoDdata[1,]

tempcluster <- 1

for(i in  2 : nrow(TwoDdata)) 
{  
  datapoints <- TwoDdata[i,]
  
  MinDistance_WithCenter_Value <- MinDistance_WithCenter(datapoints,centers,tempcluster)
  if(MinDistance_WithCenter_Value[1]>Threshold_Theta && tempcluster < Max_NumberOfClusters)
  {
    tempcluster <- tempcluster + 1
    centers[tempcluster,] = datapoints 
    
    Cluster_Center[tempcluster]= 1
    Clusters_with_center[i,1] <- datapoints[1,1]
    Clusters_with_center[i,2] <- datapoints[1,2]
    Clusters_with_center[i,3] <- centers[tempcluster,1]
    Clusters_with_center[i,4] <- centers[tempcluster,2]
    Clusters_with_center[i,5] <- tempcluster
  } 
  else
  { 
    Clusters_with_center[i,1] <- datapoints[1,1]
    Clusters_with_center[i,2] <- datapoints[1,2]
    Clusters_with_center[i,3] <- MinDistance_WithCenter_Value[2]
    Clusters_with_center[i,4] <- MinDistance_WithCenter_Value[3]
    for(j in 1:tempcluster)
    {
      if(centers[j,1]==MinDistance_WithCenter_Value[2] && centers[j,2]== MinDistance_WithCenter_Value[3])
      {
        Clusters_with_center[i,5]=j
        a1=which(Clusters_with_center[,5]==j)
        temp_x=0
        temp_y=0
        for(temp_ce in a1)
        {
          temp_x =temp_x + Clusters_with_center[temp_ce,1]
          temp_y =temp_y + Clusters_with_center[temp_ce,2]
        }
        centers[j,1]=temp_x/length(a1)
        centers[j,2]=temp_y/length(a1)
      }
    }
  }
}

library(cluster)
ScaledData <- scale(TwoDdata)
clusplot(ScaledData, Clusters_with_center[,5], color=TRUE, shade=TRUE, labels=2, lines = 0,
         main = "Clustered plot")
###########################################

#REVERSING THE DATA AS MENTIONED IN THE QUESTION
XValues_Rev <- rev(XValues)
YValues_Rev <- rev(YValues)
TwoDdata_Rev = data.frame(XValues_Rev, YValues_Rev)

#DECLARE THE VARIABLE FOR STORING CLUSTERS ALONG WITH THEIR CENTERS
Clusters_with_center_Rev <- data.frame(matrix(NA, nrow = 16, ncol = 5))

#START FROM THE FIRST DATA POINT TO THE LAST (INITIAL VALUES ARE REVERSED)

#AS THE FIRST DATA POINT IS (5,11)
Clusters_with_center_Rev[1,] <- c(5,11,5,11,1)

Cluster_Center <- TwoDdata_Rev[1,] 
centers <- TwoDdata_Rev[1,]

tempcluster <- 1

for(i in  2 : nrow(TwoDdata_Rev)) 
{  
  datapoints <- TwoDdata_Rev[i,]
  
  MinDistance_WithCenter_Value <- MinDistance_WithCenter(datapoints,centers,tempcluster)
  if(MinDistance_WithCenter_Value[1]>Threshold_Theta && tempcluster < Max_NumberOfClusters)
  {
    tempcluster <- tempcluster + 1
    centers[tempcluster,] = datapoints 
    
    Cluster_Center[tempcluster]= 1
    Clusters_with_center_Rev[i,1] <- datapoints[1,1]
    Clusters_with_center_Rev[i,2] <- datapoints[1,2]
    Clusters_with_center_Rev[i,3] <- centers[tempcluster,1]
    Clusters_with_center_Rev[i,4] <- centers[tempcluster,2]
    Clusters_with_center_Rev[i,5] <- tempcluster
  } 
  else
  { 
    Clusters_with_center_Rev[i,1] <- datapoints[1,1]
    Clusters_with_center_Rev[i,2] <- datapoints[1,2]
    Clusters_with_center_Rev[i,3] <- MinDistance_WithCenter_Value[2]
    Clusters_with_center_Rev[i,4] <- MinDistance_WithCenter_Value[3]
    for(k in 1:tempcluster)
    {
      if(centers[k,1]==MinDistance_WithCenter_Value[2] && centers[k,2]==MinDistance_WithCenter_Value[3])
        Clusters_with_center_Rev[i,5]=k
    }
  }
}

library(cluster)
ScaledData_Rev <- scale(TwoDdata_Rev)
clusplot(ScaledData_Rev, Clusters_with_center_Rev[,5], color=TRUE, shade=TRUE, labels=2, lines = 0,
         main = "Clustered plot with data points in reversed order")
###########################################

library(fossil)
rand.index(Clusters_with_center[,5],Clusters_with_center_Rev[,5])
###########################################

#QUESTION 2.a

distance <- dist(TwoDdata)
Hierarchical_clust_single <- hclust(distance,method="single")
plot(Hierarchical_clust_single, main = "Hierarchical Clustering Dendrogram using single method")

clusters_single <- cutree(Hierarchical_clust_single, k = 3)
rect.hclust(Hierarchical_clust_single, k = 3, border = "green")

library(cluster)
clusplot(TwoDdata, clusters_single, main='2D representation of the Hierarchical Clustering',
         color=TRUE, shade=TRUE, lines=0, labels=2)

#QUESTION 2.b

distance <- dist(TwoDdata)
Hierarchical_clust_complete <- hclust(distance,method="complete")
plot(Hierarchical_clust_complete, main = "Hierarchical Clustering Dendrogram using complete method")

clusters_complete <- cutree(Hierarchical_clust_complete, k = 3)
rect.hclust(Hierarchical_clust_complete, k = 3, border = "red")

library(cluster)
clusplot(TwoDdata, clusters_complete, main='2D representation of the Hierarchical Clustering',
         color=TRUE, shade=TRUE, lines=0, labels=2)


#QUESTION 2.c

#Single linkage clustering
CentroidXValues_single <- array()
CentroidYValues_single <- array()

for(i in 1:3)
{
  CentroidXValues_single[i] <- sum(XValues[which(clusters_single==i)])/table(clusters_single)[i]
  CentroidYValues_single[i] <- sum(YValues[which(clusters_single==i)])/table(clusters_single)[i]
}

DistanceFunctionSingle <- function(x,y)
{
  x1 <- CentroidXValues_single[y]
  y1 <- CentroidYValues_single[y]
  x2 <- XValues[x]
  y2 <- YValues[x]
  return(sqrt((x1-x2)^2+(y1-y2)^2))
}

SSESingleArray <- array()
for(i in 1:3)
  SSESingleArray[i] <- sum(DistanceFunctionSingle(which(clusters_single==i),i))

SSESingle <- sum(SSESingleArray)

#Complete linkage clustering

CentroidXValues_complete <- array()
CentroidYValues_complete <- array()

for(i in 1:3)
{
  CentroidXValues_complete[i] <- sum(XValues[which(clusters_complete==i)])/table(clusters_complete)[i]
  CentroidYValues_complete[i] <- sum(YValues[which(clusters_complete==i)])/table(clusters_complete)[i]
}

DistanceFunctionComplete <- function(x,y)
{
  x1 <- CentroidXValues_complete[y]
  y1 <- CentroidYValues_complete[y]
  x2 <- XValues[x]
  y2 <- YValues[x]
  return(sqrt((x1-x2)^2+(y1-y2)^2))
}

SSECompleteArray <- array()
for(i in 1:3)
  SSECompleteArray[i] <- sum(DistanceFunctionComplete(which(clusters_complete==i),i))

SSEComplete <- sum(SSECompleteArray)

################################
#Single linkage clustering
#proximity matrix
proximity <- dist(distance,upper=TRUE,diag=TRUE)
proximity_matrix <- as.matrix(proximity)

#instance matrix for single linkage
instance_matrix_single <- matrix(nrow=length(XValues),ncol =length(YValues))

for(i in 1:length(XValues))
{  
  for(j in 1:length(YValues))
  {
    if(clusters_single[i] == clusters_single[j])
    {
      instance_matrix_single[i,j] <- 1
    }
    else
    {
      instance_matrix_single[i,j] <- 0
    }
  }
}

cor(c(instance_matrix_single),c(proximity_matrix))

#instance matrix for complete linkage
instance_matrix_complete <- matrix(nrow=length(XValues),ncol =length(YValues))


for(i in 1:length(XValues))
{  
  for(j in 1:length(YValues))
  {
    if(clusters_complete[i] == clusters_complete[j])
    {
      instance_matrix_complete[i,j] <- 1
    }
    else
    {
      instance_matrix_complete[i,j] <- 0
    }
  }
}

cor(c(instance_matrix_complete),c(proximity_matrix))

#####################
#3 Question
library(fpc)
OneDdata <- c(1, 3, 5, 6, 8, 11, 12, 13, 14, 15, 16, 22, 28, 32, 33, 34, 35, 36, 37, 42, 58)
DBScan_E4 <- dbscan(OneDdata, eps=4, MinPts = 3, scale=FALSE, showplot=1)
plot(OneDdata,col = DBScan_E4$cluster+2L)
stripchart(OneDdata)

DBScan_E6 <- dbscan(OneDdata, eps=6, MinPts = 3, scale=FALSE, showplot=1)
plot(OneDdata,col = DBScan_E6$cluster+2L)
stripchart(OneDdata)

library(fossil)
rand.index(DBScan_E4$cluster,DBScan_E6$cluster)