//
//  Zombie.swift
//  MonsterTown
//
//  Created by Pala on 2017/12/15.
//  Copyright © 2017年 Pala. All rights reserved.
//

import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp = true
    private(set) var isFallingApart = false
    
    final override func terrorizeTown() {

        let townPopulation = town?.population ?? 0
        guard townPopulation > 0 else { return }
        
        guard townPopulation > 10 else {
            town?.population = 0
            return
        }
        
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }

        super.terrorizeTown()
    }
}
