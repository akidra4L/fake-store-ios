import Alamofire

final class ProductsProvider {
    private let networkClient = NetworkClient()
    
    func get() async throws -> [Product] {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            self?.networkClient.get(endpoint: "/products") { (response: AFDataResponse<[Product]>) in
                switch response.result {
                case let .success(products):
                    continuation.resume(returning: products)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
