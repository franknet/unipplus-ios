//
//  RestHelper.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 24/01/22.
//

import Foundation
import Network

class RestHelper {
    
    private let session: URLSession
    private var netMonitor: NWPathMonitor?
    private var networkStatus: NWPath.Status = .satisfied
    
    required init(_ session: URLSession = URLSession(configuration: .default)) {
        self.session = session
        self.startNetMonitoring()
    }
    
    func fetch(provider: APIProvider, _ completion: @escaping (Result<Data, RestError>) -> Void) {
        guard networkStatus == .satisfied else {
            completion(.failure(.noInternet))
            return
        }
        createRequestFromProvider(provider) { result in
            switch result {
            case .success(let request):
                self.executeRequest(request, completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func createRequestFromProvider(_ provider: APIProvider, _ completion: (Result<URLRequest, RestError>) -> Void ) {
        if let url = URL(string: AppInfoHelper.baseURL + provider.path) {
            var request = URLRequest(url: url)
            request.httpMethod = provider.method.rawValue
            request.allHTTPHeaderFields = provider.headers
            request.httpBody = provider.data
            completion(.success(request))
        } else {
            completion(.failure(.badRequest))
        }
    }
    
    private func executeRequest(_ request: URLRequest, _ completion: @escaping (Result<Data, RestError>) -> Void) {
        session.dataTask(with: request) { data, urlResponse, error in
            request.log()
            if let error = error {
                completion(.failure(.unknow(error)))
                return
            }
            guard let response = urlResponse as? HTTPURLResponse, let data = data else {
                completion(.failure(.noData))
                return
            }
            response.log()
            if response.statusCode >= 500 {
                completion(.failure(.serviceUnavaliable))
                return
            }
            if response.statusCode != 200 {
                let serviceError = self.serviceMessageFromData(data)
                completion(.failure(serviceError))
            } else {
                completion(.success(data))
            }
        }.resume()
    }
    
    private func serviceMessageFromData(_ data: Data) -> RestError {
        if let json = try? JSONDecoder().decode([String: String].self, from: data), let message = json["message"] {
            return .serviceError(message)
        } else {
            return .decodeError
        }
    }
    
    private func startNetMonitoring() {
        netMonitor = NWPathMonitor()
        netMonitor?.pathUpdateHandler = { path in
            self.networkStatus = path.status
        }
        netMonitor?.start(queue: .init(label: "Network Monitoring"))
    }
    
    private func stopNetMonitoring() {
        netMonitor?.cancel()
        netMonitor = nil
    }
    
    deinit {
        stopNetMonitoring()
    }
}

extension HTTPURLResponse {
    func log() {
        
        print("=== RESPONSE ===")
        
        print("Status: \(self.statusCode) \(self.url?.absoluteString ?? "")")
        
        print("HEADERS:")
        print(self.allHeaderFields)
    }
}

extension URLRequest {
    func log() {
        
        print("=== REQUEST ===")
        
        print("URL:\(self.url?.absoluteString ?? "")")
        
        print("HEADERS:")
        print(self.allHTTPHeaderFields ?? [:])
    }
}
