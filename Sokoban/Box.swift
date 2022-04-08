//
//  Box.swift
//  Sokoban
//
//  Created by Кирилл on 02.04.2022.
//

import Foundation

class Box {
    var x : Int {
        didSet {
            if self.x == 1 || self.x == room.heigth {
                print("Нельзя выносить ящик за пределы поля")
            }
        }
    }
    var y : Int {
        didSet {
            if self.y == 1 || self.y == room.heigth {
                print("Нельзя выносить ящик за пределы поля")
            }
        }
    }
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
