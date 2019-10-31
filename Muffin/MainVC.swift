//
//  MainVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit
var pastries = [Pastry]()

class MainVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //private let reuseIdentifier = "PastryCVCell"

    
    
    @IBOutlet weak var Pastries: UICollectionView!
    @IBOutlet weak var Oven_button: UIButton!
    //Oven should force the user to either click a collection item to headstart the oven or click the oven to cancel.
    
    override func viewDidLoad() {
           super.viewDidLoad()
        loadDefaults()
        //Pastries.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PastryCVCell")

        Pastries.delegate=self
        Pastries.dataSource=self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1//essentially the amount of collections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pastries.count//amount of cells
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Pastries.dequeueReusableCell(withReuseIdentifier:"PastryCVCell",for: indexPath) as! PastryCVCell
        let pastry=pastries[indexPath.item]
        cell.Pastry_Image.image=pastry.Item_pic
        return cell
    }
    /*
    func collectionView(_ Pastries: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = Pastries.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PastryCVCell else{fatalError("The dequeued cell is not an instance of PastryCVCell.")}
        let pastry=pastries[indexPath.item]
        cell.Pastry_Image.image=pastry.Item_pic
        // Configure the cell
    
        return cell
    }*/
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
