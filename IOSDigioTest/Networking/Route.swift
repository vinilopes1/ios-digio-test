import Foundation

enum Route {
    static let baseUrl = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"

    case AllProducts
    
    var description: String {
        switch self {
        case .AllProducts:
            return "/products"
        }
    }
}
