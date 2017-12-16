//
//  main.swift
//  MonsterTown
//
//  Created by Pala on 2017/12/15.
//  Copyright © 2017年 Pala. All rights reserved.
//

import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

//let vampire = Vampire()
//vampire.town = myTown
//vampire.terrorizeTown()
//vampire.town?.printDescription()
//print(vampire.vampireThrall)

