//
//  ViewController.swift
//  W6D1-Gestures-and-Animations
//
//  Created by Steven Tran on 2018-10-28.
//  Copyright © 2018 Steven Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var box: UIView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Gestures
    
    @IBAction func didTapBox(_ sender: UITapGestureRecognizer) {
        changeBoxColor()
        shakeBox()
    }

    @IBAction func didPinchBox(_ sender: UIPinchGestureRecognizer) {
        scaleBox(by: sender.scale)
    }

    @IBAction func didRotateBox(_ sender: UIRotationGestureRecognizer) {
        rotateBox(by: sender.rotation)
    }

    @IBAction func didPanBox(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        moveBox(to: location)
    }
    
    // MARK: Helpers
    
    func changeBoxColor() {

        // Select a random color
        let colors: [UIColor] = [.red, .blue, .purple, .yellow, .green, .brown, .black]
        let randomColor = colors.randomElement()

        // Animate the background color of the box over 0.4 seconds
        UIView.animate(withDuration: 0.4) {
            self.box.backgroundColor = randomColor
        }
    }

    func shakeBox() {
        let shake = CAKeyframeAnimation()
        shake.keyPath = "position.x"                // The keyPath of the layer property you want to animate
        shake.duration = 0.4                        // The duration of the animation

        shake.keyTimes = [0, 0.1, 0.2, 0.3, 0.4]    // Set the times the animation will reach each value
        shake.values = [0, -30, 30, -30, 0]         // Set the values at those times (the value of position.x)

        shake.isAdditive = true

        // Add the animation to the view layer
        box.layer.add(shake, forKey: "shake")
    }

    func moveBox(to point: CGPoint) {

        // Change the center point of the box
        box.center = point
    }

    func rotateBox(by rotationAngle: CGFloat) {

        // Change the transform property when you want to rotate a view
        box.transform = CGAffineTransform(rotationAngle: rotationAngle)
    }

    func scaleBox(by scale: CGFloat) {

        // Change the transform property when you want to scale a view
        box.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
