//: Playground - noun: a place where people can play

import UIKit

/*
//var bucketList: Array<String>
var bucketList = ["Climb Mt. Everset"]
bucketList.append("Fly hot air ballon to Fiji")
bucketList.append("Watch the Lord of the Rings trilogy in one day")
bucketList.append("Go on a walkabout")
bucketList.append("Scuba dive in the Great Blue Hole")
bucketList.append("Find a triple rainbow")
*/

var bucketList = ["Climb Mt. Everest"]
var newItems = [
    "Fly hot air ballon to Fiji",
    "Watch the Lord of the Rings trilogy in one day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

//for item in newItems {
//    bucketList.append(item)
//}

bucketList += newItems
bucketList

bucketList.remove(at: 2)
bucketList

print(bucketList.count)
print(bucketList[0...2])

bucketList[2] += " in Australia"
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", at: 2)
bucketList

var myronsList = [
    "Climb Mt. Kilimanjaro",
    "Fly hot air ballon to Fiji",
    "Toboggan across Alaska",
    "Go on a walkabout in Australia",
    "Find a triple rainbow",
    "Scuba dive in the Great Blue Hole"
]

let equal = (bucketList == myronsList)

let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel Wrap"
]

// challenge
var index = bucketList.index(of: "Fly hot air ballon to Fiji") // optional
if let index = index {
    let targetIndex = bucketList.index(index, offsetBy: 2)
    bucketList[targetIndex]
}



