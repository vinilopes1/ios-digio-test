import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
        
    var spotlight: [Spotlight] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllProducts { [weak self] (result) in
            switch result {
            case .success(let allProducts):
                ProgressHUD.dismiss()
               
                self?.spotlight = allProducts.spotlight ?? []
                
                self?.popularCollectionView.reloadData()

            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        popularCollectionView.register(UINib(nibName: ProductPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductPortraitCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsPortraitCollectionViewCell.identifier, for: indexPath) as! ProductPortraitCollectionViewCell
            cell.setup(spotlight: spotlight[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
}
