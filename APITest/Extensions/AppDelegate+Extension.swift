//
//  AppDelegate+Extension.swift
//  APITest
//
//  Created by Anil on 25/02/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let HomeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navController = UINavigationController(rootViewController: HomeVC)
        window.rootViewController = navController
        
        window.makeKeyAndVisible()
    }
}
