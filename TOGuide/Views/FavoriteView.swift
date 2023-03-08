//
//  FavoriteView.swift
//  TOGuide
//
//

import SwiftUI
import URLImage

struct FavoriteView: View {
    @EnvironmentObject var dataSource: DataSource
    @State private var isEmpty = false
    var body: some View {
        VStack{
//            Text("Favorites")
            
            
            VStack{
                
                if self.isEmpty{
                    Text("No favorites found.").frame(height: 600)
                }else{
                    List{
                        ForEach(dataSource.favoriteList){favorite in
                            customListItemView(activity: favorite)
                        }
                        .onDelete{indexSet in
//                            self.activityList.remove(atOffsets: indexSet)
                            dataSource.removeFavoriteActivity(dataSource.favoriteList[indexSet.first!])
                        }
                    }
                    .frame(height: 600)
                }
            }
        }.onAppear(perform: {
            if(dataSource.favoriteList.isEmpty){
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
