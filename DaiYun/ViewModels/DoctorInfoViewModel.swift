
//
//  DoctorInfoViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class DoctorInfoViewModel: BaseViewModel {

    var docInfoViewController:DoctorInfoViewController!
    var models = NSMutableArray.init()
    override init() {
        super.init()
    }
}

extension DoctorInfoViewModel : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MotherCollectionViewCell.description(), for: indexPath)
        collectionViewCell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
//        self.collectionViewMotherCollectionViewCellSetData(indexPath, cell: collectionViewCell as! MotherCollectionViewCell)
        return collectionViewCell
    }
}

extension DoctorInfoViewModel : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension DoctorInfoViewModel : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (SCREENWIDTH - 20) / 2, height: (SCREENWIDTH - 20) / 2 + 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
