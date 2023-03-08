//
//  Datasource.swift
//  TOGuide
//
//  Created by jacob on 2023-02-25.
//

import Foundation

class DataSource: ObservableObject{
    @Published var activityList: [Activity] = [Activity]()
    @Published var favoriteList: [Activity] = loadFavoritesFromUserDefaults() {
        didSet {
            saveFavoritesToUserDefaults()
        }
    }
    
    let desc1 = NSLocalizedString("desc1", comment: "")
    let desc2 = NSLocalizedString("desc2", comment: "")
    let desc3 = NSLocalizedString("desc3", comment: "")
    let desc4 = NSLocalizedString("desc4", comment: "")
    let desc5 = NSLocalizedString("desc5", comment: "")
    let desc6 = NSLocalizedString("desc6", comment: "")

    
    
    //for first sample user
    var userDict = ["email":"User@gmail.com","password":"testUser"]
    @Published var loggedInUser:Users = Users()
    
    func fillActivities(){
        activityList.append(Activity(name: "Toronto's Underground Donut Tour",
                                     description: desc1,
                                     rating: 5, hostName: "Jeff", images: ["https://images.unsplash.com/photo-1527515545081-5db817172677?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80","https://a0.muscache.com/im/pictures/lombard/MtTemplate-4510709-media_library/original/1242cf13-56c5-4586-9db9-6cf2b5534262.jpeg?im_w=720"],price: 62.00, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Historic Niagara Falls-A day trip",
                                     description: desc2, rating: 4, hostName: "Abijit", images: ["https://images.unsplash.com/photo-1489447068241-b3490214e879?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80", "https://a0.muscache.com/im/pictures/lombard/MtTemplate-1020666-active_media/original/4e1c7995-8b68-47b0-8028-6f98b6816641.jpeg?im_w=1440"], price: 155.0, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Kayak the Grand River", description: desc3,
                                     rating: 4, hostName: "Sandra", images: ["https://a0.muscache.com/im/pictures/lombard/MtTemplate-2815943-media_library/original/71cfa3e0-faf9-4f7d-adae-2963ff80cd42.jpeg?im_w=1440", "https://a0.muscache.com/im/pictures/lombard/MtTemplate-2815943-media_library/original/ef62c23b-ef9b-4ad2-9e30-2cb80b4cb0aa.jpeg?im_w=1440"], price: 40.0, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Alpaca Pig Tour", description: desc4, rating: 4, hostName: "Jenn", images: ["https://a0.muscache.com/im/pictures/lombard/MtTemplate-1854713-media_library/original/790aad61-0699-476d-b470-31897771a634.jpeg?im_w=1440","https://a0.muscache.com/im/pictures/lombard/MtTemplate-1854713-poster/original/39c7084d-3583-4666-9108-fde832916686.jpeg?im_w=1200"], price: 40.00, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Picture Yourself in Wine Country", description: desc5, rating: 4, hostName: "Sandra & Jansin", images: ["https://a0.muscache.com/im/pictures/975b582c-8a2d-401a-b66a-e8f39c22d7a8.jpg?im_w=1440","https://a0.muscache.com/im/pictures/lombard/MtTemplate-557447-poster/original/19f18689-7b7b-4dc0-be4a-4e9826a4acec.jpeg?im_w=1200"], price: 452.0, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Horseback Adventure", description: desc6, rating: 4, hostName: "Camilla", images: ["https://images.unsplash.com/photo-1609128231746-356e747a53bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80", "https://a0.muscache.com/im/pictures/lombard/MtTemplate-370896-media_library/original/0b6aa1c4-be65-45ce-983a-1e29f5e2bacd.jpeg?im_w=1440"], price: 85.0, phone: "(123)-456-7890"))
    }
    
    func removeFavoriteActivity(_ activity: Activity) {
        if let index = favoriteList.firstIndex(where: { $0.name == activity.name }) {
            favoriteList.remove(at: index)
        }
    }
    
    func addFavoriteActivity(_ activity: Activity) {
        if favoriteList.firstIndex(where: { $0.name == activity.name }) == nil {
            favoriteList.append(activity)
        }
    }
    
    private func saveFavoritesToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favoriteList) {
            UserDefaults.standard.set(encoded, forKey: "favoriteList")
        }
    }

    private static func loadFavoritesFromUserDefaults() -> [Activity] {
        if let data = UserDefaults.standard.data(forKey: "favoriteList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: data) {
                return decoded
            }
        }
        return []
    }
}
