//
//  NormalQuestTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class NormalQuestTableViewCell: UITableViewCell {

    var detailLable:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        detailLable = UILabel.init()
        detailLable.font = App_Theme_PinFan_R_15_Font
        detailLable.numberOfLines = 0
        detailLable.text = "这个问题出现的原因应该要怎么解决这个问题出现原因应该要怎么解决解决这个问题出现的原因应\n要怎么解决解决这个问题.\n出现的原因应该要怎么解决"
        detailLable.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(detailLable)
        
        self.updateConstraints()
    }
    
    func cellSetData(str:String){
        detailLable.text = str
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            detailLable.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.top.equalTo(self.contentView.snp.top).offset(15)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
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
