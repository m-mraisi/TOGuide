//
//  ActivityListView.swift
//  TOGuide

import SwiftUI
import URLImage

struct ActivityListView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    @State private var activityList = [Activity]()
    
    var body: some View {
        VStack{
//            Text("Activities")
            List{
                ForEach(activityList) { activity in
                    customListItemView(activity: activity)
                }
            }.frame(height: 600)
        }
        .onAppear{
            self.dataSource.activityList = [Activity]()
            if activityList.isEmpty {
                self.dataSource.fillActivities()
                self.activityList = self.dataSource.activityList
            }
        }
    }
}

struct customListItemView : View {
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



struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView()
    }
}
