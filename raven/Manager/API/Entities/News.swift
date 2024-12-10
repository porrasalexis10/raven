//
//  ProjectsResponse.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//

import Foundation
public class NewsResponse: Codable, EntityDescription {
    var statusMessage: String
    var copyright: String
    var num_results: Int
    var results: [NewsEntity]?
    /// CodingKey personalizado
    private enum CustomCodingKeys: String, CodingKey {
        case statusMessage = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
        self.statusMessage = try container.decode(String.self, forKey: .statusMessage)
        self.copyright = try container.decode(String.self, forKey: .copyright)
        self.num_results = try container.decode(Int.self, forKey: .num_results)
        self.results = try container.decodeIfPresent([NewsEntity].self, forKey: .results)
    }
}
public class NewsEntity: Codable, EntityDescription {
    var title: String
    var date: String
    var autor: String
    var summary: String
    var url: String
    /// CodingKey personalizado
    private enum CustomCodingKeys: String, CodingKey {
        case title = "title"
        case date = "published_date"
        case autor = "byline"
        case summary = "abstract"
        case url = "url"
    }
    /// Decode de entidad
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.date = try container.decode(String.self, forKey: .date)
        self.autor = try container.decode(String.self, forKey: .autor)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
