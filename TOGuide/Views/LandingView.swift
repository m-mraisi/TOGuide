//
//  LandingView.swift
//  TOGuide
//
//

import SwiftUI

struct LandingView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dataSource: DataSource
    @State private var linkSelection: Int?
    @State private var rememberMe = false
    @State private var User:Users = Users()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    let KEY_EMAIL = "email"
    let KEY_PASSWORD = "password"
    
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true),tag: 1, selection: $linkSelection){}
        
                Section {
                    Image(colorScheme == .dark ? "logoDark" : "logo")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                Section{
                    Text("Login").font(.largeTitle)
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Username")
                        TextField("Enter username", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Password")
                        SecureField("Enter password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding()
                    
                    Toggle(isOn: $rememberMe) {
                                Text("Remember me")
                    }.padding()
                    Button(action: {
                        // Handle login button press
                        
                        let valid = login()
                        if valid {
                            if self.rememberMe{
                                setData()
                            }
                            linkSelection = 1
                        } else {
                            showAlert = true
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(Color(UIColor(named:"components") ?? UIColor(Color.yellow)))
                            .cornerRadius(15.0)
                    }.padding()
                        .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Login Error"),
                            message: Text("\(errorMessage)"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
        }.onAppear(perform: {
            // check if the userDefaults has a signin details, if so, then send the user to the activity list, otherwise to the sign in
            self.email = UserDefaults.standard.string(forKey: KEY_EMAIL) ?? ""
            self.password = UserDefaults.standard.string(forKey: KEY_PASSWORD) ?? ""
            //when we login we store the user object to datasource
            self.User = Users(userName: self.email, password: self.password)
            dataSource.loggedInUser = self.User
            // check is userdefaults have keys
            if(!self.email.isEmpty) {
                linkSelection = 1
            }
        })
        
    }
    
    func login()->Bool{
        if(email.isEmpty || password.isEmpty){
            errorMessage = "Email or password cannot be empty"
            return false
        }else {
            if(email == dataSource.userDict["email"]){
            // check if credentials match
                if(password == dataSource.userDict["password"]){
                    return true
                } else {
                    errorMessage = "invalid password"
                    return false
                }
            // no matching email
            }else{
                errorMessage = "No user found with email"
                return false
            }
        }
    }
    func setData() {
        // to bypass login if loggedin
        UserDefaults.standard.set(email, forKey: KEY_EMAIL)
        UserDefaults.standard.set(password, forKey: KEY_PASSWORD)
        // to be used by other screens if neccessary we initialize the favorite list to be empty array
        dataSource.loggedInUser.userName = email

    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
