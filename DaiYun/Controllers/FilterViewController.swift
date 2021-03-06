//
//  FilterViewController.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

typealias CommitPressClouse = (_ array:NSMutableArray) ->Void

class FilterViewController: BaseViewController {

    var commitPressClouse:CommitPressClouse!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItemBack()
        self.bindViewModel(viewModel: FilterViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableNoneCell.self,FilterTableViewCell.self], controller: self)
        // Do any additional setup after loading the view.
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
