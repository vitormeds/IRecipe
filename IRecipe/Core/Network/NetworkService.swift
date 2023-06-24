//
//  NetworkService.swift
//  IRecipe
//
//  Created by Vitor Mendes on 24/06/23.
//

import Foundation
import Alamofire

class NetworkService {
    
    static private var alamoFireManager: Session? = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .useProtocolCachePolicy
        let alamoFireManager = Alamofire.Session(configuration: configuration)
        return alamoFireManager
    }()
    
    static func request<T: Codable>(url: String,method: HTTPMethod , params: [String:Any]? = nil, obj: T.Type, sucess: @escaping (T)-> Void, error: @escaping (Error)-> Void) {
        alamoFireManager?.request(url, method: method, parameters: getParameters(), encoding: URLEncoding.default, headers: getHeaders()).response { response in
            switch response.result {
            case .success:
                do {
                    let resultObj = try JSONDecoder().decode(obj.self, from: response.data ?? Data())
                    sucess(resultObj)
                } catch let decodeErr {
                    error(decodeErr)
                }
                return
            case .failure:
                error(response.error!)
                return
            }
        }
    }

    static func getParameters() -> [String:Any]? {
        return [
                "type" : "public",
                "q" : "chicken",
                "app_id" : "935a7765",
                "app_key" : "715c72ad38c481e2d1c1878848c89623"
        ]
    }
    
    static func getHeaders() -> HTTPHeaders {
        return HTTPHeaders([
                "Accept" : "application/json",
                "Accept-Language" : "en"
        ])
    }
}
