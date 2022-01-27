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
    private var networkStatus: NWPath.Status = .unsatisfied
    
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
        guard let url = URL(string: AppInfoHelper.baseURL + provider.path) else {
            completion(.failure(.badRequest))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = provider.method.rawValue
        request.allHTTPHeaderFields = provider.headers
        request.httpBody = provider.data
        completion(.success(request))
    }
    
    private func executeRequest(_ request: URLRequest, _ completion: @escaping (Result<Data, RestError>) -> Void) {
        session.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                completion(.failure(.unknow(error)))
                return
            }
            guard let response = urlResponse as? HTTPURLResponse, let data = data else {
                completion(.failure(.noData))
                return
            }
            if response.statusCode >= 500 {
                completion(.failure(.serviceUnavaliable))
                return
            }
            guard response.statusCode == 200 else {
                if let responseMessage = self.responseMessageFromData(data) {
                    completion(.failure(.serviceError(responseMessage)))
                } else {
                    completion(.failure(.noData))
                }
                return
            }
            completion(.success(data))
        }
    }
    
    private func responseMessageFromData(_ data: Data) -> String? {
        guard let json = try? JSONDecoder().decode([String: String].self, from: data) else {
            return nil
        }
        return json["message"]
    }
    
    private func startNetMonitoring() {
        netMonitor = NWPathMonitor()
        netMonitor?.pathUpdateHandler = { path in
            self.networkStatus = path.status
        }
        netMonitor?.start(queue: .init(label: "NetWork Monitoring"))
    }
    
    private func stopNetMonitoring() {
        netMonitor?.cancel()
        netMonitor = nil
    }
    
    deinit {
        stopNetMonitoring()
    }
}
