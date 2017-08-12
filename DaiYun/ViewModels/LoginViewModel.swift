//
//  LoginViewModel.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/29.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import MJExtension
import SDWebImage

class LoginForm: NSObject {
    var username:String = ""
    var password:String = ""
}

class LoginViewModel: BaseViewModel {
    
    override init() {
        
    }
    
    func requestLogin(_ form:LoginForm,controller:LoginViewController) {
        let dic = ["username":form.username, "password":form.password]
        let url = "\(BaseUrl)\(LoginUrl)"
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: dic as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                UserModel.shareInstance = UserModel.init(fromDictionary: resultDic.value as! NSDictionary)
                if UserModel.shareInstance.saveUserInfo(model: UserModel.shareInstance) {
                    if UserModel.shareInstance.daoqiTime == "4102329600" {
                        NavigaiontPresentView(self.controller!, toController: UINavigationController.init(rootViewController: ProfileViewController()))
                    }else{
                        NavigaiontPresentView(self.controller!, toController: UINavigationController.init(rootViewController: HomeViewController()))
                    }
                }
            }
        }
    }
    
}
