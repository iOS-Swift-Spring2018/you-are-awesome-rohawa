//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Rohan Pahwa on 1/21/18.
//  Copyright © 2018 Pahwa. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 3
    let numberOfSounds = 4

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        let messages = ["It is certain",
                        "It is decidedly so",
                        "As I see it yes",
                        "Most likely",
                        "Reply hazy try again",
                        "Ask again later",
                        "Don't count on it",
                        "My reply is no"]
        var newIndex = 0
        
        //Show Message
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        }while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
        
        //Show Image
        awesomeImage.isHidden = false
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(numberOfImages)))
        }while imageIndex == newIndex
        imageIndex = newIndex
        awesomeImage.image = UIImage(named: "image\(imageIndex)")
        
        //Play Sound
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(numberOfSounds)))
        }while soundIndex == newIndex
        soundIndex = newIndex
        var soundName = "sound\(soundIndex)"
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer (data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: file \(soundName) failed to correctly load data")
            }
        } else {
            print("ERROR: file \(soundName) failed to play")
        }
    }
}

