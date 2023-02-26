//
//  Activity.swift
//  TOGuide
//
//  Created by jacob on 2023-02-25.
//

import Foundation

class Activity: Identifiable{
    var id = UUID()
    var name: String
    var description :String
    var rating : Double
    var hostName :String
    var images: [String]
    var price :Double
    
    
    init(){
        self.name = "NA"
        self.description = "NA"
        self.rating = 1
        self.hostName = "NA"
        self.images = ["NA"]
        self.price = 0
    }
    
    init(name: String, description: String, rating: Double, hostName: String, images: [String], price: Double) {
        self.name = name
        self.description = description
        self.rating = rating
        self.hostName = hostName
        self.images = images
        self.price = price
    }
    
}
