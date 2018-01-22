//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Rohan Pahwa on 1/21/18.
//  Copyright © 2018 Pahwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        messageLabel.text = "You are awesome!"
    }
}

