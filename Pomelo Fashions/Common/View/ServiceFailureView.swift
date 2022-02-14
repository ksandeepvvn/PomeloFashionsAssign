//
//  ServiceFailureView.swift
//  Pomelo Fashions
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 10/02/22.
//

import UIKit

/// Custom view to dispaly  service failure.

/// `ServiceFailureView` provides text message and try again button on view.
class ServiceFailureView: UIView {
    enum AccesibilityId: String {
        case failureLabel
        case tryAgainButton
    }

    let serviceFailureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.accessibilityIdentifier = AccesibilityId.failureLabel.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let tryAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = AccesibilityId.tryAgainButton.rawValue
        button.accessibilityTraits = .button
        return button
    }()

    let containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        serviceFailureLabel.text =  "Please Check Your Internet Connectivity"
        tryAgainButton.setTitle("tryAgain", for: .normal)

        containerView.addArrangedSubview(serviceFailureLabel)
        containerView.addArrangedSubview(tryAgainButton)
        addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func addButtonHanler(target: Any?, selector: Selector) {
        tryAgainButton.addTarget(target, action: selector, for: .touchUpInside)
    }
}

