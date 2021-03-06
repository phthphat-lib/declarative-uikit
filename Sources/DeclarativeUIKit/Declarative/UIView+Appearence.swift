//
//  UIView+Appearence.swift
//  
//
//  Created by Lucas Pham on 3/20/20.
//

import Foundation
import UIKit

public protocol AppearenceDeclarative: DeclarativeStyle {}
@available(iOS 11.0, *)
extension AppearenceDeclarative where Self: UIView {
    
    @discardableResult
    public func with(size: CGSize) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    public func with(height: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func with(width: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func withBorder(width: CGFloat, color: UIColor) -> Self {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    public func with(backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    @discardableResult
    public func with(cornerRadius: CGFloat) -> Self {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func with(frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
    @discardableResult
    ///Only have effect when the view has frame or bound
    public func withRoundCorners(rectCorner: UIRectCorner, radius: CGFloat) -> Self {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        return self
    }
    
    @discardableResult
    ///Only have effect when the view has frame or bound
    public func withShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, cornerRadius: CGFloat? = nil, scale: Bool = true) -> Self {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        if let cornerRad = cornerRadius {
            layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRad).cgPath
        } else {
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        }
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        return self
    }
//    @discardableResult
//    public func withBorder(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear, cornerRadius: CGFloat) -> Self {
//        self.layer.masksToBounds        = true
//        self.layer.borderWidth          = borderWidth
//        self.layer.borderColor          = borderColor.cgColor
//        self.layer.cornerRadius         = cornerRadius
//        return self
//    }
}

extension AppearenceDeclarative where Self: UITextField {
    
    @discardableResult
    public func with(placeholder: String) -> Self {
        self.placeholder = placeholder; return self
    }
    
    @discardableResult
    public func with(text: String) -> Self {
        self.text = text; return self
    }
    
    @discardableResult
    public func with(font: UIFont) -> Self {
        self.font = font; return self
    }
}

extension AppearenceDeclarative where Self: UILabel {
    @discardableResult
    public func with(text: String) -> Self {
        self.text = text; return self
    }
    
    @discardableResult
    public func with(font: UIFont) -> Self {
        self.font = font; return self
    }
}
