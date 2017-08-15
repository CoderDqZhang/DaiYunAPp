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
        super.init()
    }
    
    func leftBarItemPress() {
        let filterController = FilterViewController()
        filterController.commitPressClouse = { array in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotiFicationPostName), object: array)
            UserDefaultsSetSynchronize(array, key: "FilterArray")
        }
        NavigationPushView(self.controller!, toConroller: filterController)
    }
    
    func rightBarItemPress() {
        NavigationPushView(self.controller!, toConroller: LikeViewController())
    }
    
    func pushViewController(controller:UIViewController?){
        NavigationPushView(self.controller!, toConroller: controller!)
    }
}
