//
//  MotherModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MotherModel : NSObject, NSCoding{
    
    var dmBirth : String!
    var dmBirthday : String!
    var dmComplications : String!
    var dmCsection : String!
    var dmEthnic : String!
    var dmExperiencde : String!
    var dmHealth : String!
    var dmHeight : String!
    var dmId : String!
    var dmLocation : String!
    var dmLost : String!
    var dmMarriage : String!
    var dmMedical : String!
    var dmMiscarriage : String!
    var dmName : String!
    var dmNote : String!
    var dmPic : String!
    var dmRestrictions : String!
    var dmWeight : String!
    var dmYuyueStatus : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        dmBirth = dictionary["dm_birth"] as? String
        dmBirthday = dictionary["dm_birthday"] as? String
        dmComplications = dictionary["dm_complications"] as? String
        dmCsection = dictionary["dm_csection"] as? String
        dmEthnic = dictionary["dm_ethnic"] as? String
        dmExperiencde = dictionary["dm_experiencde"] as? String
        dmHealth = dictionary["dm_health"] as? String
        dmHeight = dictionary["dm_height"] as? String
        dmId = dictionary["dm_id"] as? String
        dmLocation = dictionary["dm_location"] as? String
        dmLost = dictionary["dm_lost"] as? String
        dmMarriage = dictionary["dm_marriage"] as? String
        dmMedical = dictionary["dm_medical"] as? String
        dmMiscarriage = dictionary["dm_miscarriage"] as? String
        dmName = dictionary["dm_name"] as? String
        dmNote = dictionary["dm_note"] as? String
        dmPic = dictionary["dm_pic"] as? String
        dmRestrictions = dictionary["dm_restrictions"] as? String
        dmWeight = dictionary["dm_weight"] as? String
        dmYuyueStatus = dictionary["dm_yuyue_status"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if dmBirth != nil{
            dictionary["dm_birth"] = dmBirth
        }
        if dmBirthday != nil{
            dictionary["dm_birthday"] = dmBirthday
        }
        if dmComplications != nil{
            dictionary["dm_complications"] = dmComplications
        }
        if dmCsection != nil{
            dictionary["dm_csection"] = dmCsection
        }
        if dmEthnic != nil{
            dictionary["dm_ethnic"] = dmEthnic
        }
        if dmExperiencde != nil{
            dictionary["dm_experiencde"] = dmExperiencde
        }
        if dmHealth != nil{
            dictionary["dm_health"] = dmHealth
        }
        if dmHeight != nil{
            dictionary["dm_height"] = dmHeight
        }
        if dmId != nil{
            dictionary["dm_id"] = dmId
        }
        if dmLocation != nil{
            dictionary["dm_location"] = dmLocation
        }
        if dmLost != nil{
            dictionary["dm_lost"] = dmLost
        }
        if dmMarriage != nil{
            dictionary["dm_marriage"] = dmMarriage
        }
        if dmMedical != nil{
            dictionary["dm_medical"] = dmMedical
        }
        if dmMiscarriage != nil{
            dictionary["dm_miscarriage"] = dmMiscarriage
        }
        if dmName != nil{
            dictionary["dm_name"] = dmName
        }
        if dmNote != nil{
            dictionary["dm_note"] = dmNote
        }
        if dmPic != nil{
            dictionary["dm_pic"] = dmPic
        }
        if dmRestrictions != nil{
            dictionary["dm_restrictions"] = dmRestrictions
        }
        if dmWeight != nil{
            dictionary["dm_weight"] = dmWeight
        }
        if dmYuyueStatus != nil{
            dictionary["dm_yuyue_status"] = dmYuyueStatus
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        dmBirth = aDecoder.decodeObject(forKey: "dm_birth") as? String
        dmBirthday = aDecoder.decodeObject(forKey: "dm_birthday") as? String
        dmComplications = aDecoder.decodeObject(forKey: "dm_complications") as? String
        dmCsection = aDecoder.decodeObject(forKey: "dm_csection") as? String
        dmEthnic = aDecoder.decodeObject(forKey: "dm_ethnic") as? String
        dmExperiencde = aDecoder.decodeObject(forKey: "dm_experiencde") as? String
        dmHealth = aDecoder.decodeObject(forKey: "dm_health") as? String
        dmHeight = aDecoder.decodeObject(forKey: "dm_height") as? String
        dmId = aDecoder.decodeObject(forKey: "dm_id") as? String
        dmLocation = aDecoder.decodeObject(forKey: "dm_location") as? String
        dmLost = aDecoder.decodeObject(forKey: "dm_lost") as? String
        dmMarriage = aDecoder.decodeObject(forKey: "dm_marriage") as? String
        dmMedical = aDecoder.decodeObject(forKey: "dm_medical") as? String
        dmMiscarriage = aDecoder.decodeObject(forKey: "dm_miscarriage") as? String
        dmName = aDecoder.decodeObject(forKey: "dm_name") as? String
        dmNote = aDecoder.decodeObject(forKey: "dm_note") as? String
        dmPic = aDecoder.decodeObject(forKey: "dm_pic") as? String
        dmRestrictions = aDecoder.decodeObject(forKey: "dm_restrictions") as? String
        dmWeight = aDecoder.decodeObject(forKey: "dm_weight") as? String
        dmYuyueStatus = aDecoder.decodeObject(forKey: "dm_yuyue_status") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if dmBirth != nil{
            aCoder.encode(dmBirth, forKey: "dm_birth")
        }
        if dmBirthday != nil{
            aCoder.encode(dmBirthday, forKey: "dm_birthday")
        }
        if dmComplications != nil{
            aCoder.encode(dmComplications, forKey: "dm_complications")
        }
        if dmCsection != nil{
            aCoder.encode(dmCsection, forKey: "dm_csection")
        }
        if dmEthnic != nil{
            aCoder.encode(dmEthnic, forKey: "dm_ethnic")
        }
        if dmExperiencde != nil{
            aCoder.encode(dmExperiencde, forKey: "dm_experiencde")
        }
        if dmHealth != nil{
            aCoder.encode(dmHealth, forKey: "dm_health")
        }
        if dmHeight != nil{
            aCoder.encode(dmHeight, forKey: "dm_height")
        }
        if dmId != nil{
            aCoder.encode(dmId, forKey: "dm_id")
        }
        if dmLocation != nil{
            aCoder.encode(dmLocation, forKey: "dm_location")
        }
        if dmLost != nil{
            aCoder.encode(dmLost, forKey: "dm_lost")
        }
        if dmMarriage != nil{
            aCoder.encode(dmMarriage, forKey: "dm_marriage")
        }
        if dmMedical != nil{
            aCoder.encode(dmMedical, forKey: "dm_medical")
        }
        if dmMiscarriage != nil{
            aCoder.encode(dmMiscarriage, forKey: "dm_miscarriage")
        }
        if dmName != nil{
            aCoder.encode(dmName, forKey: "dm_name")
        }
        if dmNote != nil{
            aCoder.encode(dmNote, forKey: "dm_note")
        }
        if dmPic != nil{
            aCoder.encode(dmPic, forKey: "dm_pic")
        }
        if dmRestrictions != nil{
            aCoder.encode(dmRestrictions, forKey: "dm_restrictions")
        }
        if dmWeight != nil{
            aCoder.encode(dmWeight, forKey: "dm_weight")
        }
        if dmYuyueStatus != nil{
            aCoder.encode(dmYuyueStatus, forKey: "dm_yuyue_status")
        }
        
    }
    
}
