//
//  UserDefaults.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 10/12/24.
//
import Foundation
/// Declaración de users defaults
struct MyUserDefaults {
    /// Usuario logeado
    static let LOGGED = "LOGGED"
    /// Primer login
    static let TOKEN = "TOKEN"
    /// Nombre
    static let NAME = "NAME"
    /// Puesto
    static let POSITION = "POSITION"
    /// Usuario logeado
    static var isLogged: Bool {
        get {
            return UserDefaults.standard.bool(forKey: LOGGED)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: LOGGED)
        }
    }
    /// Token de sesión
    static var token: String {
        get {
            return UserDefaults.standard.string(forKey: TOKEN) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: TOKEN)
        }
    }
    /// Nombre
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: NAME) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: NAME)
        }
    }
    /// Puesto
    static var position: String {
        get {
            return UserDefaults.standard.string(forKey: POSITION) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: POSITION)
        }
    }
}
