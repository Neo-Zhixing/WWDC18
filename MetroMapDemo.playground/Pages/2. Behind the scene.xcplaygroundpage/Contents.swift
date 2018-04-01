/*:
 [Previous](@previous)   [Next](@next)
 
 # 2. Basics
 
 This playground page gives you a straightforward demonstration about how the layout system works. In order to display a metro line, we have to break it down to the smallest units - segments and stations. What you're seeing in the live view are the four station types and five segment drawing modes the MetroMapView supports.
 
 Feel free to **drag the stations around** in the live view and observe how the lines redraw itself according to the positions of the stations. Notice that the labels will automatically adjust its position to avoid overlapping with the lines.
 
 Note: Use Control button on your keyboard to simulate pinch-in/pinch-out
 
 ## Stations:
 - Minor stations: The regular stations. **They automatically adjust their orientation** so that the white notch is always perpendicular to the line.
 - Major Stations: The express train stations.
 - Interchange: The stations with more than two lines.
 - Intercity: The stations where you can transfer to an intercity train.
 
 ## Segment drawing modes:
 - Direct Line
 - Triangle
 - Square
 - Parallel Line
 - Curve
 
 The width and the color of the line is also easily adjustable.
 */


// The metro map is completely MVC compliant. We can create the map objects programmatically and load them into our view all at once.

import UIKit
import MetroMap
import PlaygroundSupport

let map = MetroMap()

// Easily adjust the size of a metro map
map.configs.size = CGSize(width: 600, height: 1000)

let mainStation = Station(id: -10)
mainStation.level = .intercity
mainStation.position = CGPoint(x: 300, y: 100)
mainStation.name = "Intercity Station"
map.stations.insert(mainStation)

let modes:[Segment.DrawingMode] = [.line, .triangle, .square, .parallel, .curve]
let colors = [UIColor.red, UIColor.green, UIColor.gray, UIColor.blue, UIColor.yellow]

// Generate the stations
for i in 0 ..< 5 {
    let station = Station(id: i*3)
    station.position = CGPoint(x: 100, y: 150*i + 100)
    station.name = "Testing-\(i*3)"
    station.level = .major
    
    let station2 = Station(id: i*3+1)
    station2.position = CGPoint(x: 300, y: 150*i + 200)
    station2.name = "Testing-\(i*3+1)"
    // Adjust the level of the station.
    station2.level = .minor
    
    let station3 = Station(id: i*3+2)
    station3.position = CGPoint(x: 500, y: 150*i + 300)
    station3.name = "Testing-\(i*3+2)"
    station3.level = .interchange
    
    map.stations.insert(station)
    map.stations.insert(station2)
    map.stations.insert(station3)
    
    
    // Create the lines and line segments.
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

PlaygroundPage.current.liveView = mapViewController
mapViewController.reload()


