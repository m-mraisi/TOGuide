//
//  Activity.swift
//  TOGuide
//
//  Created by Mahmoud Mraisi on 23/02/2023.
//

import Foundation

class Activity: Identifiable{
    var id = UUID()
    var name: String
    var description :String
    var rating : Int
    var hostName :String
    var images: [String]
    var price :Int
    
    
    init(){
        self.name = "NA"
        self.description = "NA"
        self.rating = 1
        self.hostName = "NA"
        self.images = ["NA"]
        self.price = 0
    }
    
    init(name: String, description: String, rating: Int, hostName: String, images: [String], price: Int) {
        self.name = name
        self.description = description
        self.rating = rating
        self.hostName = hostName
        self.images = images
        self.price = price
    }
    
}
