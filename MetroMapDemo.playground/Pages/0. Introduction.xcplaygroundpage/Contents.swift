/*:
 ### WWDC 2018 Scholarship Submission
 # TrainK Metro Map
 ## A universal interactive metro map viewer
 
 [Main Repo](https://github.com/Neotoxin4365/TrainK-iOS)
    |
 [Playground Repo](https://github.com/Neotoxin4365/WWDC18)
 
 ---
 
 As a child, I was always fascinated by the metro maps.
 
 Ten years ago, my city announced that they'll build our very first metro line, connecting two train stations and the area I lived in. Excited about the idea of trains running underground, I used canyons and pencils to draw the map of the metro system I'm craving for.
 
 Time moves on fast, while the city expands at a jaw-dropping speed - now we already have two metro lines and two high-speed intercity railways. I have never touched canyons since 10, so why not draw the new map with Swift Playground?
 
 ---
 
 Most of the other metro map viewers on the market are using very simple technology: literally UIImageView wrapped in UIScrollView. This time I'm doing something different - a metro map viewer you can interact with. It needs to be universal and automatic: given nothing more than the position of the stations, it should be able to layout a very detailed metro map, automatically inferring all other information.
 
 ## So, here we go!
 */
import UIKit
import PlaygroundSupport
/*:
 I'm writing the majority of my codes in a custom iOS Framework, so we have to import that framework first.
 */
import MetroMap
/*:
  Please note that in order to import the framework from outside, **you have to view this playground in an Xcode Workspace, and build the framework before running the playground.**
 ## 1. Open WWDC18.xcworkspace instead of MetroMapDemo.playground
 ## 2. Choose Scheme "MetroMap" -> "iPhone X" from the left-top cornor and Press Control + B To Build.
 ## 3. Wait for the completion of building/indexing, then start the playground.
 If you get error "Couldn't lookup symble", please wait a few seconds and try again.
*/

import SwiftSVG
import SwiftyJSON
/*:
 We just imported two third-party open-source frameworks:
 - [SwiftSVG](https://github.com/mchoe/SwiftSVG): A SVG vector image parser which converts stantard SVG images into CAShapeLayers. That's how I display the station icons and the background images.
 - [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON): A JSON parser for elegant and swifty JSON manipulations.
*/
let url = Bundle.main.url(forResource: "hefei", withExtension: "json")!
let data = try! Data(contentsOf: url)

// This is our metro map in JSON format. Nothing more than some very basic information, like the position of the stations.
let string = String(data: data, encoding: String.Encoding.utf8)
let map = MetroMap(data: data)

let mapViewController = MetroMapScrollableViewController()
mapViewController.metroMap = map

PlaygroundPage.current.liveView = mapViewController
mapViewController.reload()
mapViewController.zoomToFit()

/*:
 Now, if everything goes on well, you should be able to see the metro map of my hometown Hefei in the live view. Feel free to scroll the map around, and don't forget to **use the Control button on your keyboard to simulate a pinch gesture**.
 
 When you're ready, turn to the next page and experience the magic at a higher level.

 [Next](@next)
 */
