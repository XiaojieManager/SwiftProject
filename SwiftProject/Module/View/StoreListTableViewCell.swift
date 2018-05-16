//
//  StoreListTableViewCell.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/10.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit
import SnapKit

class StoreListTableViewCell: UITableViewCell {
    var titleLabel:UILabel?
    var contentImageView:UIImageView?
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .none
        self.selectionStyle = .none

        self.titleLabel = UILabel()
        self.contentImageView = UIImageView.init()
        self.contentImageView?.contentMode = .scaleAspectFill
        self.contentImageView?.clipsToBounds = true
        
        self.contentView.addSubview(self.titleLabel!)
        self.contentView.addSubview(self.contentImageView!)
        
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(self.contentImageView!.snp.top)
        })
        self.contentImageView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(200)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
