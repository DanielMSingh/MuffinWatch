//
//  Account.swift
//  Muffin
//
//  Created by Daniel Singh on 12/5/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

class Account: UIViewController {

    @IBOutlet weak var AccountType: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        AccountType.text=accounttype
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)//dismiss, don't pop because modal
    }
    
    
    @IBAction func LogOut(_ sender: Any) {
        print("Logging OUT")
        performSegue(withIdentifier: "Logout", sender: self)
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
