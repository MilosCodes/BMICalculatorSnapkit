//
//  ResultsViewController.swift
//  BMICalculatorSnapkit
//
//  Created by Milos Milivojevic on 25/07/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    var delegate: BMICalculatorViewControllerDelegate?
    
    var informationView: UIView!
    var backgroundImage: UIImageView!
    var bmiLabel: UILabel!
    var adviceLabel: UILabel!
    var calculationLabel: UILabel!
    var recalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setupUI()
    }

    fileprivate func addSubviews() {

        informationView = UIView()
        view.addSubview(informationView)
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage.init(named: "result_background")
        backgroundImage.layer.zPosition = -9999
        view.addSubview(backgroundImage)
        
        bmiLabel = UILabel()
        bmiLabel.font = UIFont.boldSystemFont(ofSize: 40)
        bmiLabel.textAlignment = .left
        bmiLabel.textColor = .white
        informationView.addSubview(bmiLabel)
        
        adviceLabel = UILabel()
        adviceLabel.textAlignment = .left
        adviceLabel.textColor = .white
        informationView.addSubview(adviceLabel)
        
        calculationLabel = UILabel()
        calculationLabel.textAlignment = .left
        calculationLabel.textColor = .white
        calculationLabel.text = "Your score is?"
        informationView.addSubview(calculationLabel)
        
        recalculateButton = UIButton()
        recalculateButton.setTitleColor(UIColor(red: 86/255, green: 85/255, blue: 145/255, alpha: 0.90), for: .normal)
        recalculateButton.backgroundColor = .white
        recalculateButton.layer.cornerRadius = 20
        recalculateButton.layer.masksToBounds = true
        recalculateButton.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
        recalculateButton.setTitle("Recaculate", for: .normal)
        recalculateButton.layer.zPosition = 100
        informationView.addSubview(recalculateButton)
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        informationView.backgroundColor = color
    }
    
    fileprivate func setupUI() {
//        view.backgroundColor = color
        addSubviews()
        
        informationView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        bmiLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }
        
        adviceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bmiLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        calculationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(adviceLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        recalculateButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-25)
            make.width.equalTo(120)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func recalculateButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
