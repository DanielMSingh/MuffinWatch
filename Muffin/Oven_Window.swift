//
//  Oven Window.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//
//VC for the Oven popup window that opens when adding something to the oven or checking what's in it.

import UIKit
var oven = [Pastry]()

class Oven_Window:  UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var Tray: UICollectionView!
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1//essentially the amount of collections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oven.count//amount of cells
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Tray.dequeueReusableCell(withReuseIdentifier:"PastryCVCell",for: indexPath) as! PastryCVCell
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
        self.performSegue(withIdentifier: "edit", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //copy from main in regards to the collection
    //in the edit page, make it so that there's an input that tells whether or not something is in the oven.
    //make a for loop? iterating through the pastry list putting everything that has that checked into the oven list
    //for the timer, set it up so that the main looks at the oven and the oven looks at the main.
    

}
