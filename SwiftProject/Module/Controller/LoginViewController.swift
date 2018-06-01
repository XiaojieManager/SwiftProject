//
//  LoginViewController.swift
//  SwiftProject
//
//  Created by 赵肖杰 on 2018/5/15.
//  Copyright © 2018年 赵肖杰. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

let minimalUsernameLength = 6

class LoginViewController: UIViewController {
    var loginView:LoginView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginView = LoginView.init(frame: self.view.frame)
        self.view.addSubview(self.loginView);
        
        self .bindUI()
        
    }
    func bindUI()  {
       let nameValid = loginView.nameTextField.rx.text.orEmpty
            .map{ $0.count >= minimalUsernameLength }
            .share(replay: 1)
        let passwordValid = loginView.passwordTextField.rx.text.orEmpty
            .map{$0.count >= minimalUsernameLength}
            .share(replay:1)
        let everythingValid = Observable.combineLatest(nameValid, passwordValid) { $0 && $1 }
            .share(replay:1)

        nameValid
            .bind(to: loginView.passwordTextField.rx.isEnabled)
            .disposed(by: disposeBag)


        everythingValid
            .bind(to: loginView.loginBtn.rx.isEnabled)
            .disposed(by: disposeBag)

        loginView.loginBtn.rx.tap
            .subscribe(onNext: {  [weak self]  in
                self?.showAlert()
            })
            .disposed(by: disposeBag)

        
    }
    func showAlert() {
//        let alertView = UIAlertView(
//            title: "RxExample",
//            message: "This is wonderful",
//            delegate: nil,
//            cancelButtonTitle: "OK"
//        )
//        
//        alertView.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
