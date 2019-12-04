//
//  StartupVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/24/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit
var accounttype = "Shopper"
class StartupVC: UIViewController {

    @IBAction func ToStoreMain(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Owner(_ sender: Any) {
        accounttype="Store Owner"
    }
    @IBAction func Customer(_ sender: Any) {
        accounttype="Shopper"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
