//
//  ShopAPI.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/10.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation
import Moya

let shopProvider = MoyaProvider<ShopAPI>()
let kImageHost = "http://file.joinsilk.com/"


enum ShopAPI {
    case storeList(String)
    case uploadPhoto(Data)
}

extension ShopAPI: TargetType {
    var baseURL: URL {
        return URL.init(string: "https://shopapi.joinsilk.com")!
    }
    
    var path: String {
        return "/store/selectStoreList"
    }
    
    var method: Moya.Method {
        return .post
    }
    //测试数据
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .storeList(let name):
            var params:[String:Any] = [:]
            params["name"] = name
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .uploadPhoto(let data):
            let multipartFormData = MultipartFormData(provider: .data(data), name: "file", fileName: "someImage", mimeType: "multipart/form-data")
            return .uploadCompositeMultipart([multipartFormData], urlParameters: ["token":"token"])
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
