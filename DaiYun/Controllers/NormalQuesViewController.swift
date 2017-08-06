//
//  NormalQuesViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class NormalQuesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: NormalViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableLableDetailLabelImageCell.self,NormalQuestTableViewCell.self], controller: self)
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "常见问题"
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
