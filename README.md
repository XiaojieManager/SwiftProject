# SwiftProject
学习swift 玩的demo

本项目是自己学习swift的记录、实践的过程及结果，会持续不断的更新

## 简单封装Moya，及Codable协议
### Moya
自定义Alamofire.SessionManager

NetworkActivityPlugin （isShowHUD）

......(待续)

使用姿势:

        XZNetwork().request(ShopAPI.storeList("成都市"), progress: nil, success: { (data) in
            self.model = data.toModel(modelType: StoreModel.self)
            DispatchQueue.main.async {
                self.tableView?.mj_header.endRefreshing()
                self.tableView?.reloadData()
            }
        }) { (error) in
            self.tableView?.mj_header.endRefreshing()
        }
        

### Codable

扩展了集合类型，利用Codable 完成Model,Dictionary,Array,String,Data之间的相互转换，详情见：JSONKit

使用姿势：

    let model = data.toModel(modelType: StoreModel.self)
    let dic = model?.toDictionary()
    let jsonStr = dic?.toJSONString()
    ......
    
### 欢迎star
