//
//  BindMotherInfoModel.swift
//  DaiYun
//
//  Created by Zhang on 21/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class BindMotherInfoModel : NSObject, NSCoding{
    
    var dmInfo : MotherModel!
    var nowStatus : NowStatu!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        
        if let dmInfoData = dictionary["dm_info"] as? NSDictionary{
            dmInfo = MotherModel(fromDictionary: dmInfoData)
        }
        if let nowStatusData = dictionary["now_status"] as? NSDictionary{
            nowStatus = NowStatu(fromDictionary: nowStatusData)
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if dmInfo != nil{
            dictionary["dm_info"] = dmInfo.toDictionary()
        }
        if nowStatus != nil{
            dictionary["now_status"] = nowStatus.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        dmInfo = aDecoder.decodeObject(forKey: "dm_info") as? MotherModel
        nowStatus = aDecoder.decodeObject(forKey: "now_status") as? NowStatu
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if dmInfo != nil{
            aCoder.encode(dmInfo, forKey: "dm_info")
        }
        if nowStatus != nil{
            aCoder.encode(nowStatus, forKey: "now_status")
        }
        
    }
    
}

class NowStatu : NSObject, NSCoding{
    
    var duDaimuId : String!
    var duId : String!
    var duStatus : String!
    var duUserId : String!
    var statusName : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        duDaimuId = dictionary["du_daimu_id"] as? String
        duId = dictionary["du_id"] as? String
        duStatus = dictionary["du_status"] as? String
        duUserId = dictionary["du_user_id"] as? String
        statusName = dictionary["status_name"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if duDaimuId != nil{
            dictionary["du_daimu_id"] = duDaimuId
        }
        if duId != nil{
            dictionary["du_id"] = duId
        }
        if duStatus != nil{
            dictionary["du_status"] = duStatus
        }
        if duUserId != nil{
            dictionary["du_user_id"] = duUserId
        }
        if statusName != nil{
            dictionary["status_name"] = statusName
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        duDaimuId = aDecoder.decodeObject(forKey: "du_daimu_id") as? String
        duId = aDecoder.decodeObject(forKey: "du_id") as? String
        duStatus = aDecoder.decodeObject(forKey: "du_status") as? String
        duUserId = aDecoder.decodeObject(forKey: "du_user_id") as? String
        statusName = aDecoder.decodeObject(forKey: "status_name") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if duDaimuId != nil{
            aCoder.encode(duDaimuId, forKey: "du_daimu_id")
        }
        if duId != nil{
            aCoder.encode(duId, forKey: "du_id")
        }
        if duStatus != nil{
            aCoder.encode(duStatus, forKey: "du_status")
        }
        if duUserId != nil{
            aCoder.encode(duUserId, forKey: "du_user_id")
        }
        if statusName != nil{
            aCoder.encode(statusName, forKey: "status_name")
        }
        
    }
    
}
