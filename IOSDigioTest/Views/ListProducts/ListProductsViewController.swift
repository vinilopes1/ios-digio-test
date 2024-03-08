import UIKit
import ProgressHUD

class ListProductsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [AllProducts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllProducts { [weak self] (result) in
            switch result {
            case .success(let products):
                ProgressHUD.dismiss()
                self?.products = products
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }

}
