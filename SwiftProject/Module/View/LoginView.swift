//
//  LoginView.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/15.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    var nameTextField:UITextField!
    var passwordTextField:UITextField!
    var loginBtn:UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI() {
        self.backgroundColor = UIColor.white
        nameTextField = UITextField.textField(placeholder: "请输入姓名", font: UIFont.systemFont(ofSize: 15), textColor: UIColor.black)
        passwordTextField = UITextField.textField(placeholder: "请输入密码", font: UIFont.systemFont(ofSize: 15), textColor: UIColor.black)
        nameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .line
        loginBtn = UIButton.button(title: "登录", font: UIFont.systemFont(ofSize: 16), titleColor: UIColor.white)
        loginBtn.backgroundColor = UIColor.red
        loginBtn .setTitleColor(UIColor.black, for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .disabled)
//        loginBtn.isEnabled = false
        
        self.addSubview(nameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginBtn)
        
        nameTextField.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(self).offset(80)
            make.height.equalTo(50)
        })
        passwordTextField.snp.makeConstraints({ (make) in
            make.top.equalTo(self.nameTextField.snp.bottom).offset(30)
            make.left.right.height.equalTo(self.nameTextField)
        })
        loginBtn.snp.makeConstraints({ (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(50)
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(44)
        })
        
        
    }
   @objc func loginBtnAction () {
        print("dadadadda")
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
