//
//  HomeViewController.swift
//  Kuchikomi Beauty
//
//  Created by 長谷川良 on 2018/08/25.
//  Copyright © 2018年 長谷川良. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController{
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let StylistVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Stylist")
        let ItemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Item")
        let TimelineVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Timeline")
        let PickupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Pickup")
        let childViewControllers:[UIViewController] = [StylistVC,ItemVC,PickupVC,TimelineVC]
        return childViewControllers
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
