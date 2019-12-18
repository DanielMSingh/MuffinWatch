//
//  EditVC.swift
//  Muffin
//
//  Created by Daniel Singh on 12/3/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

class Edit: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var ItemName: UITextField!
    @IBOutlet weak var BakeTime: UIDatePicker!
    @IBOutlet weak var ItemDescription: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var OvenCheck: UISwitch!
    
    let imagePicker=UIImagePickerController()
    var temp_price=String(pastries[pastryindex].Price)
    weak var main:Main?
     override func viewDidLoad() {
        //make the defaults go by whatever the things are here.
        ItemName.text=pastries[pastryindex].Item_name
        BakeTime.countDownDuration=pastries[pastryindex].Bake_time
        ItemDescription.text=pastries[pastryindex].Item_description
        temp_price=String(pastries[pastryindex].Price)
        //Price.text="$"+temp_price//will have to format it with a split at any enter or comma?
        Price.text=temp_price
        ItemImage.image=pastries[pastryindex].Item_pic
        imagePicker.delegate=self
        OvenCheck.setOn(pastries[pastryindex].oven,animated: false)
        super.viewDidLoad()
     }//viewDidLoad
    
    @IBAction func Delete(_ sender: Any) {
        pastries.remove(at: pastryindex)
        ItemName.text="none"
        ItemDescription.text="none"
        Price.text="none"
        ItemImage.image = nil
    }
    @IBAction func ImageBtn(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:true, completion: nil)
    }
    
    @IBAction func Special(_ sender: Any) {
        special=pastryindex
    }
    @IBAction func Done(_ sender: Any) {
        //dismiss
        main?.Pastries.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Submit(_ sender: Any) {
        //if (Interaction=="Add"||Interaction==""){
            //InteractionLabel.text = "Add Item"
        //make it so that if there's anything missing, it won't work.
        var img = UIImage(named: "img_Default")
        let Btime = BakeTime.countDownDuration
        let itemPrice:Float!=Float(Price.text!)
            //do necessary calculations on Btime to make it accurate
            //if it's a minute:second timer, calculate time in seconds here
            //there's a page in the reading list with an input mask class that'd make it easier
            //would be a string still and would be able to just take in hh:mm:ss or whatever
            //then *here* I would convert it into an integer representing amount of seconds
            //in the oven, I'd have calculations to turn it back into hh:mm:ss for the timer
        //brownies take 25~30 minutes, muffins, around 30, scones: 15... minutes makes sense
        guard let name = ItemName.text, !name.isEmpty else {return}
        guard let description = ItemDescription.text, !description.isEmpty else {return}
        if (!(ItemImage.image==nil))
            {img = ItemImage.image}
        if (!pastries[pastryindex].oven && OvenCheck.isOn){
            //if the item was not already in the oven but oven has been checked, add to oven
            Oven.append(pastries[pastryindex])
            ovenIdx.append(pastryindex)//for freshness
            timers.append(pastries[pastryindex].Bake_time)
            print("adding to oven")
        }
        guard let pastry = Pastry(Item_name: name, Item_quantity: 0, Item_description: description, Item_pic: img, Bake_time:Btime, Price:itemPrice, oven: (OvenCheck.isOn), fresh:(pastries[pastryindex].Fresh))
            //index is set to the number of stripastries in the list; i.e. if empty, then 0
                   else {fatalError("unable to create pastry")}
            pastries[pastryindex]=pastry//replace everything with this new one
        //}
        ItemName.text=pastries[pastryindex].Item_name
        BakeTime.countDownDuration=(pastries[pastryindex].Bake_time)
        ItemDescription.text=pastries[pastryindex].Item_description
        //Price.text="$"+temp_price
        Price.text=temp_price
        ItemImage.image=pastries[pastryindex].Item_pic
        //refreshing the page with the new data (just in case)
    }
    
    
    
    
    
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ItemImage.contentMode = .scaleAspectFit
            ItemImage.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
    }//imagePickerController
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
