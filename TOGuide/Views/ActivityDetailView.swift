//
//  ActivityDetailView.swift
//  TOGuide
//
//

import SwiftUI
import URLImage

struct ActivityDetailView: View {
    
    @EnvironmentObject var dataSource: DataSource
    @State private var isFavorite = false
    
    let activity: Activity
    
    
    var body: some View {
        VStack {
            Text(activity.name)
                .font(.title)
                .padding(.top, 20)
            
            HStack(spacing: 10) {
                URLImage(URL(string: activity.images[0])!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                URLImage(URL(string: activity.images[1])!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
            }
            
            Text(activity.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.top, 20)
                .padding(.horizontal, 10)
                
            
            HStack(spacing: 5) {
                ForEach(0..<Int(activity.rating)) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                ForEach(0..<Int(5-activity.rating)) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 10)
            
            HStack {
                Spacer()
                Button(action: {
                    let tel = "tel://"
                    let formattedString = tel + self.activity.phone //.removingAllWhitespaces()
                    guard let url = URL(string: formattedString) else { return }
                    UIApplication.shared.open(url)
                }) {
                    Text(activity.phone)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.top, 20)
            
            HStack {
                
                Spacer()
                ShareLink(item:"Check out this amazing activity! Name: \(activity.name), Price: $\(String(format: "%.2f", activity.price))"){
                    Image(systemName: "square.and.arrow.up")
                    Text("Share")
                }
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom, 20)
                
                Button(action: {
                    
                    for item in dataSource.favoriteList{
                        print(item.displayInfo())
                    }
                    
                    print(dataSource.favoriteList.firstIndex(where: { $0.name == activity.name }) == nil)
                    
                    if isFavorite {
                        dataSource.removeFavoriteActivity(activity)
                        
                        
                    } else {
                        dataSource.addFavoriteActivity(activity)
                    }
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                    Text("Favorite")
                }
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom, 20)
                
                Spacer()
            }
            .padding()
        }
        .onAppear{
            isFavorite = !(dataSource.favoriteList.firstIndex(where: { $0.name == activity.name }) == nil)
        }
    }
}


//struct ActivityDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetailView()
//    }
//}
