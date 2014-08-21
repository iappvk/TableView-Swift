//
//  detailView.swift
//  sample2
//
//  Created by Vijayakumar on 21/08/14.
//  Copyright (c) 2014 Vijayakumar. All rights reserved.
//

import UIKit

class detailView: UIViewController {

    
    @IBOutlet var title1 : UILabel = nil
   
    @IBOutlet var image : UIImageView = nil
    
    @IBOutlet var description1 : UITextView = nil
    
    var emptyDict:NSMutableDictionary = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title1.text=emptyDict["title"] as String;
        description1.text=emptyDict["description"] as String
        
        // If the image does not exist, we need to download it
        var imgURL: NSURL = NSURL(string: emptyDict["image"] as String)
        
        // Download an NSData representation of the image at the URL
        let request:NSURLRequest=NSURLRequest(URL:imgURL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
            if error == nil {
                var image1 = UIImage(data: data)
                self.image.image = image1
                
            }
            else {
                println("Error: \(error.localizedDescription)")
            }
            })
        
        

        // Do any additional setup after loading the view.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
