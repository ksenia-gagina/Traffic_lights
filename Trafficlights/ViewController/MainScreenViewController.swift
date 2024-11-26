//
//  ViewController.swift
//  Trafficlights
//
//  Created by Ксения Гагина on 05.11.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {
  
  //MARK: - Private propertes
  
  private var trafficLightType: TrafficLightType = .red
  private let moduleView = MainScreenView()
  
  //MARK: - Internal function
  
  override func loadView() {
    super.loadView()
    
    view = moduleView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    moduleView.buttonAction = { [ weak self] in
      guard let self else { return }
      switchState()
      moduleView.setColorForTraddicLight(trafficLightType)
    }
  }
}
//MARK: - Private functions

private extension MainScreenViewController {
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
}

