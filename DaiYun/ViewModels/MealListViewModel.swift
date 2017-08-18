//
//  MealListViewModel.swift
//  DaiYun
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MealListViewModel: BaseViewModel {

    var titleStrs = ["代母匹配","代母管理","第三方信托账户","国际协调"]
    var cellStrs = [["非医疗身体素质评估","代母及其伴侣犯罪调查","代母心理调查","准父母犯罪背景调查"],["代母微信群管理","代母群活动","孕期用药指导及监督","生产探望","生产全程陪同","孕期保健品及有机食品补助","代母心理补导"],["账户管理","网银账户查询","国际汇款绿色通道"],["代母微信群管理","代母群活动","孕期用药指导及监督","生产探望","生产全程陪同","孕期保健品及有机食品补助","代母心理补导"]]
    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewPackageItemTableViewCellSetData(_ indexPath:IndexPath, cell:PackageItemTableViewCell) {
        cell.cellSetData(itemTitle: cellStrs[indexPath.section][indexPath.row], select: false)
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath){
        
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
        return titleStrs[section]
    }
}

extension MealListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleStrs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellStrs[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PackageItemTableViewCell.description(), for: indexPath)
        self.tableViewPackageItemTableViewCellSetData(indexPath, cell: cell as! PackageItemTableViewCell)
        return cell
    }
}

