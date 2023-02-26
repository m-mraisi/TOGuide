//
//  Users.swift
//  TOGuide
//
//  Created by jacob on 2023-02-25.
//

import Foundation

class Users {
    var favoriteList:[Activity]
    var userName:String
    var password:String
    
    init(){
        self.favoriteList = []
        self.userName = ""
        self.password = ""
    }
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
        self.favoriteList = []
    }
}
