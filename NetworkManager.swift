//
//  NetworkManager.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case decodeError
    case httpError(statusCode: Int)
    case somethingWentWrong
}

class NetworkManager {
    func request<T: Decodable>(url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        //request.timeoutInterval = TIMEOUT_INTERVAL
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(NetworkError.somethingWentWrong))
                return
            }
            
            let response = response as! HTTPURLResponse
            let statusCode = response.statusCode
            guard (200..<299).contains(statusCode) else {
                completion(.failure(NetworkError.httpError(statusCode: statusCode)))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.responseError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkError.decodeError))
            }
        }
        task.resume()
    }
}
