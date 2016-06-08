//
//  ShareViewController.swift
//  GetURL
//
//  Created by User on 03/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
 var item: SLComposeSheetConfigurationItem!
   
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first as? NSItemProvider {
                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                    itemProvider.loadItemForTypeIdentifier("public.url", options: nil, completionHandler: { (url, error) -> Void in
                        
                        if (url as? NSURL) != nil {
                            // send url to server to share the link
                            print(url);

                            let defaults = NSUserDefaults.standardUserDefaults()
                            defaults.setObject(url, forKey: "URLArrayValue")

                        }
                        self.extensionContext?.completeRequestReturningItems([], completionHandler:nil)
                    })
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            self.title = "Wish List"
    }
 
    override func configurationItems() -> [AnyObject]! {
        self.item = SLComposeSheetConfigurationItem()
        
        self.item.title = "Price"
        self.item.value = "None"
        
        self.item.tapHandler = {
//            self.teamPickerVC = EditPriceViewController()
//            self.teamPickerVC.delegate = self
//            self.pushConfigurationViewController(self.teamPickerVC)
        /* wen tap the price its go to another controle */
        
        }
        
        return [self.item]
    }

    
}
