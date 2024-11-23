import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    private lazy var activityIndicatorView = makeActivityIndicatorView()
    private lazy var tableViewDataSourceImpl = HomeTableViewDataSourceImpl()
    private lazy var tableViewDelegateImpl = HomeTableViewDelegateImpl()
    private lazy var tableView = HomeTableViewFactory().make(
        with: tableViewDataSourceImpl,
        and: tableViewDelegateImpl
    )
    
    private var rows = [HomeRow]() {
        didSet {
            tableViewDataSourceImpl.rows = rows
            tableViewDelegateImpl.rows = rows
            tableView.reloadData()
        }
    }
    
    private var products = [Product]() {
        didSet {
            guard !products.isEmpty else {
                return
            }
            
            configureRows()
        }
    }
    
    private var promotions: [URL?] = [
        URL(string: "https://a.lmcdn.ru/bs2/4/80/w_796x630_tiz.jpg"),
        URL(string: "https://a.lmcdn.ru/bs2/2/81/w_796x630_tiz_ba.jpg")
    ]
    
    private let productsProvider = ProductsProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        getProducts()
    }
    
    private func getProducts() {
        activityIndicatorView.startAnimating()
        Task { [weak self, provider = productsProvider] in
            defer {
                self?.activityIndicatorView.stopAnimating()
            }
            
            do {
                self?.products = try await provider.get()
            } catch {
                self?.showErrorAlert(error: error)
            }
        }
    }
    
    private func configureRows() {
        var promotionsCount = 0
        
        rows = []
        products.enumerated().forEach { (index, product) in
            if index != 0 && index % 3 == 0 && promotionsCount < 2 {
                rows.append(.promotion(illustration: promotions[promotionsCount]))
                rows.append(.product(product))
                
                promotionsCount += 1
            } else {
                rows.append(.product(product))
            }
        }
    }
    
    private func setup() {
        [tableView, activityIndicatorView].forEach { view.addSubview($0) }
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        return indicator
    }
    
    private func showErrorAlert(error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: "Failed to load products: \(error.localizedDescription)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
