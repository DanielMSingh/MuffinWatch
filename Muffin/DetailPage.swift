//
//  DetailPageVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//
//VC for details pages, which will be different depending upon what opens it
//therefore there should be some function that takes in which item is being shown
//and outputs the right details, etc. based on it.
//used for product info and could probs be reused for the edit and Add popup windows.

import UIKit

class DetailPage: UIViewController {
    //for the view
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Pic: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    @IBAction func Done(_ sender: Any) {
        //dismiss to shopper
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text=pastries[pastryindex].Item_name
        Pic.image=pastries[pastryindex].Item_pic
        price.text="$"+String(pastries[pastryindex].Price)
        Description.text=pastries[pastryindex].description
    }
    //in the collectionview, show all the items in [pastries].
    //do all the same stuff for the detail view that was done in the main for edit segue.
    
    
    //first thing first, make the button work to activate this. 
}
