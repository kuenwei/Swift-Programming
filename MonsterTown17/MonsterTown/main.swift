//
//  main.swift
//  MonsterTown
//
//  Created by Pala on 2017/12/15.
//  Copyright © 2017年 Pala. All rights reserved.
//

import Foundation

var myTown = Town(population: 100, stoplights: 6)
myTown?.printDescription()

let myTownSize = myTown?.townSize
print(myTownSize)

myTown?.changePopulation(by: 1_000_000)
print("Size: \(myTown?.townSize); population: \(myTown?.population)")

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convenienceZombie = Zombie(limp: true, fallingApart: false)

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")

print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

fredTheZombie = nil

//let vampire = Vampire()
//vampire.town = myTown
//vampire.terrorizeTown()
//vampire.town?.printDescription()
//print(vampire.vampireThrall)

