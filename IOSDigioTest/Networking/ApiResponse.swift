import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let data: T?
    let error: String?
}
