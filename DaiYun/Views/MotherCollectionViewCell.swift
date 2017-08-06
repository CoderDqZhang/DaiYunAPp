//
//  MotherCollectionViewCell.swift
//  DaiYun
//
//  Created by Zhang on 05/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MotherCollectionViewCell: UICollectionViewCell {
    
    var image:UIImageView!
    var namelabel:UILabel!
    var heightlabel:UILabel!
    var weightlabel:UILabel!
    var explabel:UILabel!
    var marriagelabel:UILabel!
    
    var didMakeConstraints:Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    func setUpView() {
        image = UIImageView.init()
        self.contentView.addSubview(image)
        
        namelabel = UILabel.init()
        namelabel.text = "张三"
        namelabel.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        namelabel.font = App_Theme_PinFan_R_15_Font
        self.contentView.addSubview(namelabel)
        
        heightlabel = UILabel.init()
        heightlabel.text = "身高：173.2cm"
        self.setUpLabelText(label: heightlabel)
        self.contentView.addSubview(heightlabel)
        
        weightlabel = UILabel.init()
        weightlabel.text = "体重：44kg"
        self.setUpLabelText(label: weightlabel)
        self.contentView.addSubview(weightlabel)
        
        explabel = UILabel.init()
        explabel.text = "经验：2次"
        self.setUpLabelText(label: explabel)
        self.contentView.addSubview(explabel)
        
        marriagelabel = UILabel.init()
        marriagelabel.text = "婚姻：未婚"
        self.setUpLabelText(label: marriagelabel)
        self.contentView.addSubview(marriagelabel)
        
        self.updateConstraints()
    }
    
    func setUpLabelText(label:UILabel){
        label.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        label.font = App_Theme_PinFan_R_12_Font
    }
    
    func cellSetData(model:MotherModel){
        ImageViewManager.shareInstance.sd_imageView(url: "\(BaseUrl)\((model.dmPic)!)", imageView: image) { (image, error, cacheType, url) in
            
        }
        namelabel.text = model.dmName
        heightlabel.text = "身高：\((model.dmHeight)!)cm"
        weightlabel.text = "体重：\((model.dmWeight)!)kg"
        explabel.text = "经验：\((model.dmExperiencde)!)"
        let marriage = model.dmMiscarriage == "1" ? "未婚" : "已婚"
        marriagelabel.text = "婚姻：\(marriage)"
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            image.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.size.equalTo(CGSize.init(width: (SCREENWIDTH - 30) / 2, height: (SCREENWIDTH - 30) / 2))
            })
            
            namelabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.image.snp.bottom).offset(7)
                make.left.equalTo(self.contentView.snp.left).offset(10)
            })
            
            heightlabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.namelabel.snp.bottom).offset(1)
                make.left.equalTo(self.contentView.snp.left).offset(10)
            })
            
            weightlabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.namelabel.snp.bottom).offset(1)
                make.left.equalTo(self.heightlabel.snp.right).offset(10)
            })
            
            explabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.heightlabel.snp.bottom).offset(1)
                make.left.equalTo(self.contentView.snp.left).offset(10)
            })
            
            marriagelabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.heightlabel.snp.bottom).offset(1)
                make.left.equalTo(self.explabel.snp.right).offset(10)
            })
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
