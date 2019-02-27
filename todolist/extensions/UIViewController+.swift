//
//  UIViewController+.swift
//  todolist
//
//  Created by omaestra on 27/02/2019.
//  Copyright © 2019 maestracode. All rights reserved.
//

import UIKit

extension UIViewController {
    func addHideKeyboardGestureRecognizer() {
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    //Calls this function when the tap is recognized.
    @objc fileprivate func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
