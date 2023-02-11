//
//  Extensions.swift
//  CarGo
//
//  Created by user on 8/27/22.
//

import Foundation
import UIKit

extension UIView {
        
        func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
        
        // Apply round corner and border. An extension method of UIView.
        func roundCornerWithBorder(_ corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            
            let borderLayer = CAShapeLayer()
            borderLayer.frame = self.bounds
            borderLayer.path = path
            borderLayer.lineWidth = borderWidth
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.strokeColor = borderColor.cgColor
                    
            self.layer.addSublayer(borderLayer)
        }
    }


extension UIButton {
    func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
            self.transform = CGAffineTransform(translationX: xValue, y: yValue)
            UIButton.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)

        }
}
