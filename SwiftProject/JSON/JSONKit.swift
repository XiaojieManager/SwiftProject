//
//  JSONKit.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/14.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation

protocol MapCodable: Codable {
    
}
extension MapCodable{ //系统 Codable 协议 不允许扩展
    func toData() -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted //输出格式好看点
        do {
           return  try encoder.encode(self)
        } catch  {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}

extension Data {
    func toModel<T:Codable>(modelType:T.Type) -> T? {
        do {
            return try JSONDecoder.init().decode(modelType, from: self)
        } catch {
            debugPrint(error.localizedDescription)
            return  nil
        }
    }
    func toDictionary() -> Dictionary<String,Any>? {
        if let dic = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) {
            if let result = dic as? Dictionary<String,Any>{
                return result
            }
        }
        return nil
    }
    func toArray() -> Array<Any>? {
        if let arr = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) {
            if let result = arr as? Array<Any>{
                return result
            }
        }
        return nil
    }
    func toString() -> String? {
        return String.init(data: self, encoding: .utf8)
    }
    
}

extension Array {
    
    func toData() -> Data? {
        if JSONSerialization.isValidJSONObject(self) {
            if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
                return data
            }
        }
        return nil
    }
}


extension Dictionary {
    func toData() -> Data? {
        if JSONSerialization.isValidJSONObject(self) {
            if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
                return data
            }
        }
        return nil
    }
}


extension String {
    func toData() -> Data? {
        if (!JSONSerialization.isValidJSONObject(self)) {
            return nil
        }
        return self.data(using: .utf8)
    }
}
