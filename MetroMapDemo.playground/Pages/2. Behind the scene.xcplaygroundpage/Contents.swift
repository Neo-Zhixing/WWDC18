/*:
 [Previous](@previous)   [Next](@next)
 
 # 2. Basics
 
 This playground page gives you a straightforward demonstration of how the layout system works. In order to display a metro line, we have to break it down into the smallest units - segments and stations. What you're seeing in the live view is the four station types and four line segment drawing modes the MetroMapView supports. Feel free to **drag the stations around** in the live view and explore the principles underneath.
 
 Pay attention to:
 
 - Line segments redraw themselves according to the designated drawing modes: direct, triangle, square and parallel.
 
 - Labels automatically adjust their position to avoid overlapping with the lines.
 
 - Line segments automatically adjust their position to avoid overlapping with other lines going the same way.
 
 - The orientation of the station notch changes so that it is always perpendicular to the line.
 
 Note: Use Control button on your keyboard to simulate pinch-in/pinch-out
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

let modes:[Segment.DrawingMode] = [.line, .triangle, .square, .parallel]
let colors = [UIColor.red, UIColor.green, UIColor.gray, UIColor.blue, UIColor.yellow]

// Generate the stations
for i in 0 ..< 4 {
    let station = Station(id: i*3)
    station.position = CGPoint(x: 100, y: 150*i + 100)
    station.name = "Testing-\(i*3)"
    station.level = .minor
    
    let station2 = Station(id: i*3+1)
    station2.position = CGPoint(x: 300, y: 150*i + 200)
    station2.name = "Testing-\(i*3+1)"
    // Adjust the level of the station.
    station2.level = .interchange
    
    let station3 = Station(id: i*3+2)
    station3.position = CGPoint(x: 500, y: 150*i + 300)
    station3.name = "Testing-\(i*3+2)"
    station3.level = .major
    
    map.stations.insert(station)
    map.stations.insert(station2)
    map.stations.insert(station3)
    
    
    // Create the lines and line segments.
    let segment1 = Segment(from: station, to: station2)
    segment1.drawingMode = modes[i]
    
    let segment2 = Segment(from: station2, to: station3)
    segment2.drawingMode = modes[i]
    segment2.inverse = true
    
    let line = Line(id: 2*i)
    line.color = colors[i]
    line.addSegment(segment1)
    line.addSegment(segment2)
    
    let anotherLine = Line(id: 2*i+1)
    anotherLine.color = colors[i+1]
    let segment3 = Segment(from: station2, to: station3)
    segment3.drawingMode = modes[i]
    segment3.inverse = true
    anotherLine.addSegment(segment3)
    
    
    map.lines.insert(line)
    map.lines.insert(anotherLine)
}

let mapViewController = MetroMapEditingViewController()
mapViewController.metroMap = map

PlaygroundPage.current.liveView = mapViewController
mapViewController.reload()


