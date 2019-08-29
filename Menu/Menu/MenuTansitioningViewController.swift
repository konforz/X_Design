//
//  MenuTansitioningViewController.swift
//  Menu
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

final class MenuTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let menuViewController: UIViewController
        let isMenuPresenting: Bool
        if let toViewController = transitionContext.viewController(forKey: .to), toViewController is MenuViewController {
            menuViewController = toViewController
            isMenuPresenting = true
        } else if let fromViewController = transitionContext.viewController(forKey: .from), fromViewController is MenuViewController {
            menuViewController = fromViewController
            isMenuPresenting = false
        } else {
            return
        }
        transitionContext.containerView.addSubview(menuViewController.view)
        if isMenuPresenting {
        menuViewController.view.frame.origin.x = -UIScreen.main.bounds.width
        }
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            if isMenuPresenting {
            menuViewController.view.frame.origin.x = 0
            } else {
                menuViewController.view.frame.origin.x = -UIScreen.main.bounds.width
            }
        }) {didFinish in
            transitionContext.completeTransition(didFinish)
        }
    }
}
