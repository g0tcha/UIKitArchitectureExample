//
//  ViewController.swift
//  ArchitectureExample
//
//  Created by Vincent Grossier on 14/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let service: MyServiceProtocol = MyService()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loadData() {
        service.getMyData { result in
            switch result {
            case .success:
                print("data successfuly received.")
                // Display data
            case .failure:
                print("someting went wrong...")
                // Display error
            }
        }
    }
}

