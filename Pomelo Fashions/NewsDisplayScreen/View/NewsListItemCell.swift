//
//  NewsListItemCell.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import UIKit

/// A type template model provider for `NewsListItemCell` .

/// Containts headline, description, publishDate & image informations for a layout.
protocol NewsListCellItemModel {
    var headline: String { get }
    var description: String { get }
    var publishDate: String { get }
    var newsImage: UIImage? { get }
}

/// Custom cell layout design cell for NewsList view
/// Cell containts headline, imageView, description & publish date
class NewsListItemCell: UITableViewCell {
    let newsImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let headLineLabel: UILabel = {
        let label = UILabel()
        if #available(iOS 13.0, *) {
            label.textColor = UIColor.label
        } else {
            label.textColor = UIColor.black
        }
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        if #available(iOS 13.0, *) {
            label.textColor = UIColor.secondaryLabel
        } else {
            label.textColor = UIColor.black.withAlphaComponent(0.7)
        }
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let postDate: UILabel = {
        let label = UILabel()
        if #available(iOS 13.0, *) {
            label.textColor = UIColor.label
        } else {
            label.textColor = UIColor.black
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var sepratorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var mainContainer: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 4.0
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var rightContainer: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 8.0
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var item: NewsListCellItemModel? {
        didSet {
            updateViewData()
        }
    }

    override init(style _: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }

    /// This methods call on change of  instance`item ` value.
    /// Here we update cell lables and image.
    private func updateViewData() {
        applyStyle()
        headLineLabel.text = item?.headline
        descriptionLabel.text = item?.description
        newsImageView.image = item?.newsImage
        postDate.text = item?.publishDate
    }
}

// MARK: - setup and view initialise section.

private extension NewsListItemCell {
    func commonInit() {
        selectionStyle = .none
        setupContainers()
        setupSepratorView()
    }

    /// Setup cell containers
    func setupContainers() {
        rightContainer.addArrangedSubview(newsImageView)
        rightContainer.addArrangedSubview(descriptionLabel)

        mainContainer.addArrangedSubview(headLineLabel)
        mainContainer.addArrangedSubview(rightContainer)
        mainContainer.addArrangedSubview(postDate)

        contentView.addSubview(mainContainer)

        let spacing: CGFloat = 16.0
        NSLayoutConstraint.activate([
            mainContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            mainContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            mainContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing / 2.0),
        ])

        NSLayoutConstraint.activate([
            newsImageView.widthAnchor.constraint(equalTo: mainContainer.widthAnchor, multiplier: 0.35),
            newsImageView.heightAnchor.constraint(equalToConstant: 150.0),
        ])
    }

    /// Setup seprator view.
    func setupSepratorView() {
        contentView.addSubview(sepratorView)
        NSLayoutConstraint.activate([
            sepratorView.topAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: 8.0),
            sepratorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sepratorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sepratorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            sepratorView.heightAnchor.constraint(equalToConstant: 1.0),
        ])
    }

    /// Apply font style
    func applyStyle() {
        headLineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        postDate.font = UIFont.preferredFont(forTextStyle: .caption1)
    }
}

extension NewsListItemCell: ViewReusableIdentifier {}
