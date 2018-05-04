//
//  HomePageViewModel.swift
//  Houseperfect
//
//  Created by Aashish Adhikari on 4/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation
import UIKit

struct HomeViewControllerViewModel {
    
    private let homePageModel: HomePageModel
    
    init() {
        homePageModel = initHomePageModel()
    }
    
    func numberOfSections() -> Int? {
        return homePageModel.data.count
    }
    
    func cellForRowAtIndexPath(row: Int) -> HomePageData?{
//        return HomePageData(label: "Featured", featured: true, data: [])
        return homePageModel.data[row]
    }
    
    func heightForRowAt(row: Int) -> CGFloat {
        if homePageModel.data[row].featured{
            return 300.0
        }
        return 400.0
    }
}

// helper function
fileprivate func initHomePageModel()-> HomePageModel{

    let homePageData = initHomePageData()
    let homePageModel = HomePageModel(status: true, data: homePageData)
    
    return homePageModel
}

fileprivate func initHomePageData() -> [HomePageData]{
    
    let home1 = HomeModel(id: "1",name: "South Facing Apartment", rate: "50", location: "loc 1", bedRoom: "5", restRoom: "3", area: "1000")
    let home2 = HomeModel(id: "2",name: "North Facing Apartment", rate: "506000", location: "loc 1", bedRoom: "6", restRoom: "6", area: "100")
    let home3 = HomeModel(id: "3",name: "East Facing Apartment", rate: "503", location: "loc 1", bedRoom: "8", restRoom: "2", area: "6000")
    let home4 = HomeModel(id: "4",name: "West Facing Apartment", rate: "54", location: "loc 1", bedRoom: "2", restRoom: "1", area: "5000")
    let home5 = HomeModel(id: "5",name: "Lake View Apartment", rate: "532", location: "loc 1", bedRoom: "3", restRoom: "5", area: "8000")
    let home6 = HomeModel(id: "6",name: "Mountain View Apartment", rate: "55", location: "loc 1", bedRoom: "6", restRoom: "2", area: "900")
    let home7 = HomeModel(id: "7",name: "South Facing Apartment", rate: "598", location: "loc 1", bedRoom: "53", restRoom: "5", area: "987000")
    let home8 = HomeModel(id: "8",name: "South Facing Apartment", rate: "89", location: "loc 1", bedRoom: "6", restRoom: "1", area: "200")
    let home9 = HomeModel(id: "9",name: "South Facing Apartment", rate: "890", location: "loc 1", bedRoom: "9", restRoom: "6", area: "54000")
    let home10 = HomeModel(id: "10",name: "South Facing Apartment", rate: "90", location: "loc 1", bedRoom: "90", restRoom: "8", area: "78000")
    let home11 = HomeModel(id: "11",name: "South Facing Apartment", rate: "0", location: "loc 1", bedRoom: "51", restRoom: "9", area: "7600")
    
    var homeModel1 = [HomeModel]()
    homeModel1.append(home1)
    homeModel1.append(home2)
    homeModel1.append(home3)
    homeModel1.append(home4)
    homeModel1.append(home5)
    
    var homeModel2 = [HomeModel]()
    homeModel2.append(home6)
    homeModel2.append(home7)
    homeModel2.append(home8)
    homeModel2.append(home9)
    homeModel2.append(home10)
    homeModel2.append(home11)
    
    var homeModel3 = [HomeModel]()
    homeModel3.append(home2)
    homeModel3.append(home4)
    homeModel3.append(home6)
    homeModel3.append(home8)
    homeModel3.append(home10)
    
   
    let homePageData1 = HomePageData(label: "Featured", featured: true, data: homeModel1)
    
    let homePageData2 = HomePageData(label: "Currently Available", featured: false, data: homeModel2)
    
    let homePageData3 = HomePageData(label: "Available From June 1", featured: false, data: homeModel3)
    
    var homePageData = [HomePageData]()
    homePageData.append(homePageData1)
    homePageData.append(homePageData2)
    homePageData.append(homePageData3)
    
    return homePageData
}















