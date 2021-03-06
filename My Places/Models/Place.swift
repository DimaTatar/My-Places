//
//  Place.swift
//  My Places
//
//  Created by Дмитрий Татаринцев on 28.12.2021.
//


import UIKit

struct Place {
    let name: String
    let location: String?
    let type: String?
    let image: UIImage?
    let restaurantImage: String?
    
     static let restaurantNames = [
         "Burger Heroes", "Kitchen", "Bonsai",
         "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
         "Speak Easy",  "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"
     ]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        for place in restaurantNames {
            places.append(Place(name: place, location: "Moscow", type: "Bar", image: nil, restaurantImage: place))
        }
        
        return places
    }
}


