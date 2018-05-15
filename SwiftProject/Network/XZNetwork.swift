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

let provider = MoyaProvider<NetworkAPI>.init( manager: DefaultAlamofireManager.shareManager, plugins:[RequestLoadingPlugin()])

public class XZNetwork {
    typealias successCallBack = (_ result:Data) -> Void
    typealias failCallBack = (_ error: MoyaError?) -> Void
    
    static func request(target:NetworkAPI, success: @escaping successCallBack, fail: @escaping failCallBack) {
        
        provider.request(target) { result in
            switch result {
            case let  .success(response):
                    if let dic = response.data.toDictionary() {
                        if let httpCode = (dic["httpCode"] as? Int) {
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


final class DefaultAlamofireManager: Alamofire.SessionManager {
    static var shareManager: DefaultAlamofireManager  {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 3
        configuration.timeoutIntervalForResource = 3
        return DefaultAlamofireManager(configuration: configuration)
    }
}




