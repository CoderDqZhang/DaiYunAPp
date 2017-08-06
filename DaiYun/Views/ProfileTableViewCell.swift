//
//  ProfileTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    var photoImage:UIImageView!
    var userName:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        photoImage = UIImageView.init()
        photoImage.layer.masksToBounds = true
        photoImage.layer.cornerRadius = 25
        photoImage.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
        self.contentView.addSubview(photoImage)
        
        userName = UILabel.init()
        userName.font = App_Theme_PinFan_R_15_Font
        userName.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(userName)
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(model:UserModel){
        userName.text = model.nickname
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            photoImage.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
                make.size.equalTo(CGSize.init(width: 50, height: 50))
            })
            userName.snp.makeConstraints({ (make) in
                make.left.equalTo(self.photoImage.snp.right).offset(10)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
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
