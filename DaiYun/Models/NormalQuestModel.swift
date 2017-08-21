//
//  NormalQuestModel.swift
//  DaiYun
//
//  Created by Zhang on 21/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class NormalQuestModel : NSObject, NSCoding{
    
    var flAnswer : String!
    var flId : String!
    var flQuestion : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        flAnswer = dictionary["fl_answer"] as? String
        flId = dictionary["fl_id"] as? String
        flQuestion = dictionary["fl_question"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if flAnswer != nil{
            dictionary["fl_answer"] = flAnswer
        }
        if flId != nil{
            dictionary["fl_id"] = flId
        }
        if flQuestion != nil{
            dictionary["fl_question"] = flQuestion
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        flAnswer = aDecoder.decodeObject(forKey: "fl_answer") as? String
        flId = aDecoder.decodeObject(forKey: "fl_id") as? String
        flQuestion = aDecoder.decodeObject(forKey: "fl_question") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if flAnswer != nil{
            aCoder.encode(flAnswer, forKey: "fl_answer")
        }
        if flId != nil{
            aCoder.encode(flId, forKey: "fl_id")
        }
        if flQuestion != nil{
            aCoder.encode(flQuestion, forKey: "fl_question")
        }
        
    }
    
}
