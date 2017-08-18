//
//  HomeViewController.swift
//  DaiYun
//
//  Created by Zhang on 30/07/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var homePageViewController:HomePageViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: HomeViewModel(), controller: self)
        self.setUpNavigationItem(index: 0)
        self.addPagerController()
        self.setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpNavigationItem(index:Int){
        switch index {
        case 0:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "筛选", style: .plain, target: self, action: #selector(HomeViewController.leftBarItemPress))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "收藏夹", style: .plain, target: self, action: #selector(HomeViewController.rightBarItemPress))
        case 1:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: #selector(HomeViewController.leftBarItemPress))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: #selector(HomeViewController.rightBarItemPress))
        default:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: #selector(HomeViewController.leftBarItemPress))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: #selector(HomeViewController.rightBarItemPress))
        }
        
    }
    
    func leftBarItemPress(){
        (self.viewModel as! HomeViewModel).leftBarItemPress()
    }
    
    func rightBarItemPress(){
        (self.viewModel as! HomeViewModel).rightBarItemPress()
    }
    
    func setUpView(){
        let loginBtn = UIButton.init(type: .custom)
        loginBtn.setImage(UIImage.init(named: "login.png"), for: .normal)
        loginBtn.frame = CGRect.init(x: SCREENWIDTH - 67, y: SCREENHEIGHT - 147, width: 42, height: 42)
        loginBtn.reactive.controlEvents(.touchUpInside).observe { (button) in
            UserModel.shareInstance.logOut()
            NavigaiontPresentView(self, toController: UINavigationController.init(rootViewController: LoginViewController()))
        }
        self.view.addSubview(loginBtn)
        
        if UserModel.shareInstance.getUserInfo() == nil {
            NavigaiontPresentView(self, toController: UINavigationController.init(rootViewController: LoginViewController()))
        }
    }
    
    func addPagerController(){
        homePageViewController = HomePageViewController()
        homePageViewController.progressHeight = 0
        homePageViewController.progressWidth = 0
        homePageViewController.progressColor = UIColor.init(hexString: App_Theme_1B76D9_Color)
        homePageViewController.hidesBottomBarWhenPushed = true
        homePageViewController.view.frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT)
        homePageViewController.selectIndexClouse = { index in
            self.setUpNavigationItem(index: index)
            switch Int(index) {
            case 0:
                self.navigationItem.title = "代母"
                self.navigationItem.leftBarButtonItem?.isEnabled = true
                self.navigationItem.rightBarButtonItem?.isEnabled = true
            case 1:
                self.navigationItem.leftBarButtonItem?.isEnabled = false
                self.navigationItem.rightBarButtonItem?.isEnabled = false
                self.navigationItem.title = "律师"
            default:
                self.navigationItem.leftBarButtonItem?.isEnabled = false
                self.navigationItem.rightBarButtonItem?.isEnabled = false
                self.navigationItem.title = "套餐"
            }
        }
        homePageViewController.viewModel.pageViewModelClouse = { controller in
            (self.viewModel as! HomeViewModel).pushViewController(controller: controller)
        }
        self.view.addSubview(homePageViewController.view)
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
