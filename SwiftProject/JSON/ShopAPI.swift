//
//  ShopAPI.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/10.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation
import Moya

let ShopProvider = MoyaProvider<Shop>()
let kImageHost = "http://file.joinsilk.com/"
enum Shop {
    case storeList(String)
}

extension Shop: TargetType {
    var baseURL: URL {
        return URL.init(string: "https://shopapi.joinsilk.com")!
    }
    
    var path: String {
        return "/store/selectStoreList"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .storeList(let name):
            var params:[String:Any] = [:]
            params["name"] = name
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
