//
//  ShopperVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/31/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit

class Shopper: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    
    
    
    @IBOutlet weak var Pastries: UICollectionView!
    @IBAction func Acc(_ sender: Any) {
        accounttype="Customer"
        self.performSegue(withIdentifier: "Acc", sender: self)

    }
    //copy most of the stuff from Main.swift;
    //for like the collectionview, etc.
    override func viewDidLoad() {
        accounttype="Customer"
        Pastries.delegate=self
        Pastries.dataSource=self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: 300, height: 300)
        return cell
    }/*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)->CGSize{
        return CGSize(width:CGFloat(10000), height:CGFloat(10000))
    }*/
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pastryindex = indexPath.row//tells which pastry is being selected
        self.performSegue(withIdentifier: "Details", sender: self)
    }
    
    
    
    //pretty much like main, except some are already defined there and should be able to use that.
    //then if you select one of the cells, it should decrement the quantity of whatever item it's related to in the detail page if you select purchase (amount) in details to simulate the purchasing process to show what the stock is

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
