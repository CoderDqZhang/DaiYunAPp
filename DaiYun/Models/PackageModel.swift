//
//  PackageModel.swift
//  DaiYun
//
//  Created by Zhang on 12/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class PackageModel : NSObject, NSCoding{
    
    var tcCreatTime : String!
    var tcId : String!
    var tcMoney : String!
    var tcName : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        tcCreatTime = dictionary["tc_creat_time"] as? String
        tcId = dictionary["tc_id"] as? String
        tcMoney = dictionary["tc_money"] as? String
        tcName = dictionary["tc_name"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if tcCreatTime != nil{
            dictionary["tc_creat_time"] = tcCreatTime
        }
        if tcId != nil{
            dictionary["tc_id"] = tcId
        }
        if tcMoney != nil{
            dictionary["tc_money"] = tcMoney
        }
        if tcName != nil{
            dictionary["tc_name"] = tcName
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        tcCreatTime = aDecoder.decodeObject(forKey: "tc_creat_time") as? String
        tcId = aDecoder.decodeObject(forKey: "tc_id") as? String
        tcMoney = aDecoder.decodeObject(forKey: "tc_money") as? String
        tcName = aDecoder.decodeObject(forKey: "tc_name") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if tcCreatTime != nil{
            aCoder.encode(tcCreatTime, forKey: "tc_creat_time")
        }
        if tcId != nil{
            aCoder.encode(tcId, forKey: "tc_id")
        }
        if tcMoney != nil{
            aCoder.encode(tcMoney, forKey: "tc_money")
        }
        if tcName != nil{
            aCoder.encode(tcName, forKey: "tc_name")
        }
        
    }
    
}

class PackageDescModel : NSObject, NSCoding{
    
    var tcCreatTime : String!
    var tcId : String!
    var tcMoney : String!
    var tcName : String!
    var values : [Value]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        tcCreatTime = dictionary["tc_creat_time"] as? String
        tcId = dictionary["tc_id"] as? String
        tcMoney = dictionary["tc_money"] as? String
        tcName = dictionary["tc_name"] as? String
        values = [Value]()
        if let valueArray = dictionary["value"] as? [NSDictionary]{
            for dic in valueArray{
                let value = Value(fromDictionary: dic)
                values.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if tcCreatTime != nil{
            dictionary["tc_creat_time"] = tcCreatTime
        }
        if tcId != nil{
            dictionary["tc_id"] = tcId
        }
        if tcMoney != nil{
            dictionary["tc_money"] = tcMoney
        }
        if tcName != nil{
            dictionary["tc_name"] = tcName
        }
        if values != nil{
            var dictionaryElements = [NSDictionary]()
            for valueElement in values {
                dictionaryElements.append(valueElement.toDictionary())
            }
            dictionary["value"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        tcCreatTime = aDecoder.decodeObject(forKey: "tc_creat_time") as? String
        tcId = aDecoder.decodeObject(forKey: "tc_id") as? String
        tcMoney = aDecoder.decodeObject(forKey: "tc_money") as? String
        tcName = aDecoder.decodeObject(forKey: "tc_name") as? String
        values = aDecoder.decodeObject(forKey: "value") as? [Value]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if tcCreatTime != nil{
            aCoder.encode(tcCreatTime, forKey: "tc_creat_time")
        }
        if tcId != nil{
            aCoder.encode(tcId, forKey: "tc_id")
        }
        if tcMoney != nil{
            aCoder.encode(tcMoney, forKey: "tc_money")
        }
        if tcName != nil{
            aCoder.encode(tcName, forKey: "tc_name")
        }
        if values != nil{
            aCoder.encode(values, forKey: "value")
        }
        
    }
    
}

class Value : NSObject, NSCoding{
    
    var tcvId : String!
    var tcvName : String!
    var tcvType : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        tcvId = dictionary["tcv_id"] as? String
        tcvName = dictionary["tcv_name"] as? String
        tcvType = dictionary["tcv_type"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if tcvId != nil{
            dictionary["tcv_id"] = tcvId
        }
        if tcvName != nil{
            dictionary["tcv_name"] = tcvName
        }
        if tcvType != nil{
            dictionary["tcv_type"] = tcvType
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        tcvId = aDecoder.decodeObject(forKey: "tcv_id") as? String
        tcvName = aDecoder.decodeObject(forKey: "tcv_name") as? String
        tcvType = aDecoder.decodeObject(forKey: "tcv_type") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if tcvId != nil{
            aCoder.encode(tcvId, forKey: "tcv_id")
        }
        if tcvName != nil{
            aCoder.encode(tcvName, forKey: "tcv_name")
        }
        if tcvType != nil{
            aCoder.encode(tcvType, forKey: "tcv_type")
        }
        
    }
    
}

class PackageAllValueModel : NSObject, NSCoding{
    
    var taocanValueList : [Value]!
    var tvtId : String!
    var tvtName : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        taocanValueList = [Value]()
        if let taocanValueListArray = dictionary["taocan_value_list"] as? [NSDictionary]{
            for dic in taocanValueListArray{
                let value = Value(fromDictionary: dic)
                taocanValueList.append(value)
            }
        }
        tvtId = dictionary["tvt_id"] as? String
        tvtName = dictionary["tvt_name"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if taocanValueList != nil{
            var dictionaryElements = [NSDictionary]()
            for taocanValueListElement in taocanValueList {
                dictionaryElements.append(taocanValueListElement.toDictionary())
            }
            dictionary["taocan_value_list"] = dictionaryElements
        }
        if tvtId != nil{
            dictionary["tvt_id"] = tvtId
        }
        if tvtName != nil{
            dictionary["tvt_name"] = tvtName
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        taocanValueList = aDecoder.decodeObject(forKey: "taocan_value_list") as? [Value]
        tvtId = aDecoder.decodeObject(forKey: "tvt_id") as? String
        tvtName = aDecoder.decodeObject(forKey: "tvt_name") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if taocanValueList != nil{
            aCoder.encode(taocanValueList, forKey: "taocan_value_list")
        }
        if tvtId != nil{
            aCoder.encode(tvtId, forKey: "tvt_id")
        }
        if tvtName != nil{
            aCoder.encode(tvtName, forKey: "tvt_name")
        }
        
    }
    
}
