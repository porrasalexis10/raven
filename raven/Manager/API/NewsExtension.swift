//
//  NewsExtension.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import Foundation
extension APIManager {
    func processNews(response: Data, serviceName: String) {
        if let responseObject = decodeClass(responseType: NewsResponse.self, data: response) {
            if responseObject.statusMessage == "OK" {
                if let result = responseObject.results {
                    self.delegate?.responseSucess(response: result, serviceName: serviceName)
                } else {
                    self.delegate?.responseError(message: responseObject.statusMessage)
                }
            } else {
                self.delegate?.responseError(message: responseObject.statusMessage)
            }
        } else {
            self.delegate?.responseError(message: "APIManager.defaultError".localized)
        }
    }
}
