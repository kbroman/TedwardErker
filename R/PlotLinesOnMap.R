#'  Plot SpatialLines Object on Google Map
#'  
#'  plot fortified spatial lines object on google map
#'  
#'  @param fortified_spatialLines A spatialLines object that has been fortified by ggplot
#'  @param zoom Input for ggmap's zoom
#'  @param color Input for ggmap's color
#'  @param maptype Inputr for ggmaps's maptype
#'  @return plot of map
#'  @examples
#'  # see vignette
#'  # plot_fortifiedLines_onGGMAP(street)
#'  @export
#' 
plot_fortifiedLines_onGGMAP <- function(fortified_spatialLines, zoom = 12, color = "bw", maptype = "terrain") {
  street_paths <- geom_path(data = fortified_spatialLines,aes(y = lat, x = long, group = group))
  center<-get_map_center(ggplot()+street_paths)
  gmap<-get_map(center,zoom = zoom,color = color, maptype = maptype)
  ggmap(gmap) + street_paths + coord_map()
}

