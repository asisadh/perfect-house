//
//  HomePageModel.swift
//  Houseperfect
//
//  Created by Aashish Adhikari on 4/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

struct HomePageModel: Codable {
    let status: Bool
    let data: [HomePageData]
}

struct HomePageData: Codable{
    let label: String
    let featured: Bool
    let data: [HomeModel]
}

struct HomeModel: Codable{
    let id: String
    let name: String
    let rate: String
    let location: String
    let bedRoom: String
    let restRoom: String
    let area: String
}


/**
 
 {
 
 status: true,
 data:
 [
 {
 label: Featured,
 fetured: true,
 data:[
 {
 id: 1,
 rate: something,
 laocation: sasa,
 bed_room: 5,
 rest_room: 6,
 area: 78782
 },
 {},
 {},
 {}
 ]
 },
 
 [
 {},
 {},
 {},
 {}
 ],
 
 [
 {},
 {},
 {},
 {}
 ],
 
 [
 {},
 {},
 {},
 {}
 ],
 
 }
 
 
 **/
