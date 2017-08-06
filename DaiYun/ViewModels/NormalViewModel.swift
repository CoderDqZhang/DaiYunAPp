//
//  NormalViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class NormalViewModel: BaseViewModel {

    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        cell.setCellData(text: "常见问题", detailText: nil, detailTextColor: nil)
    }
    
    func tableViewNormalQuestTableViewCellCellSetData(_ indexPath:IndexPath, cell:NormalQuestTableViewCell){
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
}

extension NormalViewModel: UITableViewDelegate {
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
        switch indexPath.row {
        case 0:
            return 50
        default:
            return 80
        }
    }
}

extension NormalViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for: indexPath)
            self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: NormalQuestTableViewCell.description(), for: indexPath)
            self.tableViewNormalQuestTableViewCellCellSetData(indexPath, cell: cell as! NormalQuestTableViewCell)
            return cell
        }
    }
}

