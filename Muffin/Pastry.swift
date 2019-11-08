//
//  Pastry.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit
/*the pastry class contains information about the individual pastries/baked-goods
 that will be displayed in the collection view and whose details will be  displayed
 in the detail view page and edited in the edit page*/
class Pastry: NSObject{
    //quantity should be changed by the oven function but can be directly edited by the edit page
    var Item_quantity: Int;
    var Item_name: String;
    var Item_description: String;
    var Item_pic: UIImage?;
    //will need to convert from hours:minutes:seconds to seconds before initialising from inputs
    var Bake_time: Int;
    //initialisation:
    func isValid() -> Bool{
        return (!(Item_quantity>=0) && !(Item_name.isEmpty) && !(Item_description.isEmpty) && !(Bake_time>=0))
    }
    init?(Item_name: String, Item_quantity: Int, Item_description: String, Item_pic: UIImage?, Bake_time: Int){
        //initialisation fails without name or description. 
        guard(!Item_name.isEmpty) else
            {return nil}//name must not be empty
        guard(!Item_description.isEmpty) else
            {return nil}//description must not be empty
        guard(Item_quantity>=0) else
            {return nil}//quantity must not be negative
        guard(Bake_time>=0) else
            {return nil}//Bake Time must not be negative
        self.Item_quantity = Item_quantity;
        self.Item_name = Item_name;
        self.Item_description = Item_description;
        self.Item_pic = Item_pic;
        self.Bake_time = Bake_time;
    }
}
