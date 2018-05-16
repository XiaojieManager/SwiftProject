//
//  StoreModel.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/10.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation

struct StoreModel : MapCodable{
    var data:[DataInfoModel] = []
}
struct DataInfoModel:Codable {
    var iden:String
    var name:String
    var type:String
    var address:String
    var pic:String
    var browseNum:String
    var distance:Int
    var latitude:String
    var longitude:String
    
    enum CodingKeys:String, CodingKey {
        case iden = "id"
        case name
        case type
        case address
        case pic
        case browseNum
        case distance
        case latitude
        case longitude
    }
    
}
