/*:
 ### WWDC 2018 Scholarship Submission
 # TrainK Metro Map
 ## A universal interactive metro map viewer
 
 [Main Repo](https://github.com/Neotoxin4365/TrainK-iOS)
    |
 [Playground Repo](https://github.com/Neotoxin4365/WWDC18)
 
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
 An important step: we're importing the codes from my custom Framework. I'm writing the majority of my codes in an iOS App Framework mainly because
 - Reusability in a real project beyond WWDC
 - Easier intergration with third-party frameworks
 - I never got Swift playground running smoothly as claimed on my 2013 MacBook Air. Xcode crashes from time to time, weird errors occurs every day. Debugging is just way simpler on a real iPad.
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
 - SwiftSVG: A SVG vector image parser which converts stantard SVG files into CAShapeLayers.
 - SwiftyJSON: A JSON parser for easier and swiftier JSON manipulations.
*/
let url = Bundle.main.url(forResource: "hefei", withExtension: "json")!
let data = try! Data(contentsOf: url)
let string = String(data: data, encoding: String.Encoding.utf8)
let map = MetroMap(data: data)

let mapViewController = MetroMapScrollableViewController()
mapViewController.metroMap = map

PlaygroundPage.current.liveView = mapViewController
mapViewController.reload()
mapViewController.zoomToFit()

/*:
 So there you have it, the metro map of my hometown Hefei. We just loaded a JSON file and feeded it to our view controller; then, it magically converts these position informations into a real metro map. Use the Control button on your keyboard to simulate a pinch gesture, zoom in, and observe how the labels reveals themselves at the right position.
 
 Now, go to the next page and explore the full potential of my metro map viewer.

 [Next](@next)
 */
