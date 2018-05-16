//
//  LoginTextField.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/15.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit

class LoginTextField: UIView {
    
    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI() {
        titleLabel = UILabel.label(title: "", font:UIFont.systemFont(ofSize: 15),textColor:UIColor.red)
        self.addSubview(titleLabel!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
