/*:
 [Previous](@previous)   [Next](@next)
 
 # 2. Interactivity
 
 One big advantage of the metro map viewer is that we can manipulate the map components at runtime effortlessly. Here's a demonstration based on the current Hong Kong MTR System Map.
 
 - Click on the station icons. It will and display a popover right next to it.
 
 - Click the Search Icon on the left side of the navigation bar. A search view will be shown, and you may select a search result. Note that due to some bugs in the Xcode playground simulator, the keyboard can't be shown completely. I pre-setted some text in the search bar so that you don't have to type in these characters yourself.
 
 - In the station popover, click "Direction". Then, select another station and click "Direction" again. It will execute an implementation of Dijkstra's algorithm and highlight the shortest route between the two stations for you.
 
 The background is a static SVG image.
 
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
searchBar?.text = "旺角"

