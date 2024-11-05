//
//  ViewController.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 05.11.2024.
//

import UIKit

final class ViewController: UIViewController {
  
  // MARK: - Private propertes
  
  private let trafficLightHousingView = UIView()
  private let verticalSupportView = UIView()
  private let horizontalSupportView = UIView()
  private let redCircleView = UIView()
  private let yellowCircleView = UIView()
  private let greenCircleView = UIView()
  private let trafficLightStartButton = UIButton()
  
  // MARK: - Internal function
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingLayout()
    settingStyle()
    
  }
}
// MARK: - Private functions

private extension ViewController {
  func settingLayout() {
    [trafficLightHousingView, verticalSupportView, horizontalSupportView,
     trafficLightStartButton].forEach {$0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
    }
    [redCircleView, yellowCircleView, greenCircleView].forEach
    {$0.translatesAutoresizingMaskIntoConstraints = false
      trafficLightHousingView.addSubview($0)
    }
    
    NSLayoutConstraint.activate(
      [
        trafficLightHousingView.topAnchor.constraint(
          equalTo: view.topAnchor,
          constant: 200
        ),
        trafficLightHousingView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        verticalSupportView.topAnchor.constraint(
          equalTo: trafficLightHousingView.bottomAnchor
        ),
        verticalSupportView.widthAnchor.constraint(
          equalToConstant: 20
        ),
        verticalSupportView.heightAnchor.constraint(
          equalToConstant: 60
        ),
        
        horizontalSupportView.topAnchor.constraint(
          equalTo: verticalSupportView.bottomAnchor
        ),
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: 100
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: 20
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        redCircleView.topAnchor.constraint(
          equalTo: trafficLightHousingView.topAnchor,
          constant: 16
        ),
        redCircleView.widthAnchor.constraint(
          equalToConstant: 40
        ),
        redCircleView.heightAnchor.constraint(
          equalToConstant: 40
        ),
        redCircleView.leadingAnchor.constraint(
          equalTo: trafficLightHousingView.leadingAnchor,
          constant: 16
        ),
        redCircleView.trailingAnchor.constraint(
          equalTo: trafficLightHousingView.trailingAnchor,
          constant: -16
        ),
        
        yellowCircleView.topAnchor.constraint(
          equalTo: redCircleView.bottomAnchor,
          constant: 16
        ),
        yellowCircleView.widthAnchor.constraint(
          equalToConstant: 40
        ),
        yellowCircleView.heightAnchor.constraint(
          equalToConstant: 40
        ),
        yellowCircleView.leadingAnchor.constraint(
          equalTo: trafficLightHousingView.leadingAnchor,
          constant: 16
        ),
        yellowCircleView.trailingAnchor.constraint(
          equalTo: trafficLightHousingView.trailingAnchor,
          constant: -16
        ),
        
        greenCircleView.topAnchor.constraint(
          equalTo: yellowCircleView.bottomAnchor,
          constant: 16
        ),
        greenCircleView.widthAnchor.constraint(
          equalToConstant: 40
        ),
        greenCircleView.heightAnchor.constraint(
          equalToConstant: 40
        ),
        greenCircleView.leadingAnchor.constraint(
          equalTo: trafficLightHousingView.leadingAnchor,
          constant: 16
        ),
        greenCircleView.trailingAnchor.constraint(
          equalTo: trafficLightHousingView.trailingAnchor,
          constant: -16
        ),
        greenCircleView.bottomAnchor.constraint(
          equalTo: trafficLightHousingView.bottomAnchor,
          constant: -16
        ),
        
        trafficLightStartButton.bottomAnchor.constraint(
          equalTo: view.bottomAnchor,
          constant: -30
        ),
        trafficLightStartButton.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        )
      ]
    )
  }
  
  func settingStyle() {
    
    view.backgroundColor = .darkGray
    
    trafficLightHousingView.backgroundColor = .black
    
    verticalSupportView.backgroundColor = .black
    
    horizontalSupportView.backgroundColor = .black
    
    redCircleView.backgroundColor = .red.withAlphaComponent(0.5)
    redCircleView.layer.cornerRadius = 40 / 2
    
    yellowCircleView.backgroundColor = .yellow.withAlphaComponent(0.5)
    yellowCircleView.layer.cornerRadius = 40 / 2
    
    greenCircleView.backgroundColor = .green.withAlphaComponent(0.5)
    greenCircleView.layer.cornerRadius = 40 / 2
    
    trafficLightStartButton.backgroundColor = .blue
    trafficLightStartButton.setTitle("START", for: .normal)
    trafficLightStartButton.setTitleColor(.black, for: .normal)
    trafficLightStartButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
  @objc
  func buttonAction() [
}



