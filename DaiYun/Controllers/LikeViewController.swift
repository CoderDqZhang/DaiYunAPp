//
//  LikeViewController.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class LikeViewController: BaseViewController {

    var collectView:UICollectionView!
    var likeViewModel:LikeViewModel = LikeViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.bindViewModelLogic()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        let collectionViewLayout = UICollectionViewFlowLayout.init()
        collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT), collectionViewLayout: collectionViewLayout)
        collectView.backgroundColor = UIColor.init(hexString: App_Theme_F6F7FA_Color)
        collectView.register(MotherCollectionViewCell.self, forCellWithReuseIdentifier: MotherCollectionViewCell.description())
        
        collectView.delegate = likeViewModel
        collectView.dataSource = likeViewModel
        self.view.addSubview(collectView)
    }
    
    func bindViewModelLogic(){
        self.likeViewModel.likeController = self
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
