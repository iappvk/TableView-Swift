//
//  ViewController.swift
//  sample2
//
//  Created by Vijayakumar on 20/08/14.
//  Copyright (c) 2014 Vijayakumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview : UITableView
    
    let simpleTableIdentifier = "CustomTableViewCell";
    var tableData:Array<AnyObject>=[];
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dict1:Dictionary<String,String>
        
        dict1=["image":"http://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/225px-Flag_of_India.svg.png",
            "title":"Indian flag",
            "description":"The National Flag of India is a horizontal rectangular tricolour of deep saffron, white and India green; with the Ashoka Chakra, a 24-spoke wheel, in navy blue at its centre. It was adopted in its present form during a meeting of the Constituent Assembly held on 22 July 1947, when it became the official flag of the Dominion of India. The flag was subsequently retained as that of the Republic of India. In India, the term \"tricolour\" (Hindi: तिरंगा, Tirangā) almost always refers to the Indian national flag. The flag is based on the Swaraj flag, a flag of the Indian National Congress designed by Pingali Venkayya.The flag, by law, is to be made of khadi, a special type of hand-spun cloth of cotton, or silk made popular by Mahatma Gandhi. The manufacturing process and specifications for the flag are laid out by the Bureau of Indian Standards. The right to manufacture the flag is held by the Khadi Development and Village Industries Commission, who allocate it to the regional groups. As of 2009, the Karnataka Khadi Gramodyoga Samyukta Sangha was the sole manufacturer of the flag."];
        tableData.append(dict1)
        
        
        var dict2:Dictionary<String,String>
        
        dict2=["image":"http://static.panoramio.com/photos/large/34325472.jpg", "title":"Thirumalai Nayakar Mahal. Madura", "description":"Thirumalai Nayak ruled Madurai between 1623 and 1659 CE. He was the most notable of the thirteen Madurai Nayak rulers in the 17th century. His contributions are found in the many splendid buildings and temples of Madurai. His kingdom was under constant threat from the armies of Bijapur Sultanate and the other neighbouring Muslim kingdoms, which he managed to repulse successfully. His territories comprised much of the old Pandya territories which included Coimbatore, Tirunelveli, Madurai districts, Aragalur in southern Tamil Nadu and some territories of the Travancore kingdom."];
        tableData.append(dict2)
        
        
        
        dict2=["image":"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Courtallam.jpg/250px-Courtallam.jpg", "title":"Courtallam", "description":"Courtallam (Tamil: குற்றாலம்) or Kutralam, Spa of South India, is a panchayat town situated at a mean elevation of 160 m (520 ft) on the Western Ghats in Tirunelveli District of Tamil Nadu, India. Many seasonal and few perennial rivers such as the Chittar River, the Manimuthar River, the Pachaiyar River and the Tambaraparani River originate in this region. The numerous waterfalls and cascades along with the ubiquitous health resorts in the area have earned it the title the Spa of South India.[1] The falls carry a good amount of water only when there is a rain on the hills, so it is advisable to see the weather forecast, when one plans to come to Courtallam . Season begins from June of every year till September. The South West Monsoon brings in the cold breeze with mild temperature. From October to December North East Monsoon sets over in Tamil Nadu and the climate is cold and the rains are very heavy sometimes. Sometimes the falls get flooded and people are not allowed to take bath during floods."];
        tableData.append(dict2)
        
        
        
        dict2=["image":"http://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Tiruvalluvar_statue_LIC.jpg/220px-Tiruvalluvar_statue_LIC.jpg", "title":"Thiruvalluvar Statue", "description":"The Thiruvalluvar Statue is a 133 feet (40.6 m) tall stone sculpture of the Tamil poet and philosopher Tiruvalluvar, author of the Thirukkural. It was opened on January 1, 2000 (Millennium) and is located atop a small island near the town of Kanyakumari, where two seas and an ocean meet; the Bay of Bengal, the Arabian Sea, and the Indian Ocean . The statue has a height of 95 feet (29 m) and stands upon a 38 foot (11.5 m) pedestal that represents the 38 chapters of \"virtue\" in the Thirukkural. The statue standing on the pedestal represents \"wealth\" and \"pleasures\", signifying that wealth and love be earned and enjoyed on the foundation of solid virtue.[1]"];
        tableData.append(dict2)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        
        var cell:CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell") as CustomTableViewCell
        
        
        var rowData:NSDictionary=tableData[indexPath.row] as NSDictionary;
        
        cell.cellTitle.text=rowData["title"] as String
        cell.cellDescription.text=rowData["description"] as String
        
        // If the image does not exist, we need to download it
        var imgURL: NSURL = NSURL(string: rowData["image"] as String)
        
        // Download an NSData representation of the image at the URL
        let request:NSURLRequest=NSURLRequest(URL:imgURL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
            if error == nil {
                var image = UIImage(data: data)
                cell.cellImg.image = image
                
            }
            else {
                println("Error: \(error.localizedDescription)")
            }
            })
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        performSegueWithIdentifier("Details", sender: self.view)
        println("Hai selezionato: \(indexPath.row)!")
    }
    
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
        
        return 87.0;
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        
        if segue!.identifier == "Details" {
            let viewController:detailView = segue!.destinationViewController as detailView
            let indexPath = tableview.indexPathForSelectedRow()
            var rowData:NSMutableDictionary=tableData[indexPath.row] as NSMutableDictionary;
            viewController.emptyDict = rowData;
            
            
        }
        
    }
    
    
    
    
    
}

