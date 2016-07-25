//
//  EmotionsController.swift
//  FaceIt
//
//  Created by Michel Deiman on 18/05/16.
//  Copyright © 2016 Michel Deiman. All rights reserved.
//

import UIKit

class EmotionsController: UIViewController {
	
	private let emotionalFaces: [String: FacialExpression] = [
		"angry": FacialExpression(eyes: .closed, eyeBrows: .furrowed, mouth: .frown),
		"mischievious": FacialExpression(eyes: .open, eyeBrows: .furrowed, mouth: .grin),
		"happy": FacialExpression(eyes: .open, eyeBrows: .normal, mouth: .smile),
		"worried": FacialExpression(eyes: .open, eyeBrows: .furrowed, mouth: .smirk)
	]
	
	override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
		var destinationvc = segue.destinationViewController
		if let nc = destinationvc as? UINavigationController {
			destinationvc = nc.visibleViewController!
		}
		if let faceViewController = destinationvc as? FaceViewController,
		let identifier = segue.identifier {
			if let expression = emotionalFaces[identifier] {
				faceViewController.expression = expression
				if let button = sender as? UIButton {
					faceViewController.navigationItem.title = button.currentTitle
				}
			}
		}
	}

}
