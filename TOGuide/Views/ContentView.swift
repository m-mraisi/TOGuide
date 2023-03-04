//
//  ContentView.swift
//  TOGuide
//
//

import SwiftUI

// This view checks if the user is already signin or not and base don that it points the next screen

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var valid:Bool = false
    @State private var showingAlert = false
    let KEY_EMAIL = "email"
    let KEY_PASSWORD = "password"
    let KEY_FAVORITELIST = "favoriteList"
    var body: some View {
        VStack{
            NavigationView {
                TabView {
                    ActivityListView().tabItem {
                        Label("Feed",systemImage: "house.fill")
                    }
                    FavoriteView().tabItem {
                        Label("Favorites",systemImage: "star.fill")
                    }
                }
                .navigationBarTitle(
                    Text("TOGUIDE")
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    showingAlert = true
                    }) {
                        Image(systemName:"rectangle.portrait.and.arrow.right")
                    }.background(NavigationLink(destination: LandingView().navigationBarBackButtonHidden(true),isActive: self.$valid){
                        EmptyView()
                    })
                    .alert(isPresented: $showingAlert) {
                                   Alert(title: Text("LOGOUT"), message: Text("Do you want to logout?"), primaryButton: .default(Text("Yes")) {
                                       logout()
                                       valid = true
                                       
                                   }, secondaryButton: .cancel())
                               }
                )
                
            }
            .accentColor(Color(UIColor(named:"components") ?? UIColor(Color.yellow)))
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    func logout(){
        UserDefaults.standard.removeObject(forKey: KEY_EMAIL)
        UserDefaults.standard.removeObject(forKey: KEY_PASSWORD)
        UserDefaults.standard.removeObject(forKey: KEY_FAVORITELIST)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
