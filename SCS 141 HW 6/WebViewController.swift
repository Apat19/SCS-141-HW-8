//
//  WebViewController.swift
//  SCS 141 HW 6
//
//  Created by Austin Patton on 4/25/23.
//

import Foundation
import WebKit
import MessageUI

class WebViewController: UIViewController, MFMessageComposeViewControllerDelegate{
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        // No internal fucntion content is required
    }
    
    
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func sendSMS(_ sender: Any) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        //configure the fields of the interface
        composeVC.recipients = ["7243960224"]
        composeVC.body = "Hello, how are you doing?"
        
        
        
        //present the view controller modally
        if MFMessageComposeViewController.canSendText(){
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }
    
    
    
    override func viewDidLoad() {
        let myURL = URL(string: "https://www.nps.gov/grsm/index.htm")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
}
