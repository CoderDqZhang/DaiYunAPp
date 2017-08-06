//
//  MotherViewModel.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MotherViewModel: BaseViewModel {

    var motherController:MotherViewController!
    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.requestMothModel()
    }
    
    //MARK: CollectionViewCellSetData
    func collectionViewMotherCollectionViewCellSetData(_ indexPath:IndexPath, cell:MotherCollectionViewCell) {
        cell.cellSetData(model: MotherModel.init(fromDictionary:  self.models.object(at: indexPath.row) as! NSDictionary))
    }
    
    //MARK: RequestUrl 
    func requestMothModel(){
        let url = "\(BaseUrl)\(MotherListUrl)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.init(array: resultDic.value as! [Any])
                self.motherController.collectView.reloadData()
            }
        }
    }
}

extension MotherViewModel : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MotherCollectionViewCell.description(), for: indexPath)
        self.collectionViewMotherCollectionViewCellSetData(indexPath, cell: collectionViewCell as! MotherCollectionViewCell)
        return collectionViewCell
    }
}

extension MotherViewModel : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MotherViewModel : UICollectionViewDelegateFlowLayout {
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
