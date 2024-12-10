//
//  URLs.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
struct AppConfig {
    /// Variable de ambiente
    static var environment: AppEnvironment {
        #if DEBUG
            return .develop
        #elseif Release
          return .release
        #else
         return .develop
        #endif
    }
}
public enum AppEnvironment: String {
    /// URL Base del proyecto develop
    case develop = "https://api.nytimes.com/"
    /// URL Base del proyecto release, no funciona, para terminos de entendimiento
    case release = "https://release/api.nytimes.com/"
}
/// URLs principales
public enum URLs: String {
    /// Noticias vistas
    case news = "svc/mostpopular/v2/viewed/1.json?api-key=%@"
}
