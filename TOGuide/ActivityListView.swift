//
//  ActivityListView.swift
//  TOGuide
//
//

import SwiftUI
import URLImage

struct ActivityListView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    @State private var activityList = [Activity]()
    
    var body: some View {
        List{
            ForEach(activityList) { activity in
                customListItemView(activity: activity)
            }
        }
        .onAppear{
            self.dataSource.fillActivities()
            self.activityList = self.dataSource.activityList
        }
        .listStyle(GroupedListStyle())
    }
}

struct customListItemView : View{
    
    var  activity : Activity
    
    var body: some View{
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



struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView()
    }
}
