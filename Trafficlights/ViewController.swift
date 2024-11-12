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
  }
}

//MARK: - Private functions

private extension ViewController{
  func settingLayout(){
    [redCircleView, yellowCircleView,greenCircleView].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      verticalStackCircles.addArrangedSubview($0)
    }
    [verticalStackCircles].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      trafficlightsСorpusView.addSubview($0)
    }
    [trafficlightsСorpusView, verticalSupportView,
     horizontalSupportView, trafficlightStartButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
    }
    
    NSLayoutConstraint.activate(
      [
        trafficlightsСorpusView.topAnchor.constraint(
          equalTo: view.topAnchor,
          constant: 30
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
          equalToConstant: 150
        ),
        redCircleView.heightAnchor.constraint(
          equalToConstant: 150
        ),
        yellowCircleView.widthAnchor.constraint(
          equalToConstant: 150
        ),
        yellowCircleView.heightAnchor.constraint(
          equalToConstant: 150
        ),
        greenCircleView.widthAnchor.constraint(
          equalToConstant: 150
        ),
        greenCircleView.heightAnchor.constraint(
          equalToConstant: 150
        ),
        
        verticalSupportView.widthAnchor.constraint(
          equalToConstant: 25
        ),
        verticalSupportView.heightAnchor.constraint(
          equalToConstant: 75
        ),
        verticalSupportView.topAnchor.constraint(
          equalTo: trafficlightsСorpusView.bottomAnchor
        ),
        verticalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        horizontalSupportView.widthAnchor.constraint(
          equalToConstant: 50
        ),
        horizontalSupportView.heightAnchor.constraint(
          equalToConstant: 25
        ),
        horizontalSupportView.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        ),
        
        trafficlightStartButton.topAnchor.constraint(
          equalTo: horizontalSupportView.bottomAnchor,
          constant: 40
        ),
        trafficlightStartButton.centerXAnchor.constraint(
          equalTo: view.centerXAnchor
        )
      ]
    )
  }
  
  
}

