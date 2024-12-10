//
//  ViewExtension.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
extension UIView {
    /// Función para redondear vistas
    /// type: Tipo de redondeo total o solo en algun lugar
    /// color: Color del borde
    /// points: Puuntos de redondeo
    func customRounded(type: CustomRounded, color: UIColor? = nil, points: CGFloat? = nil){
        switch type {
        case .full:
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .top:
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .right:
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .left:
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
        if let point = points {
            self.layer.cornerRadius = point
        } else {
            self.layer.cornerRadius = 8
        }
        if let customColor = color {
            self.layer.borderWidth = 1
            self.layer.borderColor = customColor.cgColor
        }
        self.clipsToBounds = true
    }
    /// Función para hacer circular una UIView
    func circularView(){
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    enum CustomRounded {
        case full
        case top
        case bottom
        case right
        case left
    }
}
