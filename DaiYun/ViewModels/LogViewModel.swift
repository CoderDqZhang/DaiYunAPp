//
//  LogViewModel.swift
//  DaiYun
//
//  Created by Zhang on 15/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift

class LogViewModel: BaseViewModel {

    var models = NSMutableArray.init()
    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewLogTableViewCellSetData(_ indexPath:IndexPath, cell:LogTableViewCell) {
        if self.models.count > 0 {
            cell.cellSetData(model: LogModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary))
        }
    }
    
    func requestNetWork(model:MotherModel){
        let url = "\(BaseUrl)\(LogDataItem)"
        let parameters = ["uid":UserModel.shareInstance.id,
                          "dmid":model.dmId]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension LogViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

extension LogViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogTableViewCell.description(), for: indexPath)
        self.tableViewLogTableViewCellSetData(indexPath, cell: cell as! LogTableViewCell)
        return cell
    }
}
