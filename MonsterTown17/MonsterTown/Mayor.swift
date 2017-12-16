//
//  Mayor.swift
//  MonsterTown
//
//  Created by Pala on 2017/12/16.
//  Copyright © 2017年 Pala. All rights reserved.
//

import Foundation

struct Mayor {
    
    private var anxietyLevel: Int = 0
    
    mutating func podcast() {
        
        print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
        
        anxietyLevel += 1
        print("anxietyLevel: \(anxietyLevel)")
    }
}
