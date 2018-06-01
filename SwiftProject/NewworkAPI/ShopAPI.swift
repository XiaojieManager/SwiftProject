//
//  ShopAPI.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/10.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation
import Moya

let kImageHost = "http://file.joinsilk.com/"

protocol MoyaAddable {
    var isShowHud:Bool { get }
    var isOpenLog:Bool { get }
    
}

enum ShopAPI {
    case storeList(String)
    case uploadPhoto(Data)
}

extension ShopAPI: TargetType,MoyaAddable {
 
    //MoyaAddable
    var isShowHud: Bool {
        switch self {
        case .storeList(_):
            return false
        default:
            return true
        }
    }
    var isOpenLog: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    //TargetType
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
            return .requestParameters(parameters: customParams(&params), encoding: URLEncoding.default)
        case .uploadPhoto(let data):
            let multipartFormData = MultipartFormData(provider: .data(data), name: "file", fileName: "someImage", mimeType: "multipart/form-data")
            return .uploadCompositeMultipart([multipartFormData], urlParameters: ["token":"token"])
        }
        
    }
    
    
    var headers: [String : String]? {
        return nil
    }
    
    func customParams(_ params:inout [String:Any]) -> [String:Any] {
        params["token"] = "12313131313131"
        return params
    }
}
