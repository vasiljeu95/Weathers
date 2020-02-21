//
//  Animation.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/21/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

extension UIViewController {
    func transform(for view: UIView, nameAnimation: String, duration: CFTimeInterval, fromValue: Float, toValue: Float, autoreverses: Bool, repeatCount: Float) {
        
        let animation = CASpringAnimation(keyPath: nameAnimation)
        
        animation.duration = duration
        animation.fromValue = duration
        animation.toValue = fromValue
        animation.autoreverses = autoreverses
        animation.repeatCount = repeatCount
        view.layer.add(animation, forKey: nil)
    }
}
