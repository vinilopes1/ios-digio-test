import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let products: Products?
}
