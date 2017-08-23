//
//  MealListChooseViewController.swift
//  DaiYun
//
//  Created by Zhang on 23/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

typealias SelectChooseMeal = (_ model:PackageModel) -> Void

class MealListChooseViewController: BaseViewController {

    var model:PackageModel!
    var selectChooseMeal:SelectChooseMeal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: MealListChooseViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableLableDetailLabelImageCell.self], controller: self)
        self.bindLogic()
        self.setUpNavigaitonItem()
        // Do any additional setup after loading the view.
    }
    
    func bindLogic(){
        (self.viewModel as! MealListChooseViewModel).model = model
    }
    
    func setUpNavigaitonItem(){
        self.navigationItem.title = "添加套餐"
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
