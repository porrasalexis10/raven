//
//  FontExtension.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//

import Foundation
import UIKit
enum CustomFonts {
    /// Tipo de letra para títulos
    case title
    /// Tipo de letra para textos
    case text
    /// Tipo de letra para notas
    case note
}
extension UIFont {
    static func setCustomFont(name: CustomFonts) -> UIFont {
        switch name {
        case .title:
            return UIFont(name: BaseFont().bold, size: 30) ?? UIFont.systemFont(ofSize: 19.0)
        case .text:
            return UIFont(name: BaseFont().regular, size: 16) ?? UIFont.systemFont(ofSize: 19.0)
        case .note:
            return UIFont(name: BaseFont().regular, size: 12) ?? UIFont.systemFont(ofSize: 19.0)
        }
    }
}
