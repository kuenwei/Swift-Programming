//
//  Vampire.swift
//  MonsterTown
//
//  Created by Pala on 2017/12/15.
//  Copyright © 2017年 Pala. All rights reserved.
//

import Foundation

class Vampire: Monster {
    var vampireThrall: Int?
    
    override func terrorizeTown() {
        
        let townPopulation = town?.population ?? 0
        guard townPopulation > 0 else { return }
        
        town?.changePopulation(by: -1)
        vampireThrall = (vampireThrall ?? 0) + 1
        super.terrorizeTown()
    }
}
