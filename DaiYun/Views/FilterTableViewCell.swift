//
//  FilterTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(text:String){
        self.textLabel?.text = text
        self.updateTextColor(select: false)
    }
    
    func updateTextColor(select:Bool){
        self.textLabel?.textColor = select ? UIColor.init(hexString: App_Theme_FB718C_Color) : UIColor.init(hexString: App_Theme_8A96A2_Color)
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
