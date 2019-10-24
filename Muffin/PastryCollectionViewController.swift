//
//  PastryCollectionViewController.swift
//  Muffin
//
//  Created by Daniel Singh on 10/24/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PastryCollectionViewCell"

class PastryCollectionViewController: UICollectionViewController{
    //add and edit shouldwork on this array:
    var pastries = [Pastry]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       /* self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
*/
        // Do any additional setup after loading the view.
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pastries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PastryCollectionViewCell else{fatalError("The dequeued cell is not an instance of PastryCollectionViewCell.")}
        let pastry=pastries[indexPath.item]
        cell.Pastry_Image.image=pastry.Item_pic
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


    private func loadDefaults(){
        let photo1=UIImage(named: "Blueberry_Muffin")
        let photo2=UIImage(named:"Scone")
        let photo3=UIImage(named:"Brownie")
    
    
        guard let pastry1 = Pastry(Item_name: "Blueberry Muffin", Item_quantity: 3, Item_description: "A muffin with blueberries", Item_pic: photo1, Bake_time: 300)
        else {fatalError("unable to create pastry")}
        guard let pastry2 = Pastry(Item_name: "Scone", Item_quantity: 7, Item_description: "Basically an english muffin?", Item_pic: photo2, Bake_time: 600)
        else {fatalError("unable to create pastry")}
        guard let pastry3 = Pastry(Item_name: "Brownie", Item_quantity: 12, Item_description: "Bruh, you know what a brownie is", Item_pic: photo3, Bake_time: 300)
        else {fatalError("unable to create pastry")}
        pastries+=[pastry1,pastry2,pastry3]
    }
    
}
