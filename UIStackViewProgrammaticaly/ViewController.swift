//
//  ViewController.swift
//  UIStackViewProgrammaticaly
//
//  Created by Felipe Vieira Lima on 01/12/22.
//

import UIKit

class ViewController: UIViewController {
    var stackView = UIStackView()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How would you rate this tutorial?"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        configureTitleLabel()
        configureStackView()
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        addButtonsToStackView()
        setStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 5
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle("\(i)", for: .normal)
            button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc
    private func handleClick(sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            let alert = UIAlertController(title: "Sua escolha", message: "\(buttonTitle)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
          stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
          stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
          stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }

    func configureTitleLabel() {
        view.addSubview(titleLabel)
      
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}

