//
//  ConnectOtherTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 21/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ConnectOtherTableViewCell: UITableViewCell {

    var photo:UIImageView!
    var titleLable:UILabel!
    var backGroundImage:UIImageView!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
        self.contentView.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
    }
    
    func setUpView(){
        photo = UIImageView.init()
        photo.backgroundColor = UIColor.red
        self.contentView.addSubview(photo)
        
        backGroundImage = UIImageView.init()
        backGroundImage.image = UIImage.init(named: "Combined_other")
        self.contentView.addSubview(backGroundImage)
        
        titleLable = UILabel.init()
        titleLable.font = App_Theme_PinFan_R_14_Font!
        titleLable.numberOfLines = 0
        self.contentView.addSubview(titleLable)
        
        self.updateConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func cellSetData(str:String){
        titleLable.text = str
        let height = str.heightWithConstrainedWidth(str, font: App_Theme_PinFan_R_14_Font!, width: SCREENWIDTH - 170)
        let width = str.widthWithConstrainedHeight(str, font: App_Theme_PinFan_R_14_Font!, height: 20)
        if width < SCREENWIDTH - 125 {
            backGroundImage.image = UIImage.init(named: "Combined_other")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 41, left: 4, bottom: 4, right: 4), resizingMode: .stretch)
            backGroundImage.frame = CGRect.init(x: 65, y: 10, width: width + 20, height: height + 20)
        }else{
            backGroundImage.image = UIImage.init(named: "Combined_other")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 41, left: 4, bottom: 4, right: 4), resizingMode: .stretch)
            backGroundImage.frame = CGRect.init(x: 65, y: 10, width: SCREENWIDTH - 125, height: height + 20)
        }
        self.contentView.updateConstraintsIfNeeded()
    }

    
    override func updateConstraints() {
        if !didMakeConstraints {
            photo.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.size.equalTo(CGSize.init(width: 40, height: 40))
            })
            
            titleLable.snp.makeConstraints({ (make) in
                make.left.equalTo(self.photo.snp.right).offset(25)
                make.top.equalTo(self.contentView.snp.top).offset(20)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
                make.right.lessThanOrEqualTo(self.contentView.snp.right).offset(-75)
            })
            
//            backGroundImage.snp.makeConstraints({ (make) in
//                make.left.equalTo(self.photo.snp.right).offset(2)
//                make.top.equalTo(self.contentView.snp.top).offset(7)
//            })
            
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
