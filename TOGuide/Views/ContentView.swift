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
            .navigationBarTitle(
                Text("TOGUIDE")
            )
            .navigationBarTitleDisplayMode(.inline)

        }
        .accentColor(Color("Internal_Gold"))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
