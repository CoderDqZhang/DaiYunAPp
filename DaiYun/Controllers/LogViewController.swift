//
//  LogViewController.swift
//  DaiYun
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class LogViewController: BaseViewController {

    var model:MotherModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: LogViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [LogTableViewCell.self], controller: self)
        self.tableView.separatorStyle = .none
        self.bindLogic()
        // Do any additional setup after loading the view.
    }
    
    func bindLogic(){
        (self.viewModel as! LogViewModel).requestNetWork(model: model)
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
