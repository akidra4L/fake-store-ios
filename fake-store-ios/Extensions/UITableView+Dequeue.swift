import UIKit

extension UITableView {
    func dequeueReusableCell<Cell: UITableViewCell>(
        _ type: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: "\(type)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implmeneted")
        }
        
        return cell
    }
}
