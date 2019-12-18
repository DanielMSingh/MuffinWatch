//
//  Oven Window.swift
//  Muffin
//
//  Created by Daniel Singh on 10/8/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//
//VC for the Oven popup window that opens when adding something to the oven or checking what's in it.

import UIKit
var Oven = [Pastry]()
var ovenIdx:[Int]=[]//index of pastry in oven
var timers:[TimeInterval]=[]//list of timers for those in oven.
//var Tidx:Int=[]
class Oven_Window:  UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    
    weak var main:Main?
    weak var shopper:Shopper?
    weak var ticker:Timer?
    override func viewDidLoad() {
        Tray.delegate=self
        Tray.dataSource=self
        ticker = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:{
            ticker in
                self.Tray.reloadData()
        })
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBOutlet weak var Tray: UICollectionView!
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1//essentially the amount of collections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Oven.count//amount of cells
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Tray.dequeueReusableCell(withReuseIdentifier:"TrayCell",for: indexPath) as! TrayCell
        let pastry=Oven[indexPath.item]
        cell.Tray_image.image=pastry.Item_pic
        let timeLeft=timers[indexPath.item]
        cell.timer.text="\(Int((timeLeft/3600).rounded(.down))):\(Int((timeLeft.truncatingRemainder(dividingBy: 3600))/60)):\(Int(timeLeft.truncatingRemainder(dividingBy: 60)))"
    
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: 85, height: 85)
        return cell
    }/*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)->CGSize{
        return CGSize(width:CGFloat(10000), height:CGFloat(10000))
    }*/
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pastryindex = ovenIdx[indexPath.row]//tells which pastry is being selected,
        //refers to pastries[] rather than oven[]^
        self.performSegue(withIdentifier: "details", sender: self)
    }

    @IBAction func Close(_ sender: Any) {
        main?.Pastries.reloadData()
        shopper?.Pastries.reloadData()//
        self.dismiss(animated: true, completion: nil)
    }
    //for the timer, set it up so that the main looks at the oven and the oven looks at the main.
    //need an array of timeIntervals in global scope, parallel to oven[]
    //make it

}
