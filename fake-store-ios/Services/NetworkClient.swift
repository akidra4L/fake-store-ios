import Alamofire

fileprivate enum Constants {
    static let baseURL = "https://fakestoreapi.com"
}

final class NetworkClient {
    private let session = Session()
    
    func get<Response: Decodable>(
        endpoint: String,
        completion: @escaping (AFDataResponse<Response>) -> Void
    ) {
        let url = Constants.baseURL + endpoint
        
        session.request(url, method: .get, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: Response.self) { response in
                completion(response)
            }
    }
}
