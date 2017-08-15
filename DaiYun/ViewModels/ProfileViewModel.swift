//
//  ProfileViewModel.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class ProfileViewModel: BaseViewModel {

    let sessionNumberRow = [1,2,2,1,4,1]
    let cellTextLabelStrs = [["当前状态","匹配信息"],["信托账户","签署文件"],["医生信息"],["常见问题","会客室","查看日志","关于我们"]]
    override init() {
        
    }
    
    func logOutPress(){
        UserModel.shareInstance.logOut()
        NavigaiontPresentView(self.controller!, toController: UINavigationController.init(rootViewController: LoginViewController()))
    }
    
    //MARK: TableViewCellSetData
    func tableViewGloableLableDetailLabelImageCellSetData(_ indexPath:IndexPath, cell:GloableLableDetailLabelImageCell) {
        if indexPath.section == 1 && indexPath.row == 0 {
            cell.setCellData(text: cellTextLabelStrs[indexPath.section - 1][indexPath.row], detailText: "胚胎准备", detailTextColor: nil)
        }else{
            cell.setCellData(text: cellTextLabelStrs[indexPath.section - 1][indexPath.row], detailText: nil, detailTextColor: nil)
        }
    }
    
    func tableViewProfileTableViewCellSetData(_ indexPath:IndexPath, cell:ProfileTableViewCell) {
        cell.cellSetData(model: UserModel.shareInstance)
    }
    
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        switch indexPath.section {
        case 0:
            break
        case 1:
            switch indexPath.row {
            case 0:
                NavigationPushView(self.controller!, toConroller: StatusViewController())
            default:
                NavigationPushView(self.controller!, toConroller: MatchingInfoViewController())
            }
        case 2:
            switch indexPath.row {
            case 0:
                NavigationPushView(self.controller!, toConroller: ConfideViewController())
            default:
                NavigationPushView(self.controller!, toConroller: SignFileViewController())
            }
        case 3:
            NavigationPushView(self.controller!, toConroller: DoctorInfoViewController())
        default:
            switch indexPath.row {
            case 0:
                NavigationPushView(self.controller!, toConroller: NormalQuesViewController())
            case 1:
                NavigationPushView(self.controller!, toConroller: ContactUsViewController())
            case 2:
                NavigationPushView(self.controller!, toConroller: ContactUsViewController())
            default:
                NavigationPushView(self.controller!, toConroller: AboutUsViewController())
            }
        }
    }
}

extension ProfileViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 4 {
            return 20
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 65
        default:
            return 50
        }
    }
}

extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionNumberRow[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.description(), for: indexPath)
            self.tableViewProfileTableViewCellSetData(indexPath, cell: cell as! ProfileTableViewCell)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: LogoutTableViewCell.description(), for: indexPath)
            let button = CustomButton.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 50), title: "退出登录", tag: 1, titleFont: App_Theme_PinFan_R_15_Font!, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
                self.logOutPress()
            })
            cell.contentView.addSubview(button)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableLableDetailLabelImageCell.description(), for: indexPath)
            self.tableViewGloableLableDetailLabelImageCellSetData(indexPath, cell: cell as! GloableLableDetailLabelImageCell)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
}
