//
//  ConfideListViewController.swift
//  DaiYun
//
//  Created by Zhang on 19/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ConfideListViewController: BaseViewController {

    var isConfideView:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: ConfideListViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableLableDetailLabelImageCell.self, ProfileTableViewCell.self, LogoutTableViewCell.self], controller: self)
        self.setUpNavigationItem()
        self.bindLogic()
        // Do any additional setup after loading the view.
    }
    
    func bindLogic(){
        (self.viewModel as! ConfideListViewModel).requestConfideList(type: isConfideView ? "3" : "1")
    }

    
    func setUpNavigationItem(){
        
    }
    
    func rightBarItemPress(){
        
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
