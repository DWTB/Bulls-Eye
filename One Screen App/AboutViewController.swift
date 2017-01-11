//
//  AboutViewController.swift
//  One Screen App
//
//  Created by Ashton Walden on 1/10/17.
//  Copyright © 2017 RelativeDecay. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    //Vars
    @IBOutlet weak var webView: UIWebView!
    
    //Closes the menu
    @IBAction func close() {
        dismiss(animated: true, completion: nil) 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Loads html doc
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
