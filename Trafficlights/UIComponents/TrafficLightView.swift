//
//  TrafficLightView.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 07.12.2024.
//

import UIKit

final class TrafficLightView: UIView {
  
  //MARK: - Private propertes
  
  private let trafficlightsСorpusView = UIView()
  private let verticalStackCircles = UIStackView()
  private let redCircleView = UIView()
  private let yellowCircleView = UIView()
  private let greenCircleView = UIView()
  private let verticalSupportView = UIView()
  private let horizontalSupportView = UIView()
  
  //MARK: - Init
  
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
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
      greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
      redCircleView.backgroundColor = .red
    case .yellow:
      greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
      yellowCircleView.backgroundColor = .yellow
      redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    case .green:
      greenCircleView.backgroundColor = .green
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
      redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    }
  }
}
//MARK: - Private funcs

private extension TrafficLightView {
  func settingLayout() {
    [trafficlightsСorpusView, verticalSupportView,
     horizontalSupportView].forEach{
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
          equalTo: topAnchor
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
          equalTo: trafficlightsСorpusView.centerXAnchor
        ),
        
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: Constants.horizontalSupportWidth
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.horizontalSupportHeight
        ),
        horizontalSupportView.leadingAnchor.constraint(
          equalTo: leadingAnchor
        ),
        horizontalSupportView.trailingAnchor.constraint(
          equalTo: trailingAnchor
        ),
        horizontalSupportView.bottomAnchor.constraint(
          equalTo: bottomAnchor
        ),
        horizontalSupportView.topAnchor.constraint(
          equalTo: verticalSupportView.bottomAnchor
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: verticalSupportView.centerXAnchor
        )
      ]
    )
  }
  func settingStyle() {
    trafficlightsСorpusView.backgroundColor = .black
    verticalSupportView.backgroundColor = .black
    horizontalSupportView.backgroundColor = .black
    
    verticalStackCircles.axis = .vertical
    verticalStackCircles.spacing = Constants.verticalStackCirclesSpacing
    verticalStackCircles.distribution = .fill
    
    redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    redCircleView.layer.cornerRadius = Constants.widthHeightCircle / Constants.radiusСircle
    
    yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
    yellowCircleView.layer.cornerRadius = Constants.widthHeightCircle / Constants.radiusСircle
    
    greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
    greenCircleView.layer.cornerRadius = Constants.widthHeightCircle / Constants.radiusСircle
  }
}
// MARK: - Constants
private enum Constants {
  static let verticalStackCirclesDistance: CGFloat = 15
  static let widthHeightCircle: CGFloat = 75
  static let verticalSupportWidth: CGFloat = 25
  static let verticalSupportHeight: CGFloat = 125
  static let horizontalSupportWidth: CGFloat = 75
  static let horizontalSupportHeight: CGFloat = 25
  static let verticalStackCirclesSpacing: CGFloat = 14
  static let transparencyCircle: CGFloat = 0.5
  static let radiusСircle: CGFloat = 2
}
