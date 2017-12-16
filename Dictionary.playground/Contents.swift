//: Playground - noun: a place where people can play

import UIKit

var movieRatings = ["Donnie Darko": 4, "Chunking Express": 5, "Dark City": 4]
print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"] // optional
movieRatings["Dark City"] = 5
movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")  // return old value
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5 // add

movieRatings.removeValue(forKey: "Dark City")  // return old value
//movieRatings["Daerk City"] = nil

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}

for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

let album = [
    "Diet Roast Beef": 268,
    "Dubba Dubbs Stubs His Toe": 467,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221
]

let watchedMovies = Array(movieRatings.keys)


