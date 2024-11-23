import UIKit
import SnapKit
import Kingfisher

final class HomePromotionCell: UITableViewCell {
    private lazy var illustrationImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(with illustration: URL?) {
        illustrationImageView.kf.setImage(with: illustration)
    }
    
    private func setup() {
        backgroundColor = .clear
        contentView.addSubview(illustrationImageView)
        selectionStyle = .none
        
        illustrationImageView.snp.makeConstraints { make in
            make.directionalVerticalEdges.equalToSuperview().inset(20)
            make.directionalHorizontalEdges.equalToSuperview()
        }
    }
}
