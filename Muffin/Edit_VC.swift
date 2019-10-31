//
//  Edit_VC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/13/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

class Edit_VC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var Interaction: UILabel!
    @IBOutlet weak var ItemName: UITextField!
    @IBOutlet weak var ItemDescription: UITextField!
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var BakeTime: UITextField!
    
    //differentiate the Interaction based on which segue was called using the 'Prepare for Segue'
    
    
    @IBAction func Submit(_ sender: Any) {
        if (Interaction.text=="Add Item"){
            guard let pastry = Pastry(Item_name: ItemName.text!, Item_quantity: 0, Item_description: ItemDescription.text!, Item_pic: ItemImage.image!, Bake_time:300)
                   else {fatalError("unable to create pastry")}
            pastries.append(pastry)
        }
        else if (Interaction.text=="Edit Item"){
            //take reference of the item to be edited
        }
        else {fatalError("Invalid interaction")}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
