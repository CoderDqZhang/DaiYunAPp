//
//  NormalViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class NormalViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    override init() {
        super.init()
        self.requestNetWork()
    }
    
    //MARK: TableViewCellSetData
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        
        cell.setCellData(text: NormalQuestModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary).flQuestion, detailText: nil, detailTextColor: nil)
    }
    
    func tableViewNormalQuestTableViewCellCellSetData(_ indexPath:IndexPath, cell:NormalQuestTableViewCell){
        let model = NormalQuestModel.init(fromDictionary: self.models[indexPath.section] as! NSDictionary)
        cell.cellSetData(model: model)
    }
    
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
    func requestNetWork(){
        let url = "\(BaseUrl)\(NormalQuestion)"
        BaseNetWorke.sharedInstance.getUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
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
            return tableView.fd_heightForCell(withIdentifier: NormalQuestTableViewCell.description(), configuration: { (cell) in
                self.tableViewNormalQuestTableViewCellCellSetData(indexPath, cell: cell as! NormalQuestTableViewCell)
            })
        }
    }
}

extension NormalViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.models.count
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

