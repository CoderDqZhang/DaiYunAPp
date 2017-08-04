//
//  HomePageViewModel.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
typealias PageViewModelClouse = (_ controller:UIViewController?) ->Void

class HomePageViewModel: NSObject {

    var controller:HomePageViewController!
    var selectIdex:Int = 0
    var willAddViewController:Int = 0
    var pageViewModelClouse:PageViewModelClouse!
    var pageControllers:NSMutableArray = NSMutableArray.init(array: [MotherViewController(),LawViewController(),MealViewController()])
    var pageCOntrollersTitls = ["代母","律师","套餐"]
    
    override init() {
        super.init()
        
    }
    
    func pushViewController(_ controller:UIViewController?) {
        if pageViewModelClouse != nil {
            self.pageViewModelClouse(controller)
        }
    }
    
    func numberOfControllersInPagerController() -> Int {
        return pageCOntrollersTitls.count
    }
    
    func pagerControllerTitleForIndex(_ index:Int) ->String {
        return pageCOntrollersTitls[index]
    }
    
    func pagerControllerControllerForIndex(_ index:Int) ->UIViewController {
        return pageControllers[index] as! UIViewController
    }
    
    func pagerControllerDidScrollToTabPageIndex(_ index:Int) {
        selectIdex = index
        //        if pageControllers.count != 0 {
        //            if !(reconmmendModels[index] is RecommentTickes){
        //                self.requestCategotyData(index, controller: pageControllers[index] as! BaseTicketsPageViewController)
        //            }
        //        }
    }
}
