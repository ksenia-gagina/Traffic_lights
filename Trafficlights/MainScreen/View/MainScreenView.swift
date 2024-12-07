//
//  MainScreenView.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 27.11.2024.
//

import UIKit

final class MainScreenView: UIView {

  //MARK: - Internal propertes
  
  var buttonAction: (() ->Void )?
  
  //MARK: - Private propertes
  
  private let trafficlightsСorpusView = UIView()
  private let verticalStackCircles = UIStackView()
  private let redCircleView = UIView()
  private let yellowCircleView = UIView()
  private let greenCircleView = UIView()
  private let verticalSupportView = UIView()
  private let horizontalSupportView = UIView()
  private let trafficlightStartButton = UIButton()

// MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    settingLayout()
    settingStyle()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Internal funcs
  
  func setColorForTraddicLight(_ trafficLightType: TrafficLightType) {
    switch trafficLightType {
    case .red:
      trafficlightStartButton.backgroundColor = .red
      trafficlightStartButton.setTitle(Constants.textButtonBeforeLaunching, for: .normal)
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
      greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
      redCircleView.backgroundColor = .red
    case .yellow:
      trafficlightStartButton.backgroundColor = .yellow
      trafficlightStartButton.setTitle(Constants.textButtonBeforeLaunching, for: .normal)
      greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
      yellowCircleView.backgroundColor = .yellow
      redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    case .green:
      trafficlightStartButton.backgroundColor = .green
      trafficlightStartButton.setTitle(Constants.textButtonBeforeLaunching, for: .normal)
      greenCircleView.backgroundColor = .green
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
      redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    }
  }
}

//MARK: - Private functions

private extension MainScreenView {
  func settingLayout() {
    [trafficlightsСorpusView, verticalSupportView,
     horizontalSupportView, trafficlightStartButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    [redCircleView, yellowCircleView, greenCircleView].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      verticalStackCircles.addArrangedSubview($0)
    }
    [verticalStackCircles].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      trafficlightsСorpusView.addSubview($0)
    }
    
    NSLayoutConstraint.activate(
      [
        trafficlightsСorpusView.topAnchor.constraint(
          equalTo: self.topAnchor,
          constant: Constants.trafficLightsСorpusTopPadding
        ),
        trafficlightsСorpusView.centerXAnchor.constraint(
          equalTo: self.centerXAnchor
        ),
        
        verticalStackCircles.topAnchor.constraint(
          equalTo: trafficlightsСorpusView.topAnchor,
          constant: Constants.verticalStackCirclesDistance
        ),
        verticalStackCircles.trailingAnchor.constraint(
          equalTo: trafficlightsСorpusView.trailingAnchor,
          constant: -Constants.verticalStackCirclesDistance
        ),
        verticalStackCircles.bottomAnchor.constraint(
          equalTo: trafficlightsСorpusView.bottomAnchor,
          constant: -Constants.verticalStackCirclesDistance
        ),
        verticalStackCircles.leadingAnchor.constraint(
          equalTo: trafficlightsСorpusView.leadingAnchor,
          constant: Constants.verticalStackCirclesDistance
        ),
        
        redCircleView.widthAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        redCircleView.heightAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        yellowCircleView.widthAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        yellowCircleView.heightAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        greenCircleView.widthAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        greenCircleView.heightAnchor.constraint(
          equalToConstant: Constants.widthHeightCircle
        ),
        
        verticalSupportView.widthAnchor.constraint(
          equalToConstant: Constants.verticalSupportWidth
        ),
        verticalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.verticalSupportHeight
        ),
        verticalSupportView.topAnchor.constraint(
          equalTo: trafficlightsСorpusView.bottomAnchor
        ),
        verticalSupportView.centerXAnchor.constraint(
          equalTo: self.centerXAnchor
        ),
        
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: Constants.horizontalSupportWidth
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.horizontalSupportHeight
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: self.centerXAnchor
        ),
        horizontalSupportView.topAnchor.constraint(
          equalTo: verticalSupportView.bottomAnchor
        ),
        
        trafficlightStartButton.topAnchor.constraint(
          equalTo: horizontalSupportView.bottomAnchor,
          constant: Constants.trafficlightStartButtonTopPadding
        ),
        trafficlightStartButton.centerXAnchor.constraint(
          equalTo: self.centerXAnchor
        )
      ]
    )
  }
  
  func settingStyle() {
    self.backgroundColor = .darkGray
    
    trafficlightsСorpusView.backgroundColor = .black
    verticalSupportView.backgroundColor = .black
    horizontalSupportView.backgroundColor = .black
    
    verticalStackCircles.axis = .vertical
    verticalStackCircles.spacing = Constants.verticalStackCirclesSpacing
    verticalStackCircles.distribution = .fill
    
    redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    redCircleView.layer.cornerRadius = Constants.widthHeightCircle / 2
    
    yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
    yellowCircleView.layer.cornerRadius = Constants.widthHeightCircle / 2
    
    greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
    greenCircleView.layer.cornerRadius = Constants.widthHeightCircle / 2
    
    trafficlightStartButton.setTitleColor(.black, for: .normal)
    trafficlightStartButton.setTitle(Constants.textButtonAfterLaunch, for: .normal)
    trafficlightStartButton.backgroundColor = .blue
    trafficlightStartButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  @objc
  func buttonTapped() {
    buttonAction?()
  }
}

//MARK: - Constants

private enum Constants {
  static let trafficLightsСorpusTopPadding: CGFloat = 125
  static let verticalStackCirclesDistance: CGFloat = 15
  static let widthHeightCircle: CGFloat = 75
  static let verticalSupportWidth: CGFloat = 25
  static let verticalSupportHeight: CGFloat = 125
  static let horizontalSupportWidth: CGFloat = 75
  static let horizontalSupportHeight: CGFloat = 25
  static let trafficlightStartButtonTopPadding: CGFloat = 50
  static let verticalStackCirclesSpacing: CGFloat = 14
  static let transparencyCircle: CGFloat = 0.5
  static let textButtonBeforeLaunching: String = "NEXT"
  static let textButtonAfterLaunch: String = "START"
}
