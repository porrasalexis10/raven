//
//  ManagerAF.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import Alamofire
public final class APIManager {
    private init() {}
    static let shared = APIManager()
    var headers: HTTPHeaders = ["Accept": "application/json"]
    var delegate: DelegateAPIManager?
    /// Función para realizar una petición GET
    /// - url: URL a consultar
    /// - parameters: Parametros a enviar
    func getFunction(url: String, serviceName: String, parameters: BaseBody? = nil) {
        var bodyObeject: [String: Any]?
        if let params = parameters {
            let data = try! JSONEncoder().encode(params)
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            bodyObeject = json
        }
        var baseURL = String(format: AppConfig.environment.rawValue + url, MyUserDefaults.token)
        AF.request(baseURL, method: .get, parameters: bodyObeject, encoding: JSONEncoding.default, headers: headers)
            .responseData(completionHandler: { response in
                if let data = response.data {
                    self.handleResponse(response: data, serviceName: serviceName)
                } else {
                    self.delegate?.responseError(message: "APIManager.defaultError".localized)
                }
            })
    }
    /// Función para simulari una petición POST
    /// - url: URL a consultar
    /// - pararemeters: Parametros a enviar
    func postSimulateFunction(serviceName: String) {
        self.handleResponse(response: Data(), serviceName: serviceName)
    }
}
extension APIManager {
    func handleResponse(response: Data, serviceName: String) {
        switch serviceName {
        case LoginResponse.name:
            processLogin(response: response, serviceName: serviceName)
        case NewsResponse.name:
            processNews(response: response, serviceName: serviceName)
            default:
                print("Error")
        }
    }
    func decodeClass <T:Codable>(responseType: T.Type, data: Data) -> T? {
        do {
            return try JSONDecoder().decode(responseType, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return nil
    }
}

public protocol DelegateAPIManager {
    func responseSucess<T>(response: T, serviceName: String)
    func responseError(message: String)
}

extension Encodable {
    /// Converting object to postable dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        if let json = object as? [String: Any]  { return json }
        
        let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
        throw DecodingError.typeMismatch(type(of: object), context)
    }
}
