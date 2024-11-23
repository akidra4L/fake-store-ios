import UIKit
import SnapKit
import Kingfisher

final class HomeProductCell: UITableViewCell {
    private lazy var illustrationImageView = UIImageView()
    private lazy var infoStackView = makeInfoStackView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var descriptionLabel = makeDescriptionLabel()
    private lazy var priceLabel = makePriceLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(with product: Product) {
        if let illustrationURL = URL(string: product.image) {
            illustrationImageView.kf.setImage(with: illustrationURL)
        }
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
    }
    
    private func setup() {
        [illustrationImageView, infoStackView].forEach { contentView.addSubview($0) }
        backgroundColor = .clear
        selectionStyle = .none
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        illustrationImageView.snp.makeConstraints { make in
            make.centerY.equalTo(infoStackView)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(
                CGSize(width: 100, height: 100)
            )
        }
        infoStackView.snp.makeConstraints { make in
            make.directionalVerticalEdges.equalToSuperview().inset(20)
            make.leading.equalTo(illustrationImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func makeInfoStackView() -> UIStackView {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabel, descriptionLabel, priceLabel]
        )
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.setCustomSpacing(12, after: descriptionLabel)
        return stackView
    }
    
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }
    
    private func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textColor = .lightGray
        return label
    }
    
    private func makePriceLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }
}
