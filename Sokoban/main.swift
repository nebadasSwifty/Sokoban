//
//  main.swift
//  Sokoban
//
//  Created by Кирилл on 02.04.2022.
//

import Foundation


enum Direction {
    case left, right, up, down
}
enum Symbols : Character {
    case cell = "\u{2B1C}"
    case human = "\u{1F5FF}"
    case wall = "\u{2B1B}"
    case box = "\u{1F371}"
    case finish = "\u{1F3C1}"
}
class Room {
    var human : Human
    var width : Int
    var finishPoint : FinishPoint
    var heigth : Int
    var box : Box
    var cell = [Cell]()
    init(width : Int, heigth : Int, human: Human, box: Box, finishPoint: FinishPoint) {
        self.width = width
        self.heigth = heigth
        self.human = human
        self.box = box
        self.finishPoint = finishPoint
    }
    func printRoom(room: Room) {
        for row in 1...heigth {
            print("")
            for cow in 1...width {
                let oneCell = Cell(x: row, y: cow, symbol: .cell)
                if oneCell.x == 1 || oneCell.x == width {
                        oneCell.symbol = .wall
                }
                if oneCell.y == 1 || oneCell.y == heigth {
                        oneCell.symbol = .wall
                }
                if (human.x, human.y) == (row, cow) {
                        oneCell.symbol = .human
                }
                if (box.x, box.y) == (row, cow) {
                        oneCell.symbol = .box
                }
                if (finishPoint.x, finishPoint.y) == (row,cow){
                    oneCell.symbol = .finish
                }
                cell += [oneCell]
                print("\(oneCell.symbol.rawValue)", terminator: "")
            }
        }
        print("\nПерсонаж находится на координатах \(human.x - 1), \(human.y - 1)")
    }
    
}

class Cell {
    var x : Int
    var y : Int
    var symbol : Symbols
    init(x: Int, y: Int, symbol: Symbols){
        self.x = x
        self.y = y
        self.symbol = symbol
    }
}
func clearTerminal() {
    let cls = Process()
    let out = Pipe()
    cls.launchPath = "/usr/bin/clear"
    cls.standardOutput = out
    cls.launch()
    cls.waitUntilExit()
    print (String(data: out.fileHandleForReading.readDataToEndOfFile(), encoding: String.Encoding.utf8) ?? "")
    
}


var finish = FinishPoint(x: 9, y: 9)
var box = Box(x: 4, y: 4)
var human = Human(x: 2, y: 3)
var room = Room(width: 10, heigth: 10, human: human, box: box, finishPoint: finish)
clearTerminal()
room.printRoom(room: room)
print("Для начала игры введите один из символов (W,A,S,D) нажмите Enter")
repeat {
    let step = String(readLine()!)
    switch step.lowercased() {
    case "w" :
        clearTerminal()
        human.moveTo(direction: .up)
        room.printRoom(room: room)
    case "a" :
        clearTerminal()
        human.moveTo(direction: .left)
        room.printRoom(room: room)
    case "s" :
        clearTerminal()
        human.moveTo(direction: .down)
        room.printRoom(room: room)
    case "d" :
        clearTerminal()
        human.moveTo(direction: .right)
        room.printRoom(room: room)
    default :
        clearTerminal()
        print("Напишите верный символ")
        room.printRoom(room: room)
    }
} while (box.x, box.y) != (finish.x, finish.y)


