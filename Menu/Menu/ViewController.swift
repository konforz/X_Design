//
//  ViewController.swift
//  Menu
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedMenue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuViewControler =  storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        
        menuViewControler.transitioningDelegate = self
        present(menuViewControler, animated: true, completion: nil)
    }
}
extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransition()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransition()
    }
}
