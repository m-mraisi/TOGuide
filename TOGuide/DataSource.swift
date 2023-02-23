//
//  DataSource.swift
//  TOGuide
//
//  Created by Mahmoud Mraisi on 23/02/2023.
//

import Foundation


class DataSource: ObservableObject{
    @Published var activityList = [Activity]()
}
