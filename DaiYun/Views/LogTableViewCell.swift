//
//  LogTableViewCell.swift
//  DaiYun
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

enum LogType {
    case NoneImage
    case OneImages
    case TowImages
    case ThreeImages
    case UrlImage
    case ForOrMoreImages
}

class LogView: UIView {
    
    var titleLabel:UILabel!

    var imageView:UIImageView!
    
    init(frame:CGRect, type:LogType) {
        super.init(frame: frame)
        self.setUpView()
        switch type {
        case .NoneImage:
            self.setUpNoneImage()
        case .OneImages:
            self.setUpOneImages()
        case .TowImages:
            self.setUpTowImages()
        case .ThreeImages:
            self.setUpNoneImage()
        default:
            self.setUpForOrMoreImages()
        }
    }
    
    func setUpView(){
        titleLabel = UILabel.init()
        titleLabel.text = "这是一个测试文件"
        titleLabel.font = App_Theme_PinFan_R_14_Font
        titleLabel.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        titleLabel.numberOfLines = 0
        self.addSubview(titleLabel)
        
        imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "login")
        self.addSubview(imageView)
    }
    
    func setUpData(model:LogModel) {
        titleLabel.text = model.dlTitle
        imageView.sd_setImage(with: URL.init(string: model.dlImg), placeholderImage: nil, options: SDWebImageOptions.retryFailed, progress: { (start, end, url) in
            
        }) { (image, error, cacheType, url) in
            
        }
        titleLabel.snp.updateConstraints { (make) in
            make.height.equalTo(model.dlTitle.heightWithConstrainedWidth(model.dlTitle, font: App_Theme_PinFan_R_14_Font!, width: SCREENWIDTH - 90))
        }
        self.updateConstraintsIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpNoneImage(){
        titleLabel.frame = CGRect.init(x: 8, y: 0, width: self.frame.size.width, height: 20)
    }
    
    func setUpOneImages(){
        imageView.frame = CGRect.init(x: 8, y: 10, width: 70, height: 70)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp.right).offset(10)
            make.right.equalTo(self.snp.right).offset(-15)
            make.top.equalTo(self.snp.top).offset(10)
            make.height.equalTo(20)
        }
    }
    
    func setUpTowImages(){
        
    }
    
    func setUpThreeImages(){
        
    }
    
    func setUpForOrMoreImages(){
        
    }
}

class LogTableViewCell: UITableViewCell {

    var timeDay:UILabel!
    var timeMouth:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            timeDay.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(24)
                make.top.equalTo(self.contentView.snp.top).offset(5)
            })
            timeMouth.snp.makeConstraints({ (make) in
                make.left.equalTo(self.timeDay.snp.right).offset(1)
                make.top.equalTo(self.contentView.snp.top).offset(8)
            })
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    func cellSetData(model:LogModel){
        let date = Date.init(timeIntervalSinceReferenceDate: Double(model.dlTime)!)
        timeDay = UILabel.init()
        timeDay.text = "\(date.day)/"
        timeDay.font = App_Theme_PinFan_R_17_Font
        timeDay.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(timeDay)
        
        timeMouth = UILabel.init()
        timeMouth.text = "\(date.month)"
        timeMouth.font = App_Theme_PinFan_R_14_Font
        timeMouth.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        self.contentView.addSubview(timeMouth)
        
//        for i in 0...1 {
//            
//            if i == 1 {
//                type = .OneImages
//            }
//            
//        }
        let type:LogType = .OneImages
        let i = 0
        let view = LogView.init(frame: CGRect.init(x: 88, y: i * (type == .NoneImage ?  40 : 88), width: Int(SCREENWIDTH - 88), height: type == .NoneImage ?  40 : 88), type:  type)
        view.setUpData(model: model)
        self.contentView.addSubview(view)
        self.updateConstraints()
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
