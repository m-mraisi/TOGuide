//
//  ContentView.swift
//  TOGuide
//
//  Created by Mahmoud Mraisi on 23/02/2023.
//

import SwiftUI

// This view checks if the user is already signin or not and base don that it points the next screen

struct ContentView: View {
    
    var body: some View {
        TabView {
            // Feed tab
            NavigationView {
                NavigationLink(destination: ActivityListView()) {
                    Text("Feed")
                }
            }
            .tabItem {
                Image(systemName: "1.circle")
                Text("Feed")
            }
            
            // Favorite tab
            NavigationView {
                NavigationLink(destination: FavoriteView()) {
                    Text("Favorite")
                }
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Favorite")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
