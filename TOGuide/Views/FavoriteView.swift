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
//            Text("Favorites")
            
            
            VStack{
                
                if self.isEmpty{
                    Text("No favorites found.").frame(height: 600)
                }else{
                    List{
                        ForEach(self.activityList){favorite in
                            customListItemView(activity: favorite)
                        }
                    }.frame(height: 600)
                }
            }
        }.onAppear(perform: {
            self.activityList = dataSource.favoriteList
            if(self.activityList.isEmpty){
                self.isEmpty = true
            }else{
                self.isEmpty = false
            }
        })
    }
}




struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
