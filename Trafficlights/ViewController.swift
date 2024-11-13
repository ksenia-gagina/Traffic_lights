//
//  ViewController.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 05.11.2024.
//

import UIKit

final class ViewController: UIViewController {
  
  //MARK: - Private propertes
  
  private let trafficlightsСorpusView = UIView()
  private let verticalStackCircles = UIStackView()
  private let redCircleView = UIView()
  private let yellowCircleView = UIView()
  private let greenCircleView = UIView()
  private let verticalSupportView = UIView()
  private let horizontalSupportView = UIView()
  private let trafficlightStartButton = UIButton()
  private var trafficLightType: TrafficLightType = .red
  
  //MARK: - Internal function
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingLayout()
    settingStyle()
  }
}

//MARK: - Private functions

private extension ViewController{
  func settingLayout(){
    [trafficlightsСorpusView, verticalSupportView,
     horizontalSupportView, trafficlightStartButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
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
          equalTo: view.topAnchor,
          constant: Constants.trafficlightsСorpusTopPadding
        ),
        trafficlightsСorpusView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
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
          equalToConstant: Constants.verticalSupportWidt
        ),
        verticalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.verticalSupportHeight
        ),
        verticalSupportView.topAnchor.constraint(
          equalTo: trafficlightsСorpusView.bottomAnchor
        ),
        verticalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: Constants.horizontalSupportWidt
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: Constants.horizontalSupportHeight
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        horizontalSupportView.topAnchor.constraint(
          equalTo: verticalSupportView.bottomAnchor
        ),
        
        trafficlightStartButton.topAnchor.constraint(
          equalTo: horizontalSupportView.bottomAnchor,
          constant: Constants.trafficlightStartButtonTopPadding
        ),
        trafficlightStartButton.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        )
      ]
    )
  }
  
  func settingStyle() {
    view.backgroundColor = .darkGray
    
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
    trafficlightStartButton.setTitle("START", for: .normal)
    trafficlightStartButton.backgroundColor = .blue
    trafficlightStartButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
  
  @objc
  func buttonAction() {
    switchState( )
    setColorForTraddicLight()
  }
  
  func switchState( ) {
    switch trafficLightType {
    case .red:
      trafficLightType = .yellow
    case .yellow:
      trafficLightType = .green
    case .green:
      trafficLightType = .red
    }
  }
  
  func setColorForTraddicLight() {
    switch  trafficLightType {
    case .red:
      trafficlightStartButton.backgroundColor = .red
      trafficlightStartButton.setTitle("NEXT", for: .normal)
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
      greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
      redCircleView.backgroundColor = .red
    case .yellow:
      trafficlightStartButton.backgroundColor = .yellow
      trafficlightStartButton.setTitle("NEXT", for: .normal)
      greenCircleView.backgroundColor = .green.withAlphaComponent(Constants.transparencyCircle)
      yellowCircleView.backgroundColor = .yellow
      redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    case .green:
      trafficlightStartButton.backgroundColor = .green
      trafficlightStartButton.setTitle("NEXT", for: .normal)
      greenCircleView.backgroundColor = .green
      yellowCircleView.backgroundColor = .yellow.withAlphaComponent(Constants.transparencyCircle)
      redCircleView.backgroundColor = .red.withAlphaComponent(Constants.transparencyCircle)
    }
  }
}

//MARK: - Constants

private enum Constants {
  static let trafficlightsСorpusTopPadding: CGFloat = 125
  static let verticalStackCirclesDistance: CGFloat = 15
  static let widthHeightCircle: CGFloat = 75
  static let verticalSupportWidt: CGFloat = 25
  static let verticalSupportHeight: CGFloat = 125
  static let horizontalSupportWidt: CGFloat = 75
  static let horizontalSupportHeight: CGFloat = 25
  static let trafficlightStartButtonTopPadding: CGFloat = 50
  static let verticalStackCirclesSpacing: CGFloat = 14
  static let transparencyCircle: CGFloat = 0.5
}
