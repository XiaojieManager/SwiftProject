//
//  LoginView.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/15.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveSwift

class LoginView: UIView {
    
    var nameTextField:UITextField?
    var passwordTextField:UITextField?
    var loginBtn:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI() {
        nameTextField = UITextField.textField(placeholder: nil, font: UIFont.systemFont(ofSize: 15), textColor: UIColor.black)
        passwordTextField = UITextField.textField(placeholder: nil, font: UIFont.systemFont(ofSize: 15), textColor: UIColor.black)
        loginBtn = UIButton.button(title: "登录", font: UIFont.systemFont(ofSize: 16), titleColor: UIColor.blue)
        self.addSubview(nameTextField!)
        self.addSubview(passwordTextField!)
        self.addSubview(loginBtn!)
        
        nameTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(self).offset(80)
            make.height.equalTo(50)
        })
        passwordTextField?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.nameTextField!.snp.bottom).offset(30)
            make.left.right.height.equalTo(self.nameTextField!)
        })
        loginBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.passwordTextField!.snp.bottom).offset(50)
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(44)
        })
        
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
