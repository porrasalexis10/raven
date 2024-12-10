//
//  BaseResponse.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import Foundation
public class BaseResponse: Codable, EntityDescription {
    var statusCode: Int
    var statusMessage: String
    /// Función que decodifica la base
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
        self.statusMessage = try container.decode(String.self, forKey: .statusMessage)
    }
}
public class BaseBody: Codable {}
