//
//  Define.swift
//  LiangPiao
//
//  Created by Zhang on 28/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

let IPHONE_VERSION = UIDevice.current.systemVersion.floatValue
let IPHONE_VERSION_LAST9 = UIDevice.current.systemVersion.floatValue >= 9 ? 1:0
let IPHONE_VERSION_LAST10 = UIDevice.current.systemVersion.floatValue >= 10 ? 1:0


let IPHONE4 = SwifterSwift.screenHeight == 480 ? true:false
let IPHONE5 = SwifterSwift.screenHeight == 568 ? true:false
let IPHONE6 = SwifterSwift.screenWidth == 344 ? true:false
let IPHONE6P = SwifterSwift.screenWidth == 344 ? true:false

let SCREENWIDTH = SwifterSwift.screenWidth
let SCREENHEIGHT = SwifterSwift.screenHeight

let NotiFicationPostName = "ChangeFillterValue"

enum FollowAndFancsType {
    case Following
    case Followed
    case Follow
}

let LoginStatuesChange = "LoginStatuesChange"


func KWINDOWDS() -> UIWindow{
    let window = UIApplication.shared.keyWindow
    return window!
}

let SHARE_APPLICATION = UIApplication.shared


func AppCallViewShow(_ view:UIView, phone:String) {
    UIAlertController.shwoAlertControl(view.findViewController()!, style: .alert, title: nil, message: phone, titles: nil, cancel: "取消", doneTitle: "确定", cancelAction: {
        
        }, doneAction: {_ in 
           UIApplication.shared.openURL(URL.init(string: "tel:\(phone)")!)
    })
}

func UserDefaultsSetSynchronize(_ value:AnyObject,key:String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func UserDefaultsGetSynchronize(_ key:String) -> AnyObject{
    if UserDefaults.standard.object(forKey: key) == nil {
        return "nil" as AnyObject
    }
    return UserDefaults.standard.object(forKey: key)! as AnyObject
}

func Storyboard(_ name:String,controllerid:String) -> UIViewController{
    return UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: controllerid)
}

func Notification(_ name:String,value:String?) {
    NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: name), object: value)
}


func NavigationPushView(_ formviewController:UIViewController, toConroller:UIViewController) {
    toConroller.hidesBottomBarWhenPushed = true
    formviewController.navigationController?.pushViewController(toConroller, animated: true)
}

func NavigaiontPresentView(_ formViewController:UIViewController, toController:UIViewController) {
    formViewController.present(toController, animated: true) { 
        
    }
}

func MainThreadAlertShow(_ msg:String,view:UIView){
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showMessage(view, msg: msg, autoHidder: true)
    })
}

func MainThreanShowErrorMessage(_ error:AnyObject){
    if error is NSDictionary {
        DispatchQueue.main.async(execute: {
            _ = Tools.shareInstance.showErrorMessage(error)
        })
    }
}

func MainThreanShowNetWorkError(_ error:AnyObject){
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showNetWorkError(error)
    })
}




