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
      verticalStackCircles.addSubview($0)
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
  }
}

