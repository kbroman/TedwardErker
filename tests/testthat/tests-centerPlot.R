context("Test centerplot")

test_that("test get_map_center", {

    library(rgdal)
    library(ggplot2)
    library(ggmap)
    library(magrittr)

    street <- readOGR("StreetCenterLines", "StreetCenterlines")
    street <- spTransform(street, CRS("+proj=longlat +datum=WGS84"))
    street %<>% fortify()
    street_paths <- geom_path(data = street,aes(y = lat, x = long, group = group))

    b<-readRDS(file = "TestCenterData.RDS")

    expect_equal(get_map_center(ggplot()+street_paths),b)
})
