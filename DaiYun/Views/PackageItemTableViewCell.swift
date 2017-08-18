//
//  PackageItemTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 18/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class PackageItemTableViewCell: UITableViewCell {

    var itemTitleLabel:UILabel!
    var lineLabel:GloabLineView!
    var selectImage:UIImageView!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        itemTitleLabel = UILabel.init()
        itemTitleLabel.font = App_Theme_PinFan_R_15_Font
        itemTitleLabel.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        itemTitleLabel.numberOfLines = 0
        self.contentView.addSubview(itemTitleLabel)
        
        selectImage = UIImageView.init()
        selectImage.isHidden = true
        selectImage.image = UIImage.init(named: "selector.png")
        self.contentView.addSubview(selectImage)
        
        lineLabel = GloabLineView.init(frame: CGRect.zero)
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(itemTitle:String, select:Bool){
        itemTitleLabel.text = itemTitle
        selectImage.isHidden = select
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            itemTitleLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.top.equalTo(self.contentView.snp.top).offset(15)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
                make.right.equalTo(self.contentView.snp.centerX).offset(-15)
            })
            
            lineLabel.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
                make.width.equalTo(1)
            })
            
            selectImage.snp.makeConstraints({ (make) in
                make.right.equalTo(self.contentView.snp.right).offset(-25)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.size.equalTo(CGSize.init(width: 17, height: 12))
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
