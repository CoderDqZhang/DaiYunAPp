//
//  PDFModel.swift
//  DaiYun
//
//  Created by Zhang on 21/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class PDFModel: NSObject, NSCoding{
    
    var paId : String!
    var paName : String!
    var paSrc : String!
    var paTime : String!
    var paType : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        paId = dictionary["pa_id"] as? String
        paName = dictionary["pa_name"] as? String
        paSrc = dictionary["pa_src"] as? String
        paTime = dictionary["pa_time"] as? String
        paType = dictionary["pa_type"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if paId != nil{
            dictionary["pa_id"] = paId
        }
        if paName != nil{
            dictionary["pa_name"] = paName
        }
        if paSrc != nil{
            dictionary["pa_src"] = paSrc
        }
        if paTime != nil{
            dictionary["pa_time"] = paTime
        }
        if paType != nil{
            dictionary["pa_type"] = paType
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        paId = aDecoder.decodeObject(forKey: "pa_id") as? String
        paName = aDecoder.decodeObject(forKey: "pa_name") as? String
        paSrc = aDecoder.decodeObject(forKey: "pa_src") as? String
        paTime = aDecoder.decodeObject(forKey: "pa_time") as? String
        paType = aDecoder.decodeObject(forKey: "pa_type") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if paId != nil{
            aCoder.encode(paId, forKey: "pa_id")
        }
        if paName != nil{
            aCoder.encode(paName, forKey: "pa_name")
        }
        if paSrc != nil{
            aCoder.encode(paSrc, forKey: "pa_src")
        }
        if paTime != nil{
            aCoder.encode(paTime, forKey: "pa_time")
        }
        if paType != nil{
            aCoder.encode(paType, forKey: "pa_type")
        }
        
    }
    
}
