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
    override init() {
        super.init()
    }
    
    //MARK: TableViewCellSetData
    func tableViewFilterTableViewCellSetData(_ indexPath:IndexPath, cell:FilterTableViewCell) {
        cell.cellSetData(text: filterStrs[indexPath.row])
    }
    
    func tableViewGloableNoneCellSetData(_ indexPath:IndexPath, cell:GloableNoneCell) {
        
    }
}

extension FilterViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        switch indexPath.row {
        case 0,1,2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.description() , for: indexPath)
            self.tableViewFilterTableViewCellSetData(indexPath,cell: cell as! FilterTableViewCell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableNoneCell.description() , for: indexPath)
            let button = CustomButton.init(frame: CGRect.init(x: 15, y: 0, width: SCREENWIDTH - 30, height: 49), title: "提交", tag: 1, titleFont: App_Theme_PinFan_R_14_Font!, type: CustomButtonType.withBoarder, pressClouse: { (tag) in
                
            })
            cell.contentView.addSubview(button)
            self.tableViewGloableNoneCellSetData(indexPath,cell: cell as! GloableNoneCell)
            return cell
        }
    }
}

