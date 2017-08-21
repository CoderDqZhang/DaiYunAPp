//
//  ConfideListViewModel.swift
//  DaiYun
//
//  Created by Zhang on 19/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ConfideListViewModel: BaseViewModel {

    var cellStrs = ["测试pdf阅读","测试pdf阅读"]
    var models = NSMutableArray.init()
    override init() {
        super.init()
    }
    
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        cell.setCellData(text: PDFModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary).paName, detailText: nil, detailTextColor: nil)
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        if (self.controller as! ConfideListViewController).isConfideView {
            let toControllerVC = ConfideViewController()
            toControllerVC.strUrl = PDFModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary).paSrc
            NavigationPushView(self.controller!, toConroller: toControllerVC)
        }else{
            let toControllerVC = SignFileViewController()
            toControllerVC.strUrl = PDFModel.init(fromDictionary: self.models[indexPath.row] as! NSDictionary).paSrc
            NavigationPushView(self.controller!, toConroller: toControllerVC)
        }
    }
    
    //MARK: RequestNetWork
    func requestConfideList(type:String){
        let url = "\(BaseUrl)\(PDFImageUrl)"
        let parameters = ["ptype":type]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                self.models = NSMutableArray.mj_keyValuesArray(withObjectArray: resultDic.value as! [Any])
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension ConfideListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ConfideListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for: indexPath)
        self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
