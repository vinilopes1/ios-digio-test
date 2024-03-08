import Foundation

struct AllProducts: Decodable {
    let spotlight: [Spotlight]?
    let products: [Products]?
    let cash: Cash?
}

