//
//  ContactUsViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ContactUsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: ContavUsViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [ConnectOtherTableViewCell.self,ConnectUserTableViewCell.self], controller: self)
        self.setUpNavigationItem()
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "联系我们"
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
