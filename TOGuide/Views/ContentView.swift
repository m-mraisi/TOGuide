//
//  ContentView.swift
//  TOGuide
//
//

import SwiftUI

// This view checks if the user is already signin or not and base don that it points the next screen

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            NavigationView {
                TabView {
                    ActivityListView().tabItem {
                        Label("Feed",systemImage: "house.fill")
                    }
                    FavoriteView().tabItem {
                        Label("Feed",systemImage: "star.fill")
                    }
                }
                
                .navigationBarTitle(
                    Text("TOGUIDE")
                )
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .accentColor(Color(UIColor(named:"components") ?? UIColor(Color.yellow)))
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
