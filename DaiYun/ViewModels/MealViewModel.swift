//
//  MealViewModel.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MealViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.packageList()
    }
    
    //MARK:TableViewCellSetData
    func tableViewPackageTableViewCellSetData(_ indexPath:IndexPath, cell:PackageTableViewCell) {
        cell.cellSetData(model: PackageModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary))
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
    //MARK: NetWorkRequest
    func packageList(){
        let url = "\(BaseUrl)\(PackageList)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension MealViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000000000001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension MealViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PackageTableViewCell.description(), for: indexPath)
        self.tableViewPackageTableViewCellSetData(indexPath, cell: cell as! PackageTableViewCell)
        return cell
    }
}
