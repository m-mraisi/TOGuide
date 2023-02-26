//
//  ContentView.swift
//  TOGuide
//
//

import SwiftUI

// This view checks if the user is already signin or not and base don that it points the next screen

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                // Feed tab
                ActivityListView().tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                }
                
                // Favorite tab
                FavoriteView().tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorite")
                }
            }
            .navigationTitle("TOGuide")
            .navigationBarTitleDisplayMode(.inline)

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
