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
    var phone:String = ""
    var code:String = ""
}

class LoginViewModel: BaseViewModel {
    
    override init() {
        
    }
    
    func requestLogin(_ form:LoginForm,controller:LoginViewController) {
//        let dic = ["mobile":form.phone, "code":form.code]
//        let url = "\(BaseUrl)\(LoginUrl)"
//        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: dic as AnyObject).observe { (resultDic) in
//            if !resultDic.isCompleted {
//                let userInfo = UserInfoModel.init(dictionary: resultDic.value as! [AnyHashable : Any])
//                userInfo?.tails.saveOrUpdate()
//                userInfo?.tails.userInfo.saveOrUpdate()
//                userInfo?.saveOrUpdate()
//                UserInfoModel.toUserInstance(userInfo)
//                Notification(LoginStatuesChange, value: nil)
//                controller.navigationController?.popViewController(animated: true)
//                
//            }
//        }
    }
    
}
