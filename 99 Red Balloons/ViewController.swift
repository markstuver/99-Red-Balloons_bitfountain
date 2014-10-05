//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Mark Stuver on 10/4/14.
//  Copyright (c) 2014 Mark Stuver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var numberOfBalloonsLabel: UILabel!
    
    var arrayOfBalloons:[Balloon] = []
    var currentIndexNumber:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var howManyBalloons = Balloon()

        var numberOfBalloons = 1
        
        for var i = 1; i <= 99; i++ {
            howManyBalloons.amount = numberOfBalloons
            arrayOfBalloons.append(howManyBalloons)
            numberOfBalloons++
        }
        
        numberOfBalloonsLabel.text = "\(arrayOfBalloons[0].amount)"
        balloonImageView.image = UIImage(named: "red.jpg")
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Function called when the Next button is pressed
    @IBAction func NextButtonPressed(sender: UIBarButtonItem) {
        
        let randomNumber = Int(arc4random_uniform(UInt32(99)))
        var currentAmountOfBalloons = arrayOfBalloons[randomNumber]

        self.numberOfBalloonsLabel.text = "\(currentAmountOfBalloons.amount)"
        
        self.balloonImageView.image = randomBalloonBackgroundImage()
        
    }
    
    
    // Helper Function for random BalloonBackgroundImages
    func randomBalloonBackgroundImage()->UIImage {
        
        var randomBackgroundImage:UIImage = UIImage(named: "")
        let randomNumber = Int(arc4random_uniform(UInt32(4)))
        
        println("randomNumber is: \(randomNumber)")
        println("currentIndexNumber is: \(currentIndexNumber)")
        if self.currentIndexNumber == randomNumber {
            
            println("first in If Statement: currentIndexNumber is: \(currentIndexNumber)")

            currentIndexNumber++
            println("in If Statement: currentIndexNumber is: \(currentIndexNumber)")

        } else {
            
            self.currentIndexNumber = randomNumber
        }
        
        println("After If Statement currentIndexNumber is: \(currentIndexNumber)")
        
        switch currentIndexNumber {
        case 0:
            randomBackgroundImage = UIImage(named: "99redballoons.jpg")
        case 1:
            randomBackgroundImage = UIImage(named: "red.jpg")
        case 2:
            randomBackgroundImage = UIImage(named: "red_balloon.jpg")
        case 3:
            randomBackgroundImage = UIImage(named: "red_balloons.jpg")
        case 4:
            randomBackgroundImage = UIImage(named: "shiny-red-balloon.jpg")
        default:
            println("Error has occurred in randomBalloonBackgroundImage Helper Function")
        }
        
        
        return randomBackgroundImage
    }
    
    
    
    

}

