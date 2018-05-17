# SwiftProject
学习swift 玩的demo

本项目只是自己学习swift的，记录及实践的过程及结果

## 简单封装Moya，及Codable协议
### Moya
自定义manager

自定义plugins

......(待续)

使用姿势:

        XZNetwork.request(target: .storeList("成都市"), success: { data in
            self.model = data.toModel(modelType: StoreModel.self)
                DispatchQueue.main.async {
                    self.tableView?.mj_header.endRefreshing()
                    self.tableView?.reloadData()
                }
        }) { error in
            self.tableView?.mj_header.endRefreshing()
        }
        

###Codable

扩展了集合类型，直接利用Codable 完成Model,Dictionary,Array,String,Data之间的相互转换，详情见：JSONKit

使用姿势：

    let model = data.toModel(modelType: StoreModel.self)
    let dic = model?.toDictionary()
    let jsonStr = dic?.toJSONString()
    ......
    
###欢迎star
