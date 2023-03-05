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
    
    
    //for first sample user
    var userDict = ["email":"User@gmail.com","password":"testUser"]
    @Published var loggedInUser:Users = Users()
    
    func fillActivities(){
        activityList.append(Activity(name: "Toronto's Underground Donut Tour",
                                     description: "Join us on a donut adventure through the most interesting parts of downtown Toronto, Kensington Market and Chinatown! Our tour begins at Cops Doughnuts right in the heart of the Fashion District. You’ll love their hot, fresh and tiny doughnuts as well as their super cute aesthetic. From here, we’ll make our way over to Queen street and our next doughnut shop, Bloomer’s.",
                                     rating: 5, hostName: "Jeff", images: ["https://images.unsplash.com/photo-1527515545081-5db817172677?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80","https://a0.muscache.com/im/pictures/lombard/MtTemplate-4510709-media_library/original/1242cf13-56c5-4586-9db9-6cf2b5534262.jpeg?im_w=720"],price: 62.00, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Historic Niagara Falls-A day trip",
                                     description: "In this trip, you'll explore not only the Niagara Falls but some of the major historic landmarks in #Niagara Escarpment area that majority of tourists are not aware of. Our first destination will be Niagara Glen (The Gorge). Here you'll see 400 million years old Limestone Rocks. You will also witness interesting history of creation of Niagara Gorge during over 10,000 years by the erosive power of the falls. Then we'll take a small hike in the woods to see the actual battlefield of 1812 and the 'Historic Cannon' that was used in the battle.", rating: 4, hostName: "Abijit", images: ["https://images.unsplash.com/photo-1489447068241-b3490214e879?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80", "https://a0.muscache.com/im/pictures/lombard/MtTemplate-1020666-active_media/original/4e1c7995-8b68-47b0-8028-6f98b6816641.jpeg?im_w=1440"], price: 155.0, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Kayak the Grand River", description: " Hi , and Welcome!My name is Sandra, and my partner Mark and I live right on the Grand River with our 4 kids in Kitchener, Ontario.Back in 2020 when there was a worldwide Pandemic and the country got shut down. We only had our backyard to play with. Blessed to be living by the Grand River, exploring the Grand became one of our families getaway, especially by Kayaking.Our Family believed that everyone should Explore the Grand River.",
                                     rating: 4, hostName: "Sandra", images: ["https://a0.muscache.com/im/pictures/lombard/MtTemplate-2815943-media_library/original/71cfa3e0-faf9-4f7d-adae-2963ff80cd42.jpeg?im_w=1440", "https://a0.muscache.com/im/pictures/lombard/MtTemplate-2815943-media_library/original/ef62c23b-ef9b-4ad2-9e30-2cb80b4cb0aa.jpeg?im_w=1440"], price: 40.0, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Alpaca Pig Tour", description: "You'll start your farm adventure learning about our Alpacas - why we have them, some basic care and handling practices and then we'll move into the pen where you can get up close and feed if you wish - this is not a petting zoo so touching the alpacas is not guaranteed. Sometimes they're groovy with a neck scratch, sometimes they'd rather just a photo opt - either way, you'll be in for quite the experience! Next, we'll introduce you to our rescue pigs, Jolene and Billy Ray - they aren't shy to the limelight and would love a belly rub or ear scratch.", rating: 4, hostName: "Jenn", images: ["https://a0.muscache.com/im/pictures/lombard/MtTemplate-1854713-media_library/original/790aad61-0699-476d-b470-31897771a634.jpeg?im_w=1440","https://a0.muscache.com/im/pictures/lombard/MtTemplate-1854713-poster/original/39c7084d-3583-4666-9108-fde832916686.jpeg?im_w=1200"], price: 40.00, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Picture Yourself in Wine Country", description: "Sandra, your knowledgeable tour guide, has worked in the wine industry for many years and is also a professional photographer & certified wine consultant. Sandra will escort you to each location giving you inside information about the wineries, local history and sights along the way. The price includes wine tasting samples at each location, tour of vineyard, one deluxe charcuterie & cheese platter with premium wine, and professional, web-quality, digital photographs of your experience. So the only thing you need to worry about is enjoying your day!", rating: 4, hostName: "Sandra & Jansin", images: ["https://a0.muscache.com/im/pictures/975b582c-8a2d-401a-b66a-e8f39c22d7a8.jpg?im_w=1440","https://a0.muscache.com/im/pictures/lombard/MtTemplate-557447-poster/original/19f18689-7b7b-4dc0-be4a-4e9826a4acec.jpeg?im_w=1200"], price: 452.0, phone: "(123)-456-7890"))
        
        activityList.append(Activity(name: "Horseback Adventure", description: "Have you ever dreamt of seeing beautiful countryside astride the ancient horse of the Spanish Conquistadors? This adventure with the uniquely smooth Paso Fino horse is an amazing opportunity, we're the only place like this in all of Canada, and a guaranteed highlight! When you arrive at Fina Vista Farm you will have a chance to walk around, stretch your legs, use the facilities and meet the resident animals, horses, dogs, cats, chickens and Pepper the pig.", rating: 4, hostName: "Camilla", images: ["https://images.unsplash.com/photo-1609128231746-356e747a53bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80", "https://a0.muscache.com/im/pictures/lombard/MtTemplate-370896-media_library/original/0b6aa1c4-be65-45ce-983a-1e29f5e2bacd.jpeg?im_w=1440"], price: 85.0, phone: "(123)-456-7890"))
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
