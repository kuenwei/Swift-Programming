//
//  Town.swift
//  MonsterTown
//
//  Created by Pala on 2017/12/15.
//  Copyright © 2017年 Pala. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var mayor = Mayor()
    var population = 5_422 {
        didSet(oldPopulation) {
            if oldPopulation > population {
                print("-----")
                mayor.podcast()
                print("The population has changed to \(population) from \(oldPopulation)")
                print("-----")
            }
        }
    }
    
    var numberOfStoplights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
            case 10_001...100_000:
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
