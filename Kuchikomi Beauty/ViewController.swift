//
//  ViewController.swift
//  Kuchikomi Beauty
//
//  Created by 長谷川良 on 2018/08/25.
//  Copyright © 2018年 長谷川良. All rights reserved.
//

import UIKit
import ESTabBarController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTab()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupTab(){
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["home","likes","postbutton","bag","acount"])
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        addChildViewController(tabBarController)
        let  tabBarView = tabBarController.view!
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tabBarView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            ])
        tabBarController.didMove(toParentViewController: self)
        // タブをタップした時に表示するViewControllerを設定する
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let likesViewController = storyboard?.instantiateViewController(withIdentifier: "Likes")
        let bagViewController = storyboard?.instantiateViewController(withIdentifier: "Bag")
        let acountViewController = storyboard?.instantiateViewController(withIdentifier: "Acount")
        
        tabBarController.setView(homeViewController, at: 0)
        tabBarController.setView(likesViewController, at: 1)
        tabBarController.setView(bagViewController, at: 3)
        tabBarController.setView(acountViewController, at: 4)
        
        // 真ん中のタブはボタンとして扱う
        tabBarController.highlightButton(at: 2)
        tabBarController.setAction({
            // ボタンが押されたらpostViewControllerをモーダルで表示する
            let postViewController = self.storyboard?.instantiateViewController(withIdentifier: "Post")
            self.present(postViewController!, animated: true, completion: nil)
        }, at: 2)
    }

}

