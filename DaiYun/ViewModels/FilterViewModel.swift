//
//  FilterViewModel.swift
//  DaiYun
//
//  Created by Zhang on 01/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit


class FilterViewModel: BaseViewModel {

    let filterStrs = ["有无经验","是否已婚","已预约"]
    var selectArray:NSMutableArray = []
    override init() {
        super.init()
        if UserDefaultsGetSynchronize("FilterArray") is String {
             selectArray = [0,0,0]
            UserDefaultsSetSynchronize(selectArray, key: "FilterArray")
        }else{
            let array = NSMutableArray.init(array: UserDefaultsGetSynchronize("FilterArray") as! Array)
            for i in array {
                selectArray.add(i)
            }
        }
    }
    
    //MARK: TableViewCellSetData
    func tableViewFilterTableViewCellSetData(_ indexPath:IndexPath, cell:FilterTableViewCell) {
        cell.cellSetData(text: filterStrs[indexPath.row])
        if selectArray[indexPath.row] as! Int == 0 {
            cell.accessoryType = .none
            cell.updateTextColor(select: false)
        }else{
            cell.accessoryType = .checkmark
            cell.updateTextColor(select: true)
        }
    }
}

extension FilterViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! FilterTableViewCell
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if selectArray[indexPath.row] as! Int == 0 {
            cell.accessoryType = .checkmark
            selectArray.replaceObject(at: indexPath.row, with: 1 as AnyObject)
            cell.updateTextColor(select: true)
        }else{
            cell.accessoryType = .none
            selectArray.replaceObject(at: indexPath.row, with: 0)
            cell.updateTextColor(select: false)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 49
        default:
            return 49
        }
    }
}
extension FilterViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.description() , for: indexPath)
            self.tableViewFilterTableViewCellSetData(indexPath,cell: cell as! FilterTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableNoneCell.description() , for: indexPath)
            let button = CustomButton.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 49), title: "提交", tag: 1, titleFont: App_Theme_PinFan_R_14_Font!, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
                if (self.controller as! FilterViewController).commitPressClouse != nil {
                    self.controller?.navigationController?.popViewController()
                    (self.controller as! FilterViewController).commitPressClouse(self.selectArray)
                }
            })
            cell.contentView.addSubview(button)
            return cell
        }
    }
}

