import UIKit

final class HomeTableViewDataSourceImpl: NSObject {
    var rows: [HomeRow] = []
}

extension HomeTableViewDataSourceImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case let .product(product):
            let cell = tableView.dequeueReusableCell(HomeProductCell.self, for: indexPath)
            cell.configure(with: product)
            return cell
        case let .promotion(illustration):
            let cell = tableView.dequeueReusableCell(HomePromotionCell.self, for: indexPath)
            cell.configure(with: illustration)
            return cell
        }
    }
}
