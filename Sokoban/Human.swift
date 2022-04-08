//
//  Human.swift
//  Sokoban
//
//  Created by Кирилл on 02.04.2022.
//

import Foundation

class Human {
    var x : Int {
        didSet {
            if self.x == 1 || self.x == room.heigth {
                print("Нельзя выходить за пределы поля")
                self.x = oldValue
            }
        }
    }
    var y : Int {
        didSet{
            if self.y == 1 || self.y == room.width{
                print("Нельзя выходить за пределы поля")
                self.y = oldValue
            }
        }
    }
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    func moveTo(direction: Direction) {
        func moveBox(direction: Direction, box: Box) {
            switch direction {
            case .left: box.y -= 1
            case .right: box.y += 1
            case .up: box.x -= 1
            case .down : box.x += 1
            }
            if (box.x, box.y) == (finish.x, finish.y){
                print("Вы выиграли")
            }
        }
        switch direction {
        case .left : self.y -= 1
        case .right: self.y += 1
        case .up : self.x -= 1
        case .down : self.x += 1
        }
        if (self.x, self.y) == (box.x, box.y) {
            moveBox(direction: direction, box: box)
        }
    }
}
