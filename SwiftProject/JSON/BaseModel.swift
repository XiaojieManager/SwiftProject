//
//  BaseModel.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/11.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation

struct BaseModel<T:Codable> : Codable{
    var httpcode: Int
    var msg:String
    var data:T
}
