//
//  ColorExtension.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//

import Foundation
import UIKit
enum AssetColors {
    case principalText
    case secondaryText
    case principalBackground
    case principalColor
}
extension UIColor {
    static func getAssetColor(name: AssetColors) -> UIColor? {
        switch name {
        case .principalText:
            return UIColor(named: "principalText")
        case .secondaryText:
            return UIColor(named: "secondaryText")
        case .principalBackground:
            return UIColor(named: "principalBackground")
        case .principalColor:
            return UIColor(named: "principalColor")
        }
    }
}
