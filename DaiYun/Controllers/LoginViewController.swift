//
//  LoginViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/22.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift
import ReactiveCocoa


class LoginViewController: BaseViewController {

    var phontTextField:UITextField!
    var confimCodeField:UITextField!
    
    var lineLabel:GloabLineView!
    var lineLabel1:GloabLineView!
    
    var loginButton:UIButton!
    var serviceLabel:UILabel!
    
    var phoneStr:String = ""
    
    var comfigLabel:UILabel!
    var proBtn:CustomButton!
    
    let loginForm = LoginForm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: LoginViewModel(), controller: self)
        self.view.backgroundColor = UIColor.white
        self.setUpView()
        self.setupForDismissKeyboard()
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        
        lineLabel = GloabLineView(frame: CGRect(x: 15,y: 0,width: SwifterSwift.screenWidth - 30, height: 0.5))
        self.view.addSubview(lineLabel)
        
        lineLabel1 = GloabLineView(frame: CGRect(x: 15,y: 0,width: SwifterSwift.screenWidth - 30, height: 0.5))
        self.view.addSubview(lineLabel1)
        
        confimCodeField = self.createTextFiled(CGRect.zero)
        confimCodeField.placeholder = "请输入密码"
        confimCodeField.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        confimCodeField.font = App_Theme_PinFan_R_14_Font
        confimCodeField.reactive.continuousTextValues.observeValues { (str) in
            self.loginForm.password = str!
        }
        confimCodeField.keyboardType = .phonePad
        self.view.addSubview(confimCodeField)
        
        phontTextField = self.createTextFiled(CGRect.zero)
        phontTextField.tag = 1
        phontTextField.textColor = UIColor.init(hexString: App_Theme_384249_Color)
        phontTextField.keyboardType = .phonePad
        phontTextField.placeholder = "请输入账号"
        phontTextField.font = App_Theme_PinFan_R_14_Font
        phontTextField.reactive.continuousTextValues.observeValues { (action) in
            self.loginForm.username = action!
        }
        self.view.addSubview(phontTextField)
        
        
        loginButton = UIButton(type: .custom)
        loginButton.buttonSetThemColor(App_Theme_FB718C_Color, selectColor: APP_Theme_F87D95_Color, size:CGSize.init(width: SwifterSwift.screenWidth - 30, height: 49))
        loginButton.setTitle("立即登录", for: UIControlState())
        loginButton.titleLabel?.font = App_Theme_PinFan_M_15_Font
        loginButton.isEnabled = true
        loginButton.layer.cornerRadius = 2.0
        loginButton.layer.masksToBounds = true
        loginButton.setTitleColor(UIColor.init(hexString: App_Theme_FFFFFF_Color), for: UIControlState())
        loginButton.reactive.controlEvents(.touchUpInside).observe { (action) in
            (self.viewModel as! LoginViewModel).requestLogin(self.loginForm, controller: self)
        }
        self.view.addSubview(loginButton)
        
        
        comfigLabel = UILabel()
        comfigLabel.text = "登录即代表您同意"
        comfigLabel.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        comfigLabel.font = App_Theme_PinFan_R_12_Font
        self.view.addSubview(comfigLabel)
        
        
        
        proBtn = CustomButton.init(frame: CGRect.zero, title: "《代孕用户协议》", tag: 1, titleFont: App_Theme_PinFan_R_12_Font!, type: .withNoBoarder, pressClouse: { (tag) in
            NavigationPushView(self, toConroller: UserProtocolViewController())
        })
        self.view.addSubview(proBtn)
        
        self.makeConstraints()
        
    }
    
    func setUpNavigationItem() {
        self.navigationItem.title = "登录"
        self.setNavigationItemBack()
    }
    
    func createLabel(_ frame:CGRect, text:String) ->UILabel {
        let label = UILabel(frame: frame)
        label.textColor = UIColor.init(hexString: App_Theme_8A96A2_Color)
        label.font = App_Theme_PinFan_R_14_Font
        label.text = text
        return label
    }
    
    func createTextFiled(_ frame:CGRect) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.font = App_Theme_PinFan_R_14_Font
        textField.tintColor = UIColor.init(hexString: App_Theme_FB718C_Color)
        return textField
    }
    
    func makeConstraints(){
        
        phontTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(49)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.height.equalTo(20)
        }
        
        lineLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.phontTextField.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
        }
        
        confimCodeField.snp.makeConstraints { (make) in
            make.top.equalTo(self.lineLabel.snp.bottom).offset(17)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.height.equalTo(20)
        }
        
        lineLabel1.snp.makeConstraints { (make) in
            make.top.equalTo(self.confimCodeField.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.lineLabel1.snp.bottom).offset(28)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.height.equalTo(49)
        }
        
        comfigLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(24)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.height.equalTo(17)
        }
        
        proBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(24)
            make.left.equalTo(self.comfigLabel.snp.right).offset(2)
            make.height.equalTo(17)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
