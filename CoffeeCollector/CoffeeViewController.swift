//
//  CoffeeViewController.swift
//  CoffeeCollector
//
//  Created by Sebastian Asp on 2017-06-05.
//  Copyright © 2017 Sebastian Asp. All rights reserved.
//

import UIKit

class CoffeeViewController: UIViewController {

    @IBOutlet weak var coffeeImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }

    @IBOutlet weak var photosTapped: UIBarButtonItem!

    @IBAction func addTapped(_ sender: Any) {
    }
}
