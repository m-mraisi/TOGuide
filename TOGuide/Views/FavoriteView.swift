//
//  FavoriteView.swift
//  TOGuide
//
//

import SwiftUI
import URLImage

struct FavoriteView: View {
    @EnvironmentObject var dataSource: DataSource
    @State private var activityList = [Activity]()
    @State private var isEmpty = false
    var body: some View {
        VStack{
            Text("Favorites")
            
            
            VStack{
                
                if self.isEmpty{
                    Text("No favorites found.").frame(height: 600)
                }else{
                    List{
                        ForEach(self.activityList){favorite in
                            favoriteItemListView(activity: favorite)
                        }
                    }.frame(height: 600)
                }
            }
        }.onAppear(perform: {
            self.activityList = dataSource.loggedInUser.favoriteList
            if(self.activityList.isEmpty){
                self.isEmpty = true
            }else{
                self.isEmpty = false
            }
        })
    }
}


struct favoriteItemListView : View {
    // the following is the custom list Item
    
    var  activity : Activity
    
    var body: some View {
        NavigationLink(destination: ActivityDetailView(activity: activity)) {
            HStack {
                URLImage(URL(string: activity.images[0])!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(activity.name)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Price: $\(String(format: "%.2f", activity.price)) / person")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
