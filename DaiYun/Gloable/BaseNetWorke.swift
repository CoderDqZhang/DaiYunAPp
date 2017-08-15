//
//  BaseNetWorke.swift
//  LiangPiao
//
//  Created by Zhang on 28/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit
import Alamofire
import Result
import ReactiveSwift
import MBProgressHUD
import Photos
import SwifterSwift

typealias SuccessClouse = (_ responseObject:AnyObject) -> Void
typealias FailureClouse = (_ responseError:AnyObject) -> Void

enum HttpRequestType {
    case post
    case get
    case delete
    case put
}

class BaseNetWorke {


    fileprivate init() {
    
    }
    
    static let sharedInstance = BaseNetWorke()
    //加一个特使标识，首页请求失败
    /// getRequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号

    func getUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.get, url: url, parameters: parameters, success: { (responseObject) in
                if ((responseObject is NSDictionary) && (responseObject as! NSDictionary).object(forKey: "status") as! String == "success"){
                    subscriber.send(value: responseObject["data"]!)
                }else{
                    MainThreanShowErrorMessage(["message":"出现错误"] as AnyObject)
                }
            }, failure: { (responseError) in
                if responseError is NSDictionary {
                    MainThreanShowErrorMessage(responseError)
                }
                subscriber.sendCompleted()
            })
            return nil
        })
    }
    /// postRequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func postUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.post, url: url, parameters: parameters, success: { (responseObject) in
                if ((responseObject is NSDictionary) && (responseObject as! NSDictionary).object(forKey: "status") as! String == "success"){
                    if url == "\(BaseUrl)\(MotherCollectDeleteUrl)" || url == "\(BaseUrl)\(MotherCollectAddUrl)" || url == "\(BaseUrl)\(MotherCollectStatusUrl)" {
                        subscriber.send(value: responseObject)
                    }else{
                        subscriber.send(value: responseObject["data"]! ?? "")
                    }
                }else{
                    if url == "\(BaseUrl)\(MotherCollectDeleteUrl)" || url == "\(BaseUrl)\(MotherCollectAddUrl)" || url == "\(BaseUrl)\(MotherCollectStatusUrl)" {
                        subscriber.send(value: responseObject)
                    }else{
                        MainThreanShowErrorMessage(["message":"出现错误"] as AnyObject)
                    }
                }
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        print(responseError)
                        MainThreanShowNetWorkError(responseError)
                    }
                subscriber.sendCompleted()
            })
            return nil
        })
        
    }
    
    /// Putrequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func putUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.put, url: url, parameters: parameters, success: { (responseObject) in
                if ((responseObject is NSDictionary) && (responseObject as! NSDictionary).object(forKey: "status") as! String == "success"){
                    subscriber.send(value: responseObject["data"]!)
                }else{
                    MainThreanShowErrorMessage(["message":"出现错误"] as AnyObject)
                }
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        MainThreanShowNetWorkError(responseError)
                    }
                subscriber.sendCompleted()
            })
            return nil
        })
    }
    
    /// 删除request
    ///
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func deleteUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            self.httpRequest(.delete, url: url, parameters: parameters, success: { (responseObject) in
                if ((responseObject is NSDictionary) && (responseObject as! NSDictionary).object(forKey: "status") as! String == "success"){
                    subscriber.send(value: responseObject["data"]!)
                }else{
                    MainThreanShowErrorMessage(["message":"出现错误"] as AnyObject)
                }
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        MainThreanShowNetWorkError(responseError)
                    }
                subscriber.sendCompleted()
            })
            return nil
        })
    }
    
    func uploadDevilyPushFile(_ url:String, paratemates:NSDictionary) ->Signal<Any, NSError> {
        var allKey = paratemates.allKeys
        var allValue = paratemates.allValues
        return Signal.init({ (subscriber) -> Disposable? in
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                for i in 0...allKey.count - 1 {
                    multipartFormData.append(URL.init(fileURLWithPath: allValue[i] as! String), withName: allKey[i] as! String)
                }
            }, usingThreshold: 1, to: url, method: .post, headers: [
                "content-type": "multipart/form-data",
                "cache-control": "no-cache"
            ]) { (encodingResult) in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                            subscriber.send(value: response.result.value!)
                        }else{
                            subscriber.send(value: ["fail":"error"])
                        }
                        subscriber.sendCompleted()
                    }
                case .failure(let encodingError):
                    subscriber.send(value: ["fail":"服务器请求失败"])
                    print(encodingError)
                    subscriber.sendCompleted()
                }
                subscriber.sendCompleted()
            }
            return nil
        })
    }
    
    
    func uploadDataFile(_ url:String, parameters:NSDictionary?, images:NSDictionary?, hud:MBProgressHUD?) ->Signal<Any, NSError> {
        return Signal.init({ (subscriber) -> Disposable? in
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if parameters != nil {
                    for i in 0...(parameters!).allValues.count - 1 {
                        multipartFormData.append((parameters!.allValues[i] as! String).data(using: String.Encoding.utf8, allowLossyConversion: true)!, withName: parameters!.allKeys[i] as! String)
                    }
                }
                
                if images != nil {
                    for j in 0...(images!).allValues.count - 1 {
                        multipartFormData.append(URL.init(fileURLWithPath: images!.allValues[j]  as! String), withName: images!.allKeys[j] as! String)
                    }
                }
                
            }, usingThreshold: 1, to: url, method: .post, headers: [
                "content-type": "multipart/form-data",
                "cache-control": "no-cache"
            ]) { (encodingResult) in
                print(encodingResult)
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString(completionHandler: { (response) in
                        if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                            let value = self.jsonStringToDic(response.result.value!)
                            subscriber.send(value: value)
                        }else{
                            _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                        }
                        if hud != nil {
                            Tools.shareInstance.hiddenLoading(hud: hud!)
                        }
                    })
                case .failure(let encodingError):
                    print(encodingError)
                    if hud != nil {
                        Tools.shareInstance.hiddenLoading(hud: hud!)
                    }
                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                    subscriber.sendCompleted()
                }
            }
            return nil
        })
    }
    
    ///
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func httpRequest(_ type:HttpRequestType,url:String, parameters:AnyObject?, success:@escaping SuccessClouse, failure:@escaping FailureClouse) {
        var methods:HTTPMethod
        switch type {
            case .post:
                methods = HTTPMethod.post
            case .get:
                methods = HTTPMethod.get
            case .delete:
                methods = HTTPMethod.delete
            default:
                methods = HTTPMethod.put
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let headers = [
            "cache-control": "no-cache",
            "postman-token": "8b9d0d7a-7f8f-808f-4fcc-69e2519e7283"
        ]


        Alamofire.request(url, method: methods, parameters: parameters as? [String: Any], encoding:URLEncoding.default, headers: headers).response { (response) in
            print(response)
        }
        
        
        Alamofire.request(url, method: methods, parameters: parameters as? [String: Any], encoding:URLEncoding.default, headers: headers).responseJSON { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            NetWorkingResponse.sharedInstance.showNetWorkingResPonse(response as AnyObject)
            if response.result.error != nil{
                failure(response.result.error! as AnyObject)
            }else{
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    success(response.result.value! as AnyObject)
                }else{
                    failure(response.result.value! as AnyObject)
                }
            }
        }
    }
    
    
    func jsonStringToDic(_ dictionary_temp:String) ->NSDictionary {
        let data = dictionary_temp.data(using: String.Encoding.utf8)! as NSData
        let dictionary_temp_temp = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
        return dictionary_temp_temp as! NSDictionary
        
    }
    
    func getTimeNow() ->String {
        let timeInterval:TimeInterval = Date.init().timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)!"
    }
    
    
}
