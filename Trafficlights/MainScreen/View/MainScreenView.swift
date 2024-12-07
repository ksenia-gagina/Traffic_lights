//
//  MainScreenView.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 27.11.2024.
//

import UIKit

final class MainScreenView: UIView {
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    settingLayout()
    settingStyle()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Internal propertes
  
  var buttonAction: (() ->Void )?
  
  //MARK: - Private propertes
  
  private let trafficLightView = TrafficLightView()
  private let mainButtonView = MainButtonView()
  
  //MARK: - Internal funcs
  
  func setColorForTraddicLight(_ trafficLightType: TrafficLightType) {
    trafficLightView.setColorForTraddicLight(trafficLightType)
    mainButtonView.setColorForTraddicLight(trafficLightType)
  }
}

//MARK: - Private functions

private extension MainScreenView {
  func settingLayout() {
    [trafficLightView, mainButtonView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate(
      [
        trafficLightView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
        trafficLightView.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        mainButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
        mainButtonView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      ])
  }
  
  func settingStyle() {
    self.backgroundColor = .darkGray
    
    mainButtonView.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  @objc
  func buttonTapped() {
    buttonAction?()
  }
}
