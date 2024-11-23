import UIKit

final class HomeTableViewDelegateImpl: NSObject {
    var rows: [HomeRow] = []
}

extension HomeTableViewDelegateImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch rows[indexPath.row] {
        case .product:
            UITableView.automaticDimension
        case .promotion:
            240
        }
    }
}
