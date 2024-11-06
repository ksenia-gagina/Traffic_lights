//
//  View.Controller.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 06.11.2024.
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
  private var trafficLightType: TrafficLightType?
  
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
          constant: Constants.trafficLightHousingTop
        ),
        trafficLightHousingView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        verticalSupportView.topAnchor.constraint(
          equalTo: trafficLightHousingView.bottomAnchor
        ),
        verticalSupportView.widthAnchor.constraint(
          equalToConstant: Constants.verticalSupporWidth
        ),
        verticalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.verticalSupporWidth
        ),
        verticalSupportView.centerXAnchor.constraint(
          equalTo: trafficLightHousingView.centerXAnchor
        ),
        
        horizontalSupportView.topAnchor.constraint(
          equalTo: verticalSupportView.bottomAnchor
        ),
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: Constants.horizontalSupportWidth
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.horizontalSupportHeight
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: trafficLightHousingView.centerXAnchor
        ),
        
        redCircleView.topAnchor.constraint(
          equalTo: trafficLightHousingView.topAnchor,
          constant: Constants.distanceCircleFromTrafficLightHousing
        ),
        redCircleView.widthAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        redCircleView.heightAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        redCircleView.leadingAnchor.constraint(
          equalTo: trafficLightHousingView.leadingAnchor,
          constant: Constants.distanceCircleFromTrafficLightHousing
        ),
        redCircleView.trailingAnchor.constraint(
          equalTo: trafficLightHousingView.trailingAnchor,
          constant: -Constants.distanceCircleFromTrafficLightHousing
        ),
        
        yellowCircleView.topAnchor.constraint(
          equalTo: redCircleView.bottomAnchor,
          constant: Constants.distanceCircleFromTrafficLightHousing
        ),
        yellowCircleView.widthAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        yellowCircleView.heightAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        yellowCircleView.leadingAnchor.constraint(
          equalTo: trafficLightHousingView.leadingAnchor,
          constant: Constants.distanceCircleFromTrafficLightHousing
        ),
        yellowCircleView.trailingAnchor.constraint(
          equalTo: trafficLightHousingView.trailingAnchor,
          constant: -Constants.distanceCircleFromTrafficLightHousing
        ),
        
        greenCircleView.topAnchor.constraint(
          equalTo: yellowCircleView.bottomAnchor,
          constant: Constants.distanceCircleFromTrafficLightHousing
        ),
        greenCircleView.widthAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        greenCircleView.heightAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        greenCircleView.leadingAnchor.constraint(
          equalTo: trafficLightHousingView.leadingAnchor,
          constant: Constants.distanceCircleFromTrafficLightHousing
        ),
        greenCircleView.trailingAnchor.constraint(
          equalTo: trafficLightHousingView.trailingAnchor,
          constant: -Constants.distanceCircleFromTrafficLightHousing
        ),
        greenCircleView.bottomAnchor.constraint(
          equalTo: trafficLightHousingView.bottomAnchor,
          constant: -Constants.distanceCircleFromTrafficLightHousing
        ),
        
        trafficLightStartButton.topAnchor.constraint(
          equalTo: horizontalSupportView.bottomAnchor,
          constant: Constants.trafficLightStartButtonTop
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
    redCircleView.layer.cornerRadius = Constants.widthHeightCircle / 2
    
    yellowCircleView.backgroundColor = .yellow.withAlphaComponent(0.5)
    yellowCircleView.layer.cornerRadius = Constants.widthHeightCircle / 2
    
    greenCircleView.backgroundColor = .green.withAlphaComponent(0.5)
    greenCircleView.layer.cornerRadius = Constants.widthHeightCircle / 2
    
    trafficLightStartButton.backgroundColor = .blue
    trafficLightStartButton.setTitle("START", for: .normal)
    trafficLightStartButton.setTitleColor(.black, for: .normal)
    trafficLightStartButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
  
  func switchTrafficLight(currentState: TrafficLightType?) -> TrafficLightType {
    guard let currentState else {
      return .red
    }
    switch currentState {
    case .red:
      return .yellow
    case .yellow:
      return .green
    case .green:
      return .red
    }
  }
  @objc
  func buttonAction() {
    let newTrafficLightState = switchTrafficLight(currentState: trafficLightType)
    trafficLightType = newTrafficLightState  // сохранили новое значение
    
    switch newTrafficLightState {
    case .red:
      trafficLightStartButton.backgroundColor = .red
      trafficLightStartButton.setTitle("NEXT", for: .normal)
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(0.5)
      greenCircleView.backgroundColor = .green.withAlphaComponent(0.5)
      redCircleView.backgroundColor = .red
    case .yellow:
      trafficLightStartButton.backgroundColor = .yellow
      trafficLightStartButton.setTitle("NEXT", for: .normal)
      greenCircleView.backgroundColor = .green.withAlphaComponent(0.5)
      yellowCircleView.backgroundColor = .yellow
      redCircleView.backgroundColor = .red.withAlphaComponent(0.5)
    case .green:
      trafficLightStartButton.backgroundColor = .green
      trafficLightStartButton.setTitle("NEXT", for: .normal)
      greenCircleView.backgroundColor = .green
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(0.5)
      redCircleView.backgroundColor = .red.withAlphaComponent(0.5)
    }
  }
}
//MARK: - Constants
private enum Constants  {
  static let trafficLightHousingTop: CGFloat = 150
  static let verticalSupporWidth: CGFloat = 20
  static let verticalSupporHeight: CGFloat = 140
  static let horizontalSupportWidth: CGFloat = 100
  static let horizontalSupportHeight: CGFloat = 20
  static let distanceCircleFromTrafficLightHousing: CGFloat = 16
  static let widthHeightCircle: CGFloat = 50
  static let trafficLightStartButtonTop: CGFloat = 75
}
