//
//  LogModel.swift
//  DaiYun
//
//  Created by Zhang on 21/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class LogModel : NSObject, NSCoding{
    
    var dlContent : String!
    var dlDaimu : String!
    var dlId : String!
    var dlImg : String!
    var dlTime : String!
    var dlTitle : String!
    var dlUser : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        dlContent = dictionary["dl_content"] as? String
        dlDaimu = dictionary["dl_daimu"] as? String
        dlId = dictionary["dl_id"] as? String
        dlImg = dictionary["dl_img"] as? String
        dlTime = dictionary["dl_time"] as? String
        dlTitle = dictionary["dl_title"] as? String
        dlUser = dictionary["dl_user"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if dlContent != nil{
            dictionary["dl_content"] = dlContent
        }
        if dlDaimu != nil{
            dictionary["dl_daimu"] = dlDaimu
        }
        if dlId != nil{
            dictionary["dl_id"] = dlId
        }
        if dlImg != nil{
            dictionary["dl_img"] = dlImg
        }
        if dlTime != nil{
            dictionary["dl_time"] = dlTime
        }
        if dlTitle != nil{
            dictionary["dl_title"] = dlTitle
        }
        if dlUser != nil{
            dictionary["dl_user"] = dlUser
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        dlContent = aDecoder.decodeObject(forKey: "dl_content") as? String
        dlDaimu = aDecoder.decodeObject(forKey: "dl_daimu") as? String
        dlId = aDecoder.decodeObject(forKey: "dl_id") as? String
        dlImg = aDecoder.decodeObject(forKey: "dl_img") as? String
        dlTime = aDecoder.decodeObject(forKey: "dl_time") as? String
        dlTitle = aDecoder.decodeObject(forKey: "dl_title") as? String
        dlUser = aDecoder.decodeObject(forKey: "dl_user") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if dlContent != nil{
            aCoder.encode(dlContent, forKey: "dl_content")
        }
        if dlDaimu != nil{
            aCoder.encode(dlDaimu, forKey: "dl_daimu")
        }
        if dlId != nil{
            aCoder.encode(dlId, forKey: "dl_id")
        }
        if dlImg != nil{
            aCoder.encode(dlImg, forKey: "dl_img")
        }
        if dlTime != nil{
            aCoder.encode(dlTime, forKey: "dl_time")
        }
        if dlTitle != nil{
            aCoder.encode(dlTitle, forKey: "dl_title")
        }
        if dlUser != nil{
            aCoder.encode(dlUser, forKey: "dl_user")
        }
        
    }
    
}
