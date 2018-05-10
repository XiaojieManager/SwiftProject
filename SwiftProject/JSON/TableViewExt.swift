//
//  TableViewExt.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/10.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit

let kWidth:CGFloat = UIScreen.main.bounds.size.width
let kHeight:CGFloat = UIScreen.main.bounds.size.height


extension UITableView {
    static func creatTableView(_ delegate: Any) -> UITableView {
        let tableView:UITableView = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: kWidth, height: kHeight)), style: .plain)
        tableView.delegate = delegate as? UITableViewDelegate
        tableView.dataSource = delegate as? UITableViewDataSource
        tableView.separatorStyle = .none
        tableView.scrollsToTop = true

        return tableView
    }
}

