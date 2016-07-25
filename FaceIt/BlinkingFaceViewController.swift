//
//  BlinkingFaceViewController.swift
//  FaceIt
//
//  Created by Michel Deiman on 24/07/2016.
//  Copyright © 2016 Michel Deiman. All rights reserved.
//

import UIKit

class BlinkingFaceViewController: FaceViewController {

	var blinking: Bool = false {
		didSet {
			startBlink()
		}
	}
	
	private struct BlinkRate {
		static let ClosedDuration = 0.4
		static let OpenDuration = 2.5
	}
	
	func startBlink() {
		if blinking {
			faceView.eyesOpen = false
			Timer.scheduledTimer(
				timeInterval: BlinkRate.ClosedDuration,
				target: self,
				selector: #selector(BlinkingFaceViewController.endBlink),
				userInfo: nil,
				repeats: false
			)
		}
	}
	
	func endBlink() {
		faceView.eyesOpen = true
		Timer.scheduledTimer(
			timeInterval: BlinkRate.OpenDuration,
			target: self,
			selector: #selector(BlinkingFaceViewController.startBlink),
			userInfo: nil,
			repeats: false
		)

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		blinking = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		blinking = false
	}
	
}

