//
//  ConfideViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import NJKWebViewProgress


class ConfideViewController: BaseViewController {

    var webView:UIWebView!
    var progressProxy:NJKWebViewProgress!
    var progressView:NJKWebViewProgressView!
    
    var strUrl:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.loadWebViewUrl(url: strUrl)
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        progressProxy = NJKWebViewProgress.init()
        webView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT))
        webView.delegate = progressProxy
        progressProxy.webViewProxyDelegate = self
        progressProxy.progressDelegate = self
        
        let progressBarHeight:CGFloat = 2;
        let frame = CGRect.init(x: 0, y: (navigationBar?.bounds.size.height)! - progressBarHeight, width: SCREENWIDTH, height: progressBarHeight)
        progressView = NJKWebViewProgressView.init(frame: frame)
        progressView.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleTopMargin]
        
        self.view.addSubview(progressView)
        
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "信托账户"
    }
    
    func loadWebViewUrl(url:String){
        webView.loadRequest(URLRequest.init(url: URL.init(string: url)!))
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

extension ConfideViewController : NJKWebViewProgressDelegate {
    func webViewProgress(_ webViewProgress: NJKWebViewProgress!, updateProgress progress: Float) {
        progressView.setProgress(progress, animated: true)
    }
}

extension ConfideViewController: UIWebViewDelegate {
    
}
