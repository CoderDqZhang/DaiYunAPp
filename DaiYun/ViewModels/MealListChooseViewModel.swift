//
//  MealListChooseViewModel.swift
//  DaiYun
//
//  Created by Zhang on 23/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MealListChooseViewModel: BaseViewModel {

    var model:PackageModel!
    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.packageList()
    }
    
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        switch indexPath.section {
        case 0:
            cell.setCellData(text: "当前选中", detailText: model.tcName, detailTextColor: nil)
        default:
            let model = PackageModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary)
            cell.setCellData(text: model.tcName, detailText: nil,  detailTextColor: nil)
        }
    }
    
    func tableViewDidSelect(_ indexPat:IndexPath) {
        if indexPat.section == 1 {
            let model = PackageModel.init(fromDictionary: self.models[indexPat.row] as! NSDictionary)
            if (self.controller as! MealListChooseViewController).selectChooseMeal != nil {
                (self.controller as! MealListChooseViewController).selectChooseMeal(model)
                self.controller?.navigationController?.popViewController()
            }
        }
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

extension MealListChooseViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000000000001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? nil : "添加套餐"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension MealListChooseViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for: indexPath)
        self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
        return cell
    }
}
