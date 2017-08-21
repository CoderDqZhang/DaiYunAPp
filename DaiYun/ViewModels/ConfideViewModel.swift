//
//  ConfideViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

class ConfideViewModel: BaseViewModel {

    override init() {
        super.init()
        self.dowloadPdfImage()
    }
    
    //MARK: NetWorkRequest
    func dowloadPdfImage(){
        let url = URL.init(string: "http://www.qupu123.com/downpdf/505309/A%20Rock%20(Jazz%20Ensemble)1.pdf")
        SDWebImageManager.shared().loadImage(with: url, options: SDWebImageOptions.retryFailed, progress: { (start, end, url) in
            
        }) { (image, data, error, cacheType, finish, url) in
            
        }
    }
}
