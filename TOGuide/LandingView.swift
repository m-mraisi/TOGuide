//
//  LandingView.swift
//  TOGuide
//
//  Created by Mahmoud Mraisi on 23/02/2023.
//

import SwiftUI

struct LandingView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    @State private var linkSelection: Int?
    @State private var email: String = ""
    @State private var password: String = ""
    
    let KEY_EMAIL = "email"
    let KEY_PASSWORD = "password"
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: SignInView().navigationBarBackButtonHidden(true),tag: 1, selection: $linkSelection){}
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true),tag: 2, selection: $linkSelection){}
            }
            .onAppear(perform: {
                // check if the userDefaults has a signin details, if so, then send the user to the activity list, otherwise to the sign in
                self.email = UserDefaults.standard.string(forKey: KEY_EMAIL) ?? ""
                self.password = UserDefaults.standard.string(forKey: KEY_PASSWORD) ?? ""
                
                if((email.isEmpty || password.isEmpty) && false){ //  for now I am keeping this false to land on the feed screen directly
                    linkSelection = 1
                }
                else{
                    linkSelection = 2
                }
            })
        }
        
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
