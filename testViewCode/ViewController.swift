//
//  ViewController.swift
//  testViewCode
//
//  Created by Matheus Henrique Mendes Alexandre on 24/05/23.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Appium iOS"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let testButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test", for: .normal)
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(nil, action: #selector(testButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(testButton)
        view.addSubview(counterLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        testButton.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        testButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: testButton.topAnchor, constant: -16),
            
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 16)
        ])
        
        updateCounterLabel()
    }
    
    @objc private func testButtonTapped() {
        counter += 1
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Counter: \(counter)"
    }
}
