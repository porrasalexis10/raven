//
//  Login.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
public class LoginEntity: Codable, EntityDescription {
    var statusCode: Int
    var statusMessage: String
    var response: LoginResponse?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
        self.statusMessage = try container.decode(String.self, forKey: .statusMessage)
        self.response = try container.decodeIfPresent(LoginResponse.self, forKey: .response)
    }
}
public class LoginResponse: Codable, EntityDescription {
    var name: String
    var position: String
    var token: String
    /// CodingKey personalizado
    private enum CustomCodingKeys: String, CodingKey {
        case name = "name"
        case position = "position"
        case token = "token"
    }
    /// Decode de entidad
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.position = try container.decode(String.self, forKey: .position)
        self.token = try container.decode(String.self, forKey: .token)
    }
    /// Init de variable
    init(name: String, position: String, token: String) {
        self.name = name
        self.position = position
        self.token = token
    }
}
public class LoginBody: BaseBody {
    var username: String
    var password: String
    /// Inicializador de clase
    init(username: String, password: String) {
        self.username = username
        self.password = password
        super.init()
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    /// CodingKey personalizado
    enum CodingKeys : String, CodingKey {
        case username
        case password
    }
    /// Función de encode
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
}
