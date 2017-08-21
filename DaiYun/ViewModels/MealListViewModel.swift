//
//  MealListViewModel.swift
//  DaiYun
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MealListViewModel: BaseViewModel {

    var allItem = NSMutableArray.init()
    var selectItem:PackageDescModel!
    var select = NSMutableArray.init()
    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewPackageItemTableViewCellSetData(_ indexPath:IndexPath, cell:PackageItemTableViewCell) {
        cell.cellSetData(itemTitle: PackageAllValueModel.init(fromDictionary: self.allItem[indexPath.section] as! NSDictionary).taocanValueList[indexPath.row].tcvName , select: (select[indexPath.section] as! NSMutableArray)[indexPath.row] as! Bool)
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath){
        
    }
    
    //MARK: NetWorkingRequest
    func requestMealItem(model:PackageModel){
        let semaphore = DispatchSemaphore.init(value: 0)
        
        let group = DispatchGroup.init()
        let queue = DispatchQueue.global(qos: .default)
        
        let allItemQueue = DispatchQueue.init(label: "AllItem")
        allItemQueue.async(group: group, qos: .default, flags: DispatchWorkItemFlags.noQoS) { 
            let url = "\(BaseUrl)\(PackageDesc)"
            let parameters = ["tcid":model.tcId]
            BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
                if !resultDic.isCompleted {
                    self.selectItem = PackageDescModel.init(fromDictionary: resultDic.value as! NSDictionary)
                    semaphore.signal()
                }
            }
        }
        
        let selectQueue = DispatchQueue.init(label: "selectAllItem")
        selectQueue.async(group: group, qos: .default, flags: DispatchWorkItemFlags.noQoS) {
            let urls = "\(BaseUrl)\(PackageAllItem)"
            BaseNetWorke.sharedInstance.getUrlWithString(urls, parameters: nil).observe { (resultDic) in
                if !resultDic.isCompleted {
                    self.allItem = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                    semaphore.signal()
                }
            }
        }
        
        group.notify(queue: queue) { 
            semaphore.wait()
            semaphore.wait()
            self.select = NSMutableArray.init()
            for model in self.allItem {
                let array = NSMutableArray.init()
                let package = PackageAllValueModel.init(fromDictionary: model as! NSDictionary)
                for _ in package.taocanValueList {
                    array.add(false)
                }
                self.select.add(array)
            }
            
            for item in self.selectItem.values {
                for i in 0...self.allItem.count - 1 {
                    let model = PackageAllValueModel.init(fromDictionary: self.allItem[i] as! NSDictionary)
                    for value in model.taocanValueList {
                        if item.tcvId == value.tcvId {
                            let array = NSMutableArray.init(array: self.select[Int(item.tcvType)!] as! [Any])
                            array.replaceObject(at: i, with: true)
                            self.select.replaceObject(at: Int(item.tcvType)!, with: array)
                            break
                        }
                    }
                    
                }
            }
            DispatchQueue.main.async {
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension MealListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: PackageItemTableViewCell.description(), configuration: { (cell) in
            self.tableViewPackageItemTableViewCellSetData(indexPath, cell: cell as! PackageItemTableViewCell)
        })
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PackageAllValueModel.init(fromDictionary: self.allItem[section] as! NSDictionary).tvtName
    }
}

extension MealListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allItem.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PackageAllValueModel.init(fromDictionary: self.allItem[section] as! NSDictionary).taocanValueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PackageItemTableViewCell.description(), for: indexPath)
        self.tableViewPackageItemTableViewCellSetData(indexPath, cell: cell as! PackageItemTableViewCell)
        return cell
    }
}

