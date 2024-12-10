//
//  LoginExtension.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import Foundation
extension APIManager {
    func processLogin(response: Data, serviceName: String) {
        /// Simulación de api_key entregada en login
        let API_KEY = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
        let name = "Alexis"
        let position = "Desarrollador iOS"
        MyUserDefaults.token = API_KEY
        MyUserDefaults.name = name
        MyUserDefaults.position = position
        let response = LoginResponse(name: MyUserDefaults.name, position: MyUserDefaults.position, token: MyUserDefaults.token)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.delegate?.responseSucess(response: response, serviceName: serviceName)
        }
    }
}
