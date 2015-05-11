#'  Get Center of  SpatialLines Object
#'  
#'  find the middle of each axis
#'  
#'  @param x A ggplot
#'  @return Named Vector of center coordinates
#'  
#' 
get_map_center<- function(x){
  center_lat<-mean(ggplot_build(x)$panel$ranges[[1]]$y.range)
  center_long<-mean(ggplot_build(x)$panel$ranges[[1]]$x.range)
  center<-c(lon=center_long,lat=center_lat)
  center
}


