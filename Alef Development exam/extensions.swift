//
//  extensions.swift
//  Alef Development exam
//
//  Created by MacBook on 09.03.2022.
//

import UIKit

extension UIView {
    func hideKeyBoard () {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    var topSuperview: UIView? {
        var view = superview
        while view?.superview != nil {
            view = view?.superview
        }
        return view
    }
    
    func dismissKeyboard() {
        topSuperview?.endEditing(true)
    }
}
