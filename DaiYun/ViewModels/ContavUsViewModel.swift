//
//  ContavUsViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ContavUsViewModel: BaseViewModel {

    var sessionNumberRow = [2]
    var cellStrs = ["联系我们","发生邮件"]
    var detailStr = ["183638999723","769839948@qq.com"]
    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        cell.setCellData(text: cellStrs[indexPath.row], detailText: detailStr[indexPath.row], detailTextColor: UIColor.init(hexString: App_Theme_8A96A2_Color))
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
}

extension ContavUsViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ContavUsViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionNumberRow[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for: indexPath)
        self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
        return cell
    }
}

