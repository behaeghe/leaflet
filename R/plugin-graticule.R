leafletGraticuleDependencies <- function() {
  list(
    htmltools::htmlDependency(
      "leaflet-graticule",
      "0.1.0",
      system.file("htmlwidgets/plugins/Leaflet.Graticule", package = "leaflet"),
      script = c("L.Graticule.js", "Graticule-binding.js")
    )
  )
}

#' Add a Graticule on the map
#' see \url{https://github.com/turban/Leaflet.Graticule}
#'
#' @param map a map widget object
#' @param interval The spacing in map units between horizontal and vertical lines.
#' @param sphere boolean. Default FALSE
#' @param style path options for the generated lines. See \url{http://leafletjs.com/reference.html#path-options}
#' @param layerId the layer id
#' @param group the name of the group this layer belongs to.
#' @examples
#' library(leaflet)
#'
#' leaf <- leaflet() %>%
#'   addTiles() %>%
#'   addGraticule()
#'
#' @export
addGraticule <- function(
  map,
  interval = 20,
  sphere = FALSE,
  style = list(color= '#333', weight= 1),
  layerId = NULL,
  group=NULL
) {
  map$dependencies <- c(map$dependencies, leafletGraticuleDependencies())
  invokeMethod(
    map,
    getMapData(map),
    'addGraticule',
    interval,
    sphere,
    style,
    layerId,
    group
  )
}
