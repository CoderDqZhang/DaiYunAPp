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
    var filterMotherArray = NSMutableArray.init()
    var filter:Bool = false
    var filterArray = NSMutableArray.init()
    override init() {
        super.init()
        self.requestMothModel()
        NotificationCenter.default.addObserver(self, selector: #selector(MotherViewModel.updateFilterCollect(notification:)), name: NSNotification.Name(rawValue: NotiFicationPostName), object: nil)
    }
    
    func updateFilterCollect(notification:Notification){
        filterArray = NSMutableArray.init(array: notification.object as! Array)
//        filterMotherArray = NSMutableArray.init()
        var filter = [MotherModel]()
        for array in models {
            filter.append(MotherModel.init(fromDictionary: array as! NSDictionary))
        }
        let resultDic = filter.filter { (model) -> Bool in
            return (filterArray[0] as! Int == 1 ? model.dmBirth != "0" : model.dmBirth == "0") && (filterArray[1] as! Int == 1 ? model.dmMarriage == "2" : model.dmMarriage == "1") && (filterArray[2] as! Int == 1 ? model.dmYuyueStatus == "1" : model.dmYuyueStatus == "0")
        }
        filterMotherArray.removeAllObjects()
        for model in resultDic {
            filterMotherArray.add(model)
        }
        self.motherController?.collectView.reloadData()
    }
    
    //MARK: CollectionViewCellSetData
    func collectionViewMotherCollectionViewCellSetData(_ indexPath:IndexPath, cell:MotherCollectionViewCell) {
        if self.filterMotherArray[indexPath.row] is NSDictionary {
            cell.cellSetData(model: MotherModel.init(fromDictionary:  self.filterMotherArray.object(at: indexPath.row) as! NSDictionary))
        }else{
             cell.cellSetData(model: self.filterMotherArray[indexPath.row] as! MotherModel)
        }
    }
    
    func collectionViewDidSelctor(_ indexPath:IndexPath) {
        let toController = MotherInfoViewController()
        if self.filterMotherArray[indexPath.row] is NSDictionary {
            toController.model = MotherModel.init(fromDictionary:  self.filterMotherArray.object(at: indexPath.row) as! NSDictionary)
        }else{
            toController.model = self.filterMotherArray[indexPath.row] as! MotherModel
        }
        
        let controller = self.motherController?.parent as! HomePageViewController
        controller.viewModel.pushViewController(toController)
    }
    
    //MARK: RequestUrl 
    func requestMothModel(){
        let url = "\(BaseUrl)\(MotherListUrl)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.init(array: resultDic.value as! [Any])
                self.filterMotherArray = NSMutableArray.init(array: resultDic.value as! [Any])
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
        return self.filterMotherArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MotherCollectionViewCell.description(), for: indexPath)
        collectionViewCell.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.collectionViewMotherCollectionViewCellSetData(indexPath, cell: collectionViewCell as! MotherCollectionViewCell)
        return collectionViewCell
    }
}

extension MotherViewModel : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionViewDidSelctor(indexPath)
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
