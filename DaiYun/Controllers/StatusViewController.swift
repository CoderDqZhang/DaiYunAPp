//
//  StatusViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class StatusViewController: BaseViewController {

    let array = ["胚胎准备","代母匹配","代母检查","代母体检","代母合同签署","胚胎移植","确认怀孕","妇产科"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigationItem()
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "协议流程"
    }

    func setUpView(){
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT))
        scrollView.contentSize = CGSize.init(width: SCREENWIDTH, height: CGFloat(array.count * 80) + 40)
        self.view.addSubview(scrollView)
        for i in 0...array.count - 1 {
            let frame = CGRect.init(x: 0, y: i * 80 + 20, width: Int(SCREENWIDTH), height: 76)
            let view = self.setUpLabelView(frame: frame, isShowLabel: i == array.count - 1 ? false : true, text: array[i], select: i < 3 ? true : false)
            scrollView.addSubview(view)
        }
    }
    
    func setUpLabelView(frame:CGRect,isShowLabel:Bool, text:String, select:Bool) -> UIView{
        let view = UIView.init(frame: frame)
        let label = UILabel.init()
        label.frame = CGRect.init(x: 0, y: 0, width: view.width, height: 20)
        label.font = App_Theme_PinFan_R_17_Font
        label.text = text
        label.textAlignment = .center
        label.textColor = select ? UIColor.init(hexString: App_Theme_FB718C_Color) : UIColor.init(hexString: App_Theme_DDE0E5_Color)
        view.addSubview(label)
        let lineLabel = UILabel.init(frame: CGRect.init(x: view.width / 2, y: 20, width: 1, height: 45))
        lineLabel.backgroundColor = select ? UIColor.init(hexString: App_Theme_FB718C_Color) : UIColor.init(hexString: App_Theme_DDE0E5_Color)
        if isShowLabel {
            view.addSubview(lineLabel)
        }
        return view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
