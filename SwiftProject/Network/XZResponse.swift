//
//  XZResoonse.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/24.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit

var xzResponseCode = XZResponseCode()

struct XZResponseCode {
    let successCode = 200//请求成功
    let loginLose = 411//登录失效
    var msg = ""
    
//    ...
}
//class BaseResponse {
//    var httpCode:Int?
//    var msg:String?
//    var data:Any?
//}
struct XZResponse: Codable{
    var httpCode:Int
    var msg:String
}
