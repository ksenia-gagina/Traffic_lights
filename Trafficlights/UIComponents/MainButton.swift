//
//  MainButton.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 08.12.2024.
//

import UIKit

final class MainButtonView: UIButton {
  
  //MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    settingLayout()
    settingStyle()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    CGSize(width:  UIScreen.main.bounds.width / Constants.recommendedButtonWidth, height: Constants.recommendedButtonHeight)
  }
  
  //MARK: - Internal funcs
  
  func setColorForTraddicLight(_ trafficLightType: TrafficLightType) {
    switch trafficLightType {
    case .red:
      backgroundColor = .red
      setTitle(Constants.textButtonBeforeLaunching, for: .normal)
    case .yellow:
      backgroundColor = .yellow
      setTitle(Constants.textButtonBeforeLaunching, for: .normal)
      
    case .green:
      backgroundColor = .green
      setTitle(Constants.textButtonBeforeLaunching, for: .normal)
    }
  }
}

//MARK: - Private functions

private extension MainButtonView {
  func settingLayout() {
    layer.cornerRadius = Constants.roundingCornersButton
  }
  func settingStyle() {
    setTitleColor(.black, for: .normal)
    setTitle(Constants.textButtonAfterLaunch, for: .normal)
    backgroundColor = .blue
  }
}

//MARK: - Constants

private enum Constants {
  static let textButtonBeforeLaunching: String = "NEXT"
  static let textButtonAfterLaunch: String = "START"
  static let trafficlightStartButtonTopPadding: CGFloat = 50
  static let recommendedButtonWidth: CGFloat = 3
  static let recommendedButtonHeight: CGFloat = 52
  static let roundingCornersButton: CGFloat = 10
}
