//
//  TOGuideApp.swift
//  TOGuide
//
//  Created by Mahmoud Mraisi on 23/02/2023.
//

import SwiftUI

@main
struct TOGuideApp: App {
    
    var dataSource : DataSource = DataSource()
    
    
    
    var body: some Scene {
        WindowGroup {
            LandingView().environmentObject(dataSource)
        }
    }
}
