import UIKit

final class HomeTableViewFactory {
    func make(
        with dataSource: UITableViewDataSource,
        and delegate: UITableViewDelegate
    ) -> UITableView {
        let tableView = UITableView()
        tableView.alwaysBounceVertical = true
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        [
            HomeProductCell.self,
            HomePromotionCell.self
        ].forEach { tableView.register(cellClass: $0) }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
}
