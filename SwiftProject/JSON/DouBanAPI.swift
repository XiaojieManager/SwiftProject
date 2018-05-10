//
//  DouBanAPI.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/9.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation
import Moya

let DouBanProvider = MoyaProvider<DouBan>()

/** 下面定义豆瓣FM请求的endpoints（供provider使用）**/

//请求分类
public enum DouBan {
    case channerls
    case playlist(String)
    case login(phone:String,password:String)
}
//请求配置

extension DouBan: TargetType {
    //服务器地址

    public var baseURL: URL {
        switch self {
        case .channerls:
            return URL.init(string: "https://www.douban.com")!
        case .playlist(_):
            return URL.init(string: "https://douban.fm")!
        case .login(phone: _, password: _):
            return URL.init(string: "https://shopapi.joinsilk.com")!
        }
    }
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .channerls:
            return "/j/app/radio/channels"
        case .playlist(_):
            return "/j/mine/playlist"
        case .login(phone: _, password: _):
            return "/user/login"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login(phone: _, password: _):
            return .post
        default:
            return .get
        }
    }
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .playlist(let channel):
            var params: [String : Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case let  .login(phone, password):
            var params:[String:Any] = [:]
            params["account"] = phone
            params["password"] = password
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    //请求头
    public var headers: [String : String]? {
        return nil
    }
    
    
}
