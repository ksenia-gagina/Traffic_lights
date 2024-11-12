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
  
  //MARK: - Internal function
  
  override func viewDidLoad() {
    super .viewDidLoad()
    
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
    [redCircleView, yellowCircleView,greenCircleView].forEach{
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
          constant: 125
        ),
        trafficlightsСorpusView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        verticalStackCircles.topAnchor.constraint(
          equalTo: trafficlightsСorpusView.topAnchor,
          constant: 15
        ),
        verticalStackCircles.trailingAnchor.constraint(
          equalTo: trafficlightsСorpusView.trailingAnchor,
          constant: -15
        ),
        verticalStackCircles.bottomAnchor.constraint(
          equalTo: trafficlightsСorpusView.bottomAnchor,
          constant: -15
        ),
        verticalStackCircles.leadingAnchor.constraint(
          equalTo: trafficlightsСorpusView.leadingAnchor,
          constant: 15
        ),
        
        redCircleView.widthAnchor.constraint(
          equalToConstant: 75
        ),
        redCircleView.heightAnchor.constraint(
          equalToConstant: 75
        ),
        yellowCircleView.widthAnchor.constraint(
          equalToConstant: 75
        ),
        yellowCircleView.heightAnchor.constraint(
          equalToConstant: 75
        ),
        greenCircleView.widthAnchor.constraint(
          equalToConstant: 75
        ),
        greenCircleView.heightAnchor.constraint(
          equalToConstant: 75
        ),
        
        verticalSupportView.widthAnchor.constraint(
          equalToConstant: 25
        ),
        verticalSupportView.heightAnchor.constraint(
          equalToConstant: 125
        ),
        verticalSupportView.topAnchor.constraint(
          equalTo: trafficlightsСorpusView.bottomAnchor
        ),
        verticalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: 75
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: 25
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        horizontalSupportView.topAnchor.constraint(
          equalTo: verticalSupportView.bottomAnchor
        ),
        
        trafficlightStartButton.topAnchor.constraint(
          equalTo: horizontalSupportView.bottomAnchor,
          constant: 50
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
    verticalStackCircles.spacing = 14
    verticalStackCircles.distribution = .fill
    
    redCircleView.backgroundColor = .red.withAlphaComponent(0.5)
    redCircleView.layer.cornerRadius = 75 / 2
    
    yellowCircleView.backgroundColor = .yellow.withAlphaComponent(0.5)
    yellowCircleView.layer.cornerRadius = 75 / 2
    
    greenCircleView.backgroundColor = .green.withAlphaComponent(0.5)
    greenCircleView.layer.cornerRadius = 75 / 2
    
    trafficlightStartButton.setTitleColor(.black, for: .normal)
    trafficlightStartButton.setTitle("START", for: .normal)
    trafficlightStartButton.backgroundColor = .blue
    //trafficlightStartButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
  }
  
  
}

