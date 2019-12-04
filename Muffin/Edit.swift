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
    @IBOutlet weak var BakeTime: UITextField!
    @IBOutlet weak var ItemDescription: UITextField!
    @IBOutlet weak var Ingredients: UITextField!
    @IBOutlet weak var ItemImage: UIImageView!
    
    let imagePicker=UIImagePickerController()

     override func viewDidLoad() {
        //make the defaults go by whatever the things are here.
        ItemName.text=pastries[pastryindex].Item_name
        BakeTime.text=String(pastries[pastryindex].Bake_time)
        ItemDescription.text=pastries[pastryindex].Item_description
        //Ingredients.text=pastries[pastryindex].Ingredients//will have to format it with a split at any enter or comma?
        ItemImage.image=pastries[pastryindex].Item_pic
         super.viewDidLoad()
         imagePicker.delegate=self
     }//viewDidLoad
     
    
    
    @IBAction func ImageBtn(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:true, completion: nil)
    }
    @IBAction func Submit(_ sender: Any) {
        //if (Interaction=="Add"||Interaction==""){
            //InteractionLabel.text = "Add Item"
        var img = UIImage(named: "img_Default")
        let Btime:Int! = Int(BakeTime.text!)
            //do necessary calculations on Btime to make it accurate
            //if it's a minute:second timer, calculate time in seconds here
        guard let name = ItemName.text, !name.isEmpty else {return}
        guard let description = ItemDescription.text, !description.isEmpty else {return}
        if (!(ItemImage.image==nil))
            {img = ItemImage.image}
        guard let pastry = Pastry(Item_name: name, Item_quantity: 0, Item_description: description, Item_pic: img, Bake_time:Btime)
            //index is set to the number of pastries in the list; i.e. if empty, then 0
                   else {fatalError("unable to create pastry")}
            pastries[pastryindex]=pastry//replace everything with this new one
        //}
        ItemName.text=pastries[pastryindex].Item_name
        BakeTime.text=String(pastries[pastryindex].Bake_time)
        ItemDescription.text=pastries[pastryindex].Item_description
        //Ingredients.text=pastries[pastryindex].Ingredients//
        ItemImage.image=pastries[pastryindex].Item_pic
        
            //take reference of the item to be edited
            //set all fields as the current data for the item to be edited
            //edit the item
            //may need to have some built-in reference to find the pastry and overwrite it
            
            //most likely, have a way to select the collection and while the item is selected,
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
