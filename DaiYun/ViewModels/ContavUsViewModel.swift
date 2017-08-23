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
    func tableViewConnectOtherTableViewCellSetData(_ indexPath:IndexPath, cell:ConnectOtherTableViewCell) {
        cell.cellSetData(str: "I'm new to Swift, how can I convert a String to CGFloat? I tried: var fl: CGFloat = str as CGFloat var fl: CGFloat = (CGFloat)str var fl: CGFloat = CGFloat(str) all ...")
    }
    
    func tableViewConnectUserTableViewCellSetData(_ indexPath:IndexPath, cell:ConnectUserTableViewCell) {
        cell.cellSetData(str: "这是一个测试的数据")
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
        switch indexPath.row {
        case 0:
            return tableView.fd_heightForCell(withIdentifier: ConnectUserTableViewCell.description(), configuration: { (cell) in
                self.tableViewConnectUserTableViewCellSetData(indexPath, cell: cell as! ConnectUserTableViewCell)
            })
        default:
            return tableView.fd_heightForCell(withIdentifier: ConnectOtherTableViewCell.description(), configuration: { (cell) in
                self.tableViewConnectOtherTableViewCellSetData(indexPath, cell: cell as! ConnectOtherTableViewCell)
            })
        }
    }
}

extension ContavUsViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ConnectUserTableViewCell.description(), for: indexPath)
            self.tableViewConnectUserTableViewCellSetData(indexPath, cell: cell as! ConnectUserTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ConnectOtherTableViewCell.description(), for: indexPath)
            self.tableViewConnectOtherTableViewCellSetData(indexPath, cell: cell as! ConnectOtherTableViewCell)
            return cell
        }
        
    }
}

