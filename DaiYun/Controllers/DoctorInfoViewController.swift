//
//  DoctorInfoViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class DoctorInfoViewController: BaseViewController {

    var collectView:UICollectionView!
    var docViewModel:DoctorInfoViewModel = DoctorInfoViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.bindViewModelLogic()
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "医生信息"
    }
    
    func setUpView(){
        let collectionViewLayout = UICollectionViewFlowLayout.init()
        collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT - 100), collectionViewLayout: collectionViewLayout)
        collectView.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
        collectView.register(MotherCollectionViewCell.self, forCellWithReuseIdentifier: MotherCollectionViewCell.description())
        
        collectView.delegate = docViewModel
        collectView.dataSource = docViewModel
        self.view.addSubview(collectView)
    }
    
    func bindViewModelLogic(){
        self.docViewModel.docInfoViewController = self
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
