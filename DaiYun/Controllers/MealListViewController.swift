//
//  MealListViewController.swift
//  DaiYun
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MealListViewController: BaseViewController {

    var linLabel:GloabLineView!
    var linLabel1:GloabLineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: MealListViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [PackageItemTableViewCell.self], controller: self)
        self.updataTableViewFrame()
        self.setUpNavigationItme()
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        let topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 40))
        topView.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.view.addSubview(topView)
        
        let labelService = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH/2, height: 40))
        labelService.text = "服务项目"
        labelService.textAlignment = .center
        labelService.font = App_Theme_PinFan_R_14_Font
        labelService.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        topView.addSubview(labelService)
        
        let addService = UILabel.init(frame: CGRect.init(x: SCREENWIDTH/2, y: 0, width: SCREENWIDTH/4, height: 40))
        addService.text = "添加套餐"
        addService.textAlignment = .center
        addService.font = App_Theme_PinFan_R_14_Font
        addService.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        topView.addSubview(addService)
        
        let selectService = UILabel.init(frame: CGRect.init(x: SCREENWIDTH - SCREENWIDTH/4, y: 0, width: SCREENWIDTH/4, height: 40))
        selectService.text = "放心套餐"
        selectService.textAlignment = .center
        selectService.font = App_Theme_PinFan_R_14_Font
        selectService.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        topView.addSubview(selectService)
        
        
        linLabel = GloabLineView.init(frame: CGRect.init(x: SCREENWIDTH/2, y: 0, width: 1, height: 40))
        topView.addSubview(linLabel)
        linLabel1 = GloabLineView.init(frame: CGRect.init(x: SCREENWIDTH - SCREENWIDTH/4, y: 0, width: 1, height: 40))
        topView.addSubview(linLabel1)
        
        self.view.addSubview(topView)
    }
    
    func setUpNavigationItme(){
        self.navigationItem.title = "套餐"
    }
    
    func updataTableViewFrame(){
        self.tableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(40)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
        }
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
