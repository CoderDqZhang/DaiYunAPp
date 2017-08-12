//
//  CollectModel.swift
//  DaiYun
//
//  Created by Zhang on 11/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class CollectModel : NSObject, NSCoding{
    
    var collectionId : String!
    var collectionTime : String!
    var collectionType : String!
    var fId : String!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        collectionId = dictionary["collection_id"] as? String
        collectionTime = dictionary["collection_time"] as? String
        collectionType = dictionary["collection_type"] as? String
        fId = dictionary["f_id"] as? String
        userId = dictionary["user_id"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if collectionId != nil{
            dictionary["collection_id"] = collectionId
        }
        if collectionTime != nil{
            dictionary["collection_time"] = collectionTime
        }
        if collectionType != nil{
            dictionary["collection_type"] = collectionType
        }
        if fId != nil{
            dictionary["f_id"] = fId
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        collectionId = aDecoder.decodeObject(forKey: "collection_id") as? String
        collectionTime = aDecoder.decodeObject(forKey: "collection_time") as? String
        collectionType = aDecoder.decodeObject(forKey: "collection_type") as? String
        fId = aDecoder.decodeObject(forKey: "f_id") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if collectionId != nil{
            aCoder.encode(collectionId, forKey: "collection_id")
        }
        if collectionTime != nil{
            aCoder.encode(collectionTime, forKey: "collection_time")
        }
        if collectionType != nil{
            aCoder.encode(collectionType, forKey: "collection_type")
        }
        if fId != nil{
            aCoder.encode(fId, forKey: "f_id")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        
    }
    
}

class CollectsModel : NSObject, NSCoding{
    
    var collectionId : String!
    var collectionTime : String!
    var collectionType : String!
    var daimuInfo : MotherModel!
    var fId : String!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        collectionId = dictionary["collection_id"] as? String
        collectionTime = dictionary["collection_time"] as? String
        collectionType = dictionary["collection_type"] as? String
        if let daimuInfoData = dictionary["daimu_info"] as? NSDictionary{
            daimuInfo = MotherModel(fromDictionary: daimuInfoData)
        }
        fId = dictionary["f_id"] as? String
        userId = dictionary["user_id"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if collectionId != nil{
            dictionary["collection_id"] = collectionId
        }
        if collectionTime != nil{
            dictionary["collection_time"] = collectionTime
        }
        if collectionType != nil{
            dictionary["collection_type"] = collectionType
        }
        if daimuInfo != nil{
            dictionary["daimu_info"] = daimuInfo.toDictionary()
        }
        if fId != nil{
            dictionary["f_id"] = fId
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        collectionId = aDecoder.decodeObject(forKey: "collection_id") as? String
        collectionTime = aDecoder.decodeObject(forKey: "collection_time") as? String
        collectionType = aDecoder.decodeObject(forKey: "collection_type") as? String
        daimuInfo = aDecoder.decodeObject(forKey: "daimu_info") as? MotherModel
        fId = aDecoder.decodeObject(forKey: "f_id") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if collectionId != nil{
            aCoder.encode(collectionId, forKey: "collection_id")
        }
        if collectionTime != nil{
            aCoder.encode(collectionTime, forKey: "collection_time")
        }
        if collectionType != nil{
            aCoder.encode(collectionType, forKey: "collection_type")
        }
        if daimuInfo != nil{
            aCoder.encode(daimuInfo, forKey: "daimu_info")
        }
        if fId != nil{
            aCoder.encode(fId, forKey: "f_id")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        
    }
    
}
