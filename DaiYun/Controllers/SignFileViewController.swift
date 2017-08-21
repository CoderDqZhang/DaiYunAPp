//
//  SignFileViewController.swift
//  DaiYun
//
//  Created by Zhang on 06/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit
import NJKWebViewProgress

class SignFileViewController: BaseViewController {
    
    var webView:UIWebView!
    var progressProxy:NJKWebViewProgress!
    var progressView:NJKWebViewProgressView!
    
    var strUrl:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
//        self.loadWebViewUrl(url: strUrl)
        self.setUpNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        progressProxy = NJKWebViewProgress.init()
        webView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT))
        webView.loadRequest(URLRequest.init(url: URL.init(string: strUrl)!))
        webView.delegate = progressProxy
        progressProxy.webViewProxyDelegate = self
        progressProxy.progressDelegate = self
        
        let progressBarHeight:CGFloat = 2;
        let frame = CGRect.init(x: 0, y: (navigationBar?.bounds.size.height)! - progressBarHeight, width: SCREENWIDTH, height: progressBarHeight)
        progressView = NJKWebViewProgressView.init(frame: frame)
        progressView.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleTopMargin]
        
        self.view.addSubview(progressView)
        self.view.addSubview(webView)
        
    }
    
    func dowloadPdfImage(){
        let url = "http://www.qupu123.com/downpdf/505309/A%20Rock%20(Jazz%20Ensemble)1.pdf"
        BaseNetWorke.sharedInstance.downloadUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted {
                let request = URLRequest.init(url: resultDic.value as! URL)
                self.webView.scalesPageToFit = true
                self.webView.loadRequest(request)
                print(resultDic)
            }
        }
    }
    
    func setUpNavigationItem(){
        self.navigationItem.title = "签署文件"
    }
    
    func loadWebViewUrl(url:String){
        let path = Bundle.main.path(forResource: "TestDemo.pdf", ofType: nil)
        let request = URLRequest.init(url: URL.init(fileURLWithPath: path!))
        self.webView.scalesPageToFit = true
        self.webView.loadRequest(request)
        //        webView.loadRequest(URLRequest.init(url: URL.init(string: url)!))
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

extension SignFileViewController : NJKWebViewProgressDelegate {
    func webViewProgress(_ webViewProgress: NJKWebViewProgress!, updateProgress progress: Float) {
        progressView.setProgress(progress, animated: true)
    }
}

extension SignFileViewController: UIWebViewDelegate {
    
}
