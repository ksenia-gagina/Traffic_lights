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
  }
}



