//: Playground - noun: a place where people can play

import UIKit

protocol Exercise: CustomStringConvertible {
    var name: String { get }
    var title: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

extension Exercise {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

struct EllipticalWorkout: Exercise {
    let name = "Ellipical Workout"
    let title = "Workout using the Go Fast Elliptical Trauner 3000"
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct TreadmillWorkout: Exercise {
    let name = "Treadmill Workout"
    let title = "Workout using Treadmill Workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
}

extension TreadmillWorkout {  // 覆蓋Exercise默認值，放進extension更清晰
    var description: String {
        return "TreadmillWorkout(\(caloriesBurned) calories and \(laps) laps in \(minutes) minutes"
    }
}

let runningWorkout = TreadmillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)

extension Exercise {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

print(ellipticalWorkout)
print(runningWorkout)

//extension Exercise {
//    var title: String {
//        return "\(name) - \(minutes) minutes"
//    }
//}

for exercise in mondayWorkout {
    print(exercise.title)
}

print(ellipticalWorkout.title)

