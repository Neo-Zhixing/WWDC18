//:[Previous](@previous)
import UIKit
import MetroMap
import PlaygroundSupport

/*:
 This playground page shows you four station modes and five segment drawing modes the metro map viewer supports.
 ## Stations:
 - Minor stations: The regular stations.
 - Major Stations: The stations where express trains stop.
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

let map = MetroMap()

// You can easily adjust the size of a metro map
map.configs.size = CGSize(width: 600, height: 1000)

let modes:[Segment.DrawingMode] = [.line, .triangle, .curve, .square, .parallel]
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
//: [Next](@next)

