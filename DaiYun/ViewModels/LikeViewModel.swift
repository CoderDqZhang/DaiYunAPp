//
//  LikeViewModel.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class LikeViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    var likeController:LikeViewController!
    override init() {
        super.init()
        self.requestLikeModel()
    }
    //MARK: CollectionViewCellSetData
    func collectionViewMotherCollectionViewCellSetData(_ indexPath:IndexPath, cell:MotherCollectionViewCell) {
        cell.cellSetData(model: CollectsModel.init(fromDictionary:  self.models.object(at: indexPath.row) as! NSDictionary).daimuInfo)
    }
    
    func collectionViewDidSelctor(_ indexPath:IndexPath) {
        let toController = MotherInfoViewController()
        toController.model = CollectsModel.init(fromDictionary:  self.models.object(at: indexPath.row) as! NSDictionary).daimuInfo
        NavigationPushView(self.controller!, toConroller: toController)
    }
    
    //MARK: RequestUrl
    func requestLikeModel(){
        let url = "\(BaseUrl)\(MotherCollectsUrl)"
//        let parameters = ["uid":UserModel.shareInstance.id]
        let parameters = ["uid":"1"]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_objectArray(withKeyValuesArray: resultDic.value)
                self.likeController.collectView.reloadData()
            }
        }
    }
}

extension LikeViewModel : UICollectionViewDataSource {
    
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
        self.collectionViewMotherCollectionViewCellSetData(indexPath, cell: collectionViewCell as! MotherCollectionViewCell)
        return collectionViewCell
    }
}

extension LikeViewModel : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionViewDidSelctor(indexPath)
    }
}

extension LikeViewModel : UICollectionViewDelegateFlowLayout {
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
