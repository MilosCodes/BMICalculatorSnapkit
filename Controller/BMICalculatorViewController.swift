//
//  BMICalculatorView.swift
//  BMICalculatorSnapkit
//
//  Created by Milos Milivojevic on 25/07/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit
import SnapKit

protocol BMICalculatorViewControllerDelegate {
    func popToNextController()
    
    }
    
class BMICalculatorViewController: UIViewController, BMICalculatorViewControllerDelegate {
        
        var backgroundView: UIImageView!
        
        var weightSlider: UISlider!
        var heightSlider: UISlider!
        
        var heightMarkLabel: UILabel!
        var weightMarklabel: UILabel!
        
        var heightLabel: UILabel!
        var weightLabel: UILabel!
        
        var calculateButton: UIButton!
        
        var calculatorBrain = CalculatorBrain()
        var resultViewController = ResultsViewController()
        
        fileprivate func addTargets() {
            weightSlider.addTarget(self, action: #selector(self.weightSliderChange), for: .valueChanged)
            heightSlider.addTarget(self, action: #selector(self.heightSliderChange), for: .valueChanged)
            calculateButton.addTarget(self, action: #selector(popToNextController), for: .touchUpInside)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            resultViewController.delegate = self
            
            setupSubviews()
            setupUI()
            
            addTargets()
        }
        
        fileprivate func setupSubviews() {
            
            backgroundView = UIImageView()
            backgroundView.image = UIImage.init(named: "calculate_background")
            view.addSubview(backgroundView)
            
            weightLabel = UILabel()
            weightLabel.text = "0.0kg"
            weightLabel.textColor = .darkGray
            view.addSubview(weightLabel)
            
            weightMarklabel = UILabel()
            weightMarklabel.text = "Weight"
            weightMarklabel.textColor = .darkGray
            view.addSubview(weightMarklabel)
            
            weightSlider = UISlider()
            weightSlider.tintColor = UIColor(red: 86/255, green: 85/255, blue: 145/255, alpha: 0.90)
            weightSlider.thumbTintColor = UIColor(red: 151/255, green: 151/255, blue: 217/255, alpha: 0.90)
            weightSlider.value = 0
            weightSlider.minimumValue = 0
            weightSlider.maximumValue = 200
            view.addSubview(weightSlider)
            
            
            heightLabel = UILabel()
            heightLabel.text = "0"
            heightLabel.textColor = .darkGray
            view.addSubview(heightLabel)
            
            heightMarkLabel = UILabel()
            heightMarkLabel.text = "Height"
            heightMarkLabel.textColor = .darkGray
            view.addSubview(heightMarkLabel)
            
            
            heightSlider = UISlider()
            heightSlider.value = 0
            heightSlider.thumbTintColor = UIColor(red: 151/255, green: 151/255, blue: 217/255, alpha: 0.90)
            heightSlider.tintColor = UIColor(red: 86/255, green: 85/255, blue: 145/255, alpha: 0.90)
            heightSlider.minimumValue = 0
            heightSlider.maximumValue = 3
            view.addSubview(heightSlider)
            
            calculateButton = UIButton()
            calculateButton.backgroundColor = UIColor(red: 86/255, green: 85/255, blue: 145/255, alpha: 0.90)
            calculateButton.layer.cornerRadius = 20
            calculateButton.layer.masksToBounds = true
            calculateButton.setTitle("Calculate", for: .normal)
            view.addSubview(calculateButton)
            
            
        }
        
        var offSet = 30
        var offSetTen = 10
        
        fileprivate func setupUI() {
            
            
            backgroundView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            weightLabel.snp.makeConstraints { (make) in
                make.bottom.equalTo(weightSlider.snp.top).offset(-offSetTen)
                make.right.equalTo(weightSlider)
            }
            
            weightMarklabel.snp.makeConstraints { (make) in
                make.centerY.equalTo(weightLabel)
                make.left.equalTo(weightSlider)
            }
            
            
            weightSlider.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.left.right.equalTo(heightSlider)
                make.bottom.equalTo(heightLabel.snp.top).offset(-offSet)
            }
            
            heightLabel.snp.makeConstraints { (make) in
                make.bottom.equalTo(heightSlider.snp.top).offset(-offSetTen)
                make.right.equalTo(heightSlider)
            }
            
            heightMarkLabel.snp.makeConstraints { (make) in
                make.centerY.equalTo(heightLabel)
                make.left.equalTo(heightSlider)
            }
            
            heightSlider.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.left.equalToSuperview().offset(50)
                make.right.equalToSuperview().offset(-50)
                make.bottom.equalTo(calculateButton.snp.top).offset(-offSet)
            }
            calculateButton.snp.makeConstraints { (make) in
                make.width.equalTo(120)
                make.height.equalTo(50)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-50)
            }
        }
        
        @objc func heightSliderChange(_ heightSlider: UISlider) {
            let stringValue = String(format: "%.2f", heightSlider.value)
            heightLabel.text = "\(stringValue)"
        }
        
        @objc func weightSliderChange(_ weightSlider: UISlider) {
            let stringValue = String(format: "%.1f", weightSlider.value)
            weightLabel.text = "\(stringValue)kg"
        }
    
    @objc func popToNextController() {
        
        navigationController?.pushViewController(resultViewController,
         animated: true)
            
        resultViewController.adviceLabel.text = calculatorBrain.toOneDecimalNumber()
        resultViewController.bmiLabel.text = calculatorBrain.getAdvice()
        resultViewController.informationView?.backgroundColor = calculatorBrain.getColor()

    }
}
