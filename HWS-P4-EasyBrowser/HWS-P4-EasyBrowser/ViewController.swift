//
//  ViewController.swift
//  HWS-P4-EasyBrowser
//
//  Created by jamie stirrat on 13/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit
//import WebKit
import WebKit

//inherit WKNavigationDelegate protocol
class ViewController: UIViewController, WKNavigationDelegate {
    
    //create webView variable *
    var webView: WKWebView! //When creating the WebView, you need to store it as a property so it can be referenced later on. the variable extends WK(webkit)WebView.
    //create progressView variable *
    var progressView: UIProgressView!
    //adding an array of accessible websites
    var websites = ["apple.com", "hackingwithswift.com"]

    //load the webView *
    override func loadView() { //loadView() function
        webView = WKWebView() //our variable = the swift WV Object
        webView.navigationDelegate = self //"when any webpage navigation happens, tell me"
        view = webView //view of controller = the webview object
    }
    
    //setup after view - Load particular webpage *
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://" + websites[0])! //define url =
        webView.load(URLRequest(url: url)) //Load url from request
        webView.allowsBackForwardNavigationGestures = true //allow gesture to navigate backwards and forwards between pages
        
    //"Open" button on right of NavBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Open", style: .plain, target: self, action:
            #selector(openTapped))
        
    //Creating the progressView * - how can I make it into a bar below the nav bar?
        progressView = UIProgressView(progressViewStyle: .default) //creates a new UIProgressView instance. We're setting it as default.
        progressView.sizeToFit() //Sizes to fit layout fully
        let progressButton = UIBarButtonItem(customView: progressView) //progressView is a new UIBarButtonItem as we can't just add it to the toolbar or the rightBarButtonItem
    
    //Using KVO (key value observation) for the progressView *
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil) //addObserver method takes 4 parameters. Who the observer is (us), the property we want to observe (key path), the value we want (the new one) and a context value.
        
    //Create the toolbar *
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //.flexibleSpace creates a sort of spring that pushes other items into empty space until the bar is filled. The flexible space takes up as much room as it can on the left.
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload)) //referesh button that reloads the webView
        toolbarItems = [progressButton, spacer, refresh] //array containing the items
        navigationController?.isToolbarHidden = false //showing the toolbar
    }

    //openTapped function to present alert on tapping
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message:
            nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default,
                                       handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel)) //Cancel option which will hide alert if tapped.
        present(ac, animated: true)
    }
    
    
    //open the selected page (from the alert)
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    //set the title of the webView as the title of the page *
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

    //linked to KVO and progressBar above *
    override func observeValue(forKeyPath keyPath: String?, of
        object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
        progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    //evaluate URL to see if it is in safe list
    func webView(_ webView: WKWebView, decidePolicyFor
        navigationAction: WKNavigationAction, decisionHandler:
        @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url!.host {
            for website in websites {
                if host.range(of: website) != nil {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
    }
}
