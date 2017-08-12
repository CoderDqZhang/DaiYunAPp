//
//  MotherInfoViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MotherInfoViewController: BaseViewController {

    var model:MotherModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_FB718C_Color)
        self.bindViewModel(viewModel: MotherInfoViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [MotherInfoTableViewCell.self,GloableLableDetailLabelImageCell.self], controller: self)
        self.bindeLogicViewModel()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationItem(collect:Bool){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: collect ? "collection_select.png" : "collection_normal.png"), style: .plain, target: self, action: #selector(MotherInfoViewController.rightBarItemPress))
    }
    
    func rightBarItemPress(){
        (self.viewModel as! MotherInfoViewModel).rightBarItemPress()
    }
    
    func bindeLogicViewModel(){
        (self.viewModel as! MotherInfoViewModel).model = self.model
        (self.viewModel as! MotherInfoViewModel).genderData()
        (self.viewModel as! MotherInfoViewModel).collectionStatus()

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
