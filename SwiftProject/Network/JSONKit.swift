//
//  JSONKit.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/14.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import Foundation

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
    
    func toJSONString() -> String? {
        if (!JSONSerialization.isValidJSONObject(self)) {
            return nil
        }
        if let newData : Data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            let JSONString = NSString(data:newData as Data,encoding: String.Encoding.utf8.rawValue)
            return JSONString as String? ?? nil
        }
        
        return nil
    }
    func toData() -> Data? {
        if JSONSerialization.isValidJSONObject(self) {
            if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
                return data
            }
        }
        return nil
    }
    func toModel<T : Decodable>(_ type:[T].Type)  -> Array<T>? {
        let decoder = JSONDecoder()
        if let data =  self.toData() {
            if let obj = try? decoder.decode(type, from: data) {
                return obj
            }
        }
        return nil
    }
}


extension Dictionary {
    func toJSONString() -> String? {
        if (!JSONSerialization.isValidJSONObject(self)) {
            return nil
        }
        if let newData : Data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            let JSONString = NSString(data:newData as Data,encoding: String.Encoding.utf8.rawValue)
            return JSONString as String? ?? nil
        }
        
        return nil
    }
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
        return self.data(using: .utf8)
    }
    func toDict() -> [String:Any]? {
        guard let jsonData:Data = self.data(using: .utf8) else {
            return nil
        }
        if let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) {
            return dict as? [String : Any] 
        }
        return nil
    }
}
