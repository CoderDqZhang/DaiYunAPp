//
//  MotherInfoViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class MotherInfoViewModel: BaseViewModel {

    var sessionNumberRow = [1,4,3,4]
    var cellStrs = [["身高","体重","年龄","居住地"],["经验","婚姻","健康状态"],["生产","流产","剖腹产","并发症"]]
    var sessionTitles = ["基本信息","代孕信息","生育史"]
    var detailStrs = NSMutableArray.init()
    var model:MotherModel!
    var collectModel:CollectModel!
    var collectType:Bool = false
    
    override init() {
        super.init()
    }
    
    
    func rightBarItemPress(){
        self.collectionStatus()
    }
    
    func genderData(){
        let baseArray = NSMutableArray.init()
        baseArray.add(model.dmHeight)
        baseArray.add(model.dmWeight)
        baseArray.add(model.dmBirthday)
        baseArray.add(model.dmLocation)
        detailStrs.add(baseArray)
        
        let expArray = NSMutableArray.init()
        expArray.add(model.dmExperiencde)
        expArray.add(model.dmMarriage == "2" ? "已婚":"未婚")
        expArray.add(model.dmMedical)
        detailStrs.add(expArray)
        
        let array = NSMutableArray.init()
        array.add(model.dmBirth)
        array.add(model.dmMiscarriage)
        array.add(model.dmCsection)
        array.add(model.dmComplications)
        detailStrs.add(array)
    }
    
    //MARK: TableViewCellSetData
    func tableViewMotherInfoTableViewCellSetData(_ indexPath:IndexPath, cell:MotherInfoTableViewCell) {
        cell.cellSetData(model: self.model)
    }
    
    
    
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        cell.setCellData(text: cellStrs[indexPath.section - 1][indexPath.row], detailText: (detailStrs[indexPath.section - 1] as! NSMutableArray)[indexPath.row] as? String, detailTextColor: UIColor.init(hexString: App_Theme_8A96A2_Color))
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath){
        
    }
    
    //MARK: NetWorkRequest
    func collectionStatus(){
        var url = ""
        if self.collectType == true {
            url = "\(BaseUrl)\(MotherCollectDeleteUrl)"
        }else{
            url = "\(BaseUrl)\(MotherCollectAddUrl)"
        }

        let parameters = ["uid":UserModel.shareInstance.id,
                          "dmid":self.model.dmId]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: (resultDic.value as! NSDictionary).object(forKey: "data") as! String, autoHidder: true)
                if self.collectType == false {
                    if (resultDic.value as! NSDictionary).object(forKey: "status") as! String == "success" {
                        self.collectType = true
                    }
                }else{
                    if (resultDic.value as! NSDictionary).object(forKey: "status") as! String == "success" {
                        self.collectType = false
                    }
                }
                
                (self.controller as! MotherInfoViewController).setUpNavigationItem(collect: self.collectType)
            }
        }
    }
    
    func collectionGetStatus(){
        let url = "\(BaseUrl)\(MotherCollectStatusUrl)"
        let parameters = ["uid":UserModel.shareInstance.id,
                          "dmid":self.model.dmId]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                if (resultDic.value as! NSDictionary).object(forKey: "status") as! String == "success" {
                    self.collectType = true
                }else{
                    self.collectType = false
                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: (resultDic.value as! NSDictionary).object(forKey: "data") as! String, autoHidder: true)

                }
                (self.controller as! MotherInfoViewController).setUpNavigationItem(collect: self.collectType)
            }
        }
    }
}

extension MotherInfoViewModel: UITableViewDelegate {
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
        
        return  section > 0 ? sessionTitles[section - 1] : nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 156
        default:
            return 50
        }
    }
}

extension MotherInfoViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionNumberRow[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MotherInfoTableViewCell.description(), for: indexPath)
            cell.backgroundColor = UIColor.init(hexString: App_Theme_1B76D9_Color)
            self.tableViewMotherInfoTableViewCellSetData(indexPath, cell: cell as! MotherInfoTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for: indexPath)
            self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
            return cell
        }
    }
}
