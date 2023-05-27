//
//  StartupVC.swift
//  Muffin
//
//  Created by Daniel Singh on 10/24/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import UIKit
var accounttype = "Default"
class StartupVC: UIViewController {

    @IBAction func ToStoreMain(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Log_Out(segue:UIStoryboardSegue){}
    

    @IBAction func Owner(_ sender: Any) {
        accounttype="Store Owner"
    }
    @IBAction func Customer(_ sender: Any) {
        accounttype="Shopper"
    }
    
    let clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {
       clock in
        if (Oven.count>0){
            for x in 1...(Oven.count){
                if (!timers.isEmpty){
                    timers[x-1] -= 1
                    if (timers[x-1]<=0){
                        print("removing \(Oven[x-1])")
                        Oven.remove(at: x-1)
                        timers.remove(at: x-1)
                        pastries[ovenIdx[x-1]].Fresh=true
                        //pastries[ovenIdx[x-1].stock+=pastries[ovenIdx[x-1].batchsize
                        //or
                        //pastries[ovenIdx[x-1].stock+=batchSize[x-1]
                        //remove the item from the oven, timer and index
                    }
                }
            }
        }
    })
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
