//
//  UserModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class UserModel: JKDBModel {
    var daoqiTime : String!
    var endloginTime : String!
    var id : String!
    var nickname : String!
    var password : String!
    var status : String!
    var username : String!
    var zhuceTime : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        daoqiTime = dictionary["daoqi_time"] as? String
        endloginTime = dictionary["endlogin_time"] as? String
        id = dictionary["id"] as? String
        nickname = dictionary["nickname"] as? String
        password = dictionary["password"] as? String
        status = dictionary["status"] as? String
        username = dictionary["username"] as? String
        zhuceTime = dictionary["zhuce_time"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if daoqiTime != nil{
            dictionary["daoqi_time"] = daoqiTime
        }
        if endloginTime != nil{
            dictionary["endlogin_time"] = endloginTime
        }
        if id != nil{
            dictionary["id"] = id
        }
        if nickname != nil{
            dictionary["nickname"] = nickname
        }
        if password != nil{
            dictionary["password"] = password
        }
        if status != nil{
            dictionary["status"] = status
        }
        if username != nil{
            dictionary["username"] = username
        }
        if zhuceTime != nil{
            dictionary["zhuce_time"] = zhuceTime
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        daoqiTime = aDecoder.decodeObject(forKey: "daoqi_time") as? String
        endloginTime = aDecoder.decodeObject(forKey: "endlogin_time") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        nickname = aDecoder.decodeObject(forKey: "nickname") as? String
        password = aDecoder.decodeObject(forKey: "password") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        username = aDecoder.decodeObject(forKey: "username") as? String
        zhuceTime = aDecoder.decodeObject(forKey: "zhuce_time") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if daoqiTime != nil{
            aCoder.encode(daoqiTime, forKey: "daoqi_time")
        }
        if endloginTime != nil{
            aCoder.encode(endloginTime, forKey: "endlogin_time")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if nickname != nil{
            aCoder.encode(nickname, forKey: "nickname")
        }
        if password != nil{
            aCoder.encode(password, forKey: "password")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if username != nil{
            aCoder.encode(username, forKey: "username")
        }
        if zhuceTime != nil{
            aCoder.encode(zhuceTime, forKey: "zhuce_time")
        }
        
    }
    
}
