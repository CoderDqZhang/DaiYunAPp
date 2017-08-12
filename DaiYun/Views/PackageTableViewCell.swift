//
//  PackageTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 12/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class PackageTableViewCell: UITableViewCell {

    var label:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        label = UILabel.init()
        label.textAlignment = .center
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 5.0
        label.font = App_Theme_PinFan_R_30_Font
        label.textColor = UIColor.init(hexString: App_Theme_FB718C_Color)
        label.layer.borderColor = UIColor.init(hexString: App_Theme_FB718C_Color)?.cgColor
        self.contentView.addSubview(label)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(model:PackageModel){
        label.text = model.tcName
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            label.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.top.equalTo(self.contentView.snp.top).offset(5)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
            })
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
