//
//  ButtonExtension.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import Foundation
import UIKit
extension UIButton {
    /// Función para darle estilo al botón con relleno y redondeado, aplicando tipografía por default
    /// Parameters:
    /// - color: Valor opcional, si no recibe color se aplica por default color principal
    func fillStyle(color: UIColor? = nil) {
        let button = self
        guard let text = self.titleLabel?.text else { return }
        var customColor = UIColor.getAssetColor(name: .principalColor)
        if let newColor = color {
            customColor = newColor
        }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.setCustomFont(name: .text), range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.clipsToBounds = true
        button.backgroundColor = customColor
        button.tintColor = UIColor.getAssetColor(name: .secondaryText)
    }
    /// Función para darle estilo con linea por debajo del texto, aplicando tipografía por default
    /// Parameters:
    /// - color: Valor opcional, si no recibe color se aplica por default color principal
    func underlineStyle(color: UIColor? = nil) {
        var customColor = UIColor.getAssetColor(name: .principalColor)
        if let newColor = color {
            customColor = newColor
        }
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: customColor, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: customColor, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.setCustomFont(name: .text), range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
