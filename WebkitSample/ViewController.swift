//
//  ViewController.swift
//  WebkitSample
//
//  Created by Benoit PASQUIER on 20/11/2017.
//  Copyright © 2017 Benoit PASQUIER. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

class ViewController: UIViewController {
    
    var webView: WKWebView!
    
    private func setupWebView() {
        let config = WKWebViewConfiguration()
        config.userContentController = WKUserContentController()
        
        let token = "this_tok"
        
        var userScript = WKUserScript(
            source: "setIOSToken('\(token)')",
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        )
        config.userContentController.addUserScript(userScript)

        self.webView = WKWebView(frame: self.view.bounds, configuration: config)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupWebView()
        self.view.addSubview(self.webView)
        
        if let url = Bundle.main.url(forResource: "index", withExtension:"html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
