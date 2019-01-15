//
//  UIViewController+Extension.swift
//  RealmTutorial
//
//  Created by Simina Popescu on 15/01/2019.
//  Copyright © 2019 SiminaTutorials. All rights reserved.
//

import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func removeKeyboard() {
        view.endEditing(true)
    }
}
