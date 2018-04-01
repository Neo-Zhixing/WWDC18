/*:
 [Previous](@previous)   [Next](@next)
 
 # 1. Interactivity
 
 Breaking down the metro map to some basic components, e.g. Stations, Nodes and Line Segments, we can manipulate their behaviors at runtime with ease. Here's a demonstration based on the current Hong Kong MTR System Map.
 
 *The Live View might be too wide for your monitor. Adjust the split view width to accommodate the entire view.*
 
 Note: Use Control button on your keyboard to simulate a pinch gesture. **The labels of minor stations reveal only when you zoom close enough.**
 
 - Click on the station icons. It will display a popover right next to it.
 
 - Select a line in the popover. It will highlight the selected line for you.
 
 - Click "Directions..." in the popover. Then do it again for another station. It will calculate and highlight the shortest route between the two stations using an implementation of Dijkstra's Algorithm.
 
 - Click the Search Icon on the left side of the navigation bar. A search view will be shown, and you may select a search result. The search result will be highlighted, and a popover will be shown.
 
 The background is a static SVG image.
 
 *I didn't translate the station names because the translation doesn't make sense for you whatsoever. Just ignore these Chinese.*
 */
import UIKit
import MetroMap
import PlaygroundSupport

let url = Bundle.main.url(forResource: "hongkong", withExtension: "json")!
let jsondata = try! Data(contentsOf: url)
let map = MetroMap(data: jsondata)!


let mapViewController = MetroMapInteractiveViewController()
mapViewController.metroMap = map

let navigationController = UINavigationController(rootViewController: mapViewController)
navigationController.preferredContentSize = CGSize(width:750, height: 600)

mapViewController.loadViewIfNeeded()
PlaygroundPage.current.liveView = navigationController

mapViewController.reload()
mapViewController.zoomToFit()

let searchBar = mapViewController.navigationItem.searchController?.searchBar

//: Due to some bugs in the Xcode playground simulator, the keyboard can't be shown completely. I pre-setted some text in the search bar so that you don't have to type in these characters yourself. Some alternative texts to choose from: "九龙" "北角" "金钟"
searchBar?.text = "旺角"

