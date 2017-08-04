//
//  HomeViewModel.swift
//  DaiYun
//
//  Created by Zhang on 30/07/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {

    override init() {
        
    }
    
    func leftBarItemPress() {
        NavigationPushView(self.controller!, toConroller: FilterViewController())
    }
    
    func rightBarItemPress() {
        NavigationPushView(self.controller!, toConroller: LikeViewController())
    }
    
    func pushViewController(controller:UIViewController?){
        NavigationPushView(self.controller!, toConroller: controller!)
    }
}
