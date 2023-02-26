//
//  TOGuideApp.swift
//  TOGuide
//
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
