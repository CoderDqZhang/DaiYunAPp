//
//  MotherInfoTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MotherInfoTableViewCell: UITableViewCell {

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
        photoImage.layer.cornerRadius = 50
        self.contentView.addSubview(photoImage)
        
        userName = UILabel.init()
        userName.font = App_Theme_PinFan_M_18_Font
        userName.textColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.contentView.addSubview(userName)
        
        self.updateConstraints()
    }
    
    func cellSetData(model:MotherModel) {
        ImageViewManager.shareInstance.sd_imageView(url: "\(BaseUrl)\((model.dmPic)!)", imageView: photoImage) { (image, error, cache, url) in
            
        }
        
        userName.text = model.dmName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            photoImage.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.size.equalTo(CGSize.init(width: 100, height: 100))
            })
            userName.snp.makeConstraints({ (make) in
                make.top.equalTo(self.photoImage.snp.bottom).offset(15)
                make.centerX.equalTo(self.contentView.snp.centerX).offset(0)
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
