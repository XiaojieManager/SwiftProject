//
//  XZRequestPlugin.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/11.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//


import Foundation
import Result
import Moya

//弃用，在创建Provider时手动创建的NetworkActivityPlugin（为了支持isShowHUD）
public class RequestLoadingPlugin: PluginType {
    //请求之前配置参数
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }
    public func willSend(_ request: RequestType, target: TargetType) {
            MBProgressHUD.showLoading()
    }
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//        #if DEBUG
//        switch result {
//        case .success(let response):
//            debugPrint(response.data.toDictionary() ?? "")
//        default:
//            break
//        }
//        #else
//        #endif
             MBProgressHUD.dismiss()

    }
    //完成之前修改结果
//    public func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
//        
//    }
}

