/*:
 ### WWDC 2018 Scholarship Submission
 # TrainK Metro Map
 ## A universal interactive metro map viewer
 ---
 
 I love trains and metros.
 
 Ten years ago, my city announced that they'll build our very first metro line, connecting two train stations and the area I lived in. Excited about the idea of trains running underground, I used canyons and pencils to draw the map of the metro system I'm craving for.
 
 Time moves on fast, while the city expands at a jaw-dropping speed - now we already have two metro lines and two high-speed intercity railways. I have never touched canyons since 10, so why not draw the new map with Swift Playground?
 
 ---
 
 Most of the other metro map viewers on the market are using very simple technology: literally UIImageView wrapped in UIScrollView. Today I'm doing something different - a metro map viewer you can interactive with. It needs to be universal and automatic: given nothing more than the position of the stations, it should be able to draw a very detailed metro map, infering all the informations automatically.
 
 ## So, here we go!
 */
import UIKit
import PlaygroundSupport
/*:
 An important step: we're importing the codes from my MetroMap Framework. I'm writing the majority of my codes in an iOS App Framework mainly because of its
 - Reusability in a real project beyond WWDC
 - Easier intergration with third-party frameworks
 */
import MetroMap
/*:
  Please note that in order to import the framework from outside, **you have to view this playground in an Xcode Workspace, and build the framework before running the playground.**
 ## 1. Open WWDC2018.xcworkspace instead of WWDC2018.playground
 ## 2. Choose Scheme MetroMap -> iPhone X from the left-top cornor and Press Control + B To Build.
 ## 3. Wait for the completion of building/indexing, then start the playground.
*/

import SwiftSVG
import SwiftyJSON
/*:
 We just imported two third-party open-source frameworks:
 - SwiftSVG: A SVG image parser to load the background image.
 - SwiftyJSON: A JSON parsing framework for easier and swiftier JSON manipulations.
*/

let map = MetroMap()
let station = Station(id: 0)
map.stations.insert(station)

let mapView = MetroMapView()
mapView.datasource = map
mapView.reload()
mapView
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = mapView

//: [Next](@next)
