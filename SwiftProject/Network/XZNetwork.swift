//
//  XZNetWork.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/11.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias NetworkAPI = ShopAPI


public class XZNetwork {
    typealias successCallBack = (_ result:Data) -> Void
    typealias failCallBack = (_ error: MoyaError?) -> Void
    
    static func request(target:NetworkAPI, success: @escaping successCallBack, fail: @escaping failCallBack) {
        
        provider.request(target) { result in
            switch result {
            case let  .success(response):
                    if let dic = response.data.toDictionary() {
                        if let httpCode = (dic["httpCode"] as? Int) {//业务层代码
                            if httpCode == 200{
                                success(response.data)
                            }else{
                                fail(nil)
                                MBProgressHUD.showMessage(dic["msg"] as? String)
                            }
                        }
                }
              
            case let .failure(error):
                fail(error)
                MBProgressHUD.showMessage(error.errorDescription ?? "未知错误")
            }
        }
    }
    
}

extension XZNetwork{
    
  
    
    static let provider = XZNetwork.getProvider()
    static func getProvider() -> MoyaProvider<NetworkAPI> {
        var logOpen = false
        #if DEBUG
        logOpen = true
        #endif
        return  MoyaProvider<NetworkAPI>.init( manager: DefaultAlamofireManager.shareManager, plugins:[RequestLoadingPlugin(),NetworkLoggerPlugin.init(verbose: logOpen, cURL: logOpen, output: nil, requestDataFormatter: nil, responseDataFormatter: nil)])
    }
}

final class DefaultAlamofireManager: Alamofire.SessionManager {
    static var shareManager: DefaultAlamofireManager  {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 10
        return DefaultAlamofireManager(configuration: configuration)
    }
}




