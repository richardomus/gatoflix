//
//  MoviePreviewViewController.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 05/06/23.
//

import UIKit
import WebKit

class MoviePreviewViewController: UIViewController {

    var trailerURL: String?
    
    @IBOutlet var webView: WKWebView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        webView?.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let url = URL(string: trailerURL ?? String()) {
            webView?.load(URLRequest(url: url))
            webView?.allowsBackForwardNavigationGestures = true
        }
    }
}

extension MoviePreviewViewController: WKNavigationDelegate {
    
}
