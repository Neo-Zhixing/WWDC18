/*:
 [Previous](@previous)   [Next](@next)
 
 # 1. Basics
 
 This playground page shows you four station types and five segment drawing modes the metro map viewer supports.
 
 A MetroMapEditingViewController was used (as the delegate of MetroMapView) to enable the editing capability. It handles the station selection&dragging events, animation, and  snapping.
 
 Feel free to **drag the stations around** in the live view and observe how the lines redraw itself according to the positions of the stations. Also, the labels of stations will automatically adjust its position to avoid overlapping with the lines.
 
 Please note that the intention of this editing view is just to give you a straightforward impression about how the layout system work. In a production environment, all the data will be generated from a database on the server side, so I don't think there should be anyone who wants to edit a metro map on their iOS device.
 
 ## Stations:
 - Minor stations: The regular stations. **They automatically adjust their orientation** so that the white notch is always perpendicular to the line.
 - Major Stations: The express train stations.
 - Interchange: The stations with more than two lines.
 - Intercity: The stations where you can transfer to an intercity train.
 
 ## Segment drawing modes:
 - Direct Line
 - Triangle
 - Curve
 - Square
 - Parallel Line
 
 The width and the color of the line is also easily adjustable.
 */


// The metro map is completely MVC compliant. We can create the map objects programmatically and load them into our view all at once.

import UIKit
import MetroMap
import PlaygroundSupport

let map = MetroMap()

// You can easily adjust the size of a metro map
map.configs.size = CGSize(width: 600, height: 1000)

let modes:[Segment.DrawingMode] = [.line, .triangle, .square, .parallel, .curve]
let colors = [UIColor.red, UIColor.green, UIColor.gray, UIColor.blue, UIColor.yellow]

for i in 0 ..< 5 {
    let station = Station(id: i*3)
    station.position = CGPoint(x: 100, y: 150*i + 100)
    station.name = "Testing-\(i*3)"
    
    let station2 = Station(id: i*3+1)
    station2.position = CGPoint(x: 300, y: 150*i + 200)
    station2.name = "Testing-\(i*3+1)"
    station2.level = .minor
    
    let station3 = Station(id: i*3+2)
    station3.position = CGPoint(x: 500, y: 150*i + 300)
    station3.name = "Testing-\(i*3+2)"
    
    map.stations.insert(station)
    map.stations.insert(station2)
    map.stations.insert(station3)
    
    
    // Creating the lines and line segments connecting two stations is super easy.
    let segment1 = Segment(from: station, to: station2)
    segment1.drawingMode = modes[i]
    
    let segment2 = Segment(from: station2, to: station3)
    segment2.drawingMode = modes[i]
    segment2.inverse = true
    
    let line = Line(id: i)
    line.color = colors[i]
    line.segments.append(segment1)
    line.segments.append(segment2)
    
    
    map.lines.insert(line)
}

let mapViewController = MetroMapEditingViewController()
mapViewController.metroMap = map

let navigationController = UINavigationController(rootViewController: mapViewController)

PlaygroundPage.current.liveView = navigationController
mapViewController.reload()


