//
//  UIWebViewController.swift
//  FanseArea
//
//  Created by 张艺哲 on 2017/7/25.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit
import WebKit

class UIWebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.isHidden = true
        
        let wkWebView = WKWebView(frame: view.frame)
        view.addSubview(wkWebView)
        
        wkWebView.autoresizingMask = [.flexibleHeight]
        
        if let url = URL(string: "http://yizheyun.cn"){
            let request = URLRequest(url: url)
            
            wkWebView.load(request)
            
            //webView.loadRequest(request)
        }
        
        

        // Do any additional setup after loading the view.
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
