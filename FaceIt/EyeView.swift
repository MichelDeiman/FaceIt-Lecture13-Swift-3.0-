//
//  EyeView.swift
//  FaceIt
//
//  Created by Michel Deiman on 25/07/2016.
//  Copyright © 2016 Michel Deiman. All rights reserved.
//

import UIKit

class EyeView: UIView {
	
	var lineWidth: CGFloat = 5.0 { didSet { setNeedsDisplay() } }
	var color: UIColor = UIColor.blue() { didSet { setNeedsDisplay() } }
	
	private struct BlinkRate {
		static let TransitionDuration = 0.4
	}
	
	var _eyesOpen: Bool = true { didSet { setNeedsDisplay() } }
	var eyesOpen: Bool {
		set {
			UIView.transition(
				with: self,
				duration: BlinkRate.TransitionDuration,
				options: [.transitionFlipFromTop, .curveLinear],
				animations: {
					self._eyesOpen = newValue
				},
				completion: nil
			)
		}
		get {
			return _eyesOpen
		}
	}
	
	
	override func draw(_ rect: CGRect) {
		var path: UIBezierPath!
		
		if eyesOpen {
			path = UIBezierPath(ovalIn: bounds.insetBy(dx: lineWidth/2, dy: lineWidth/2))
		} else {
			path = UIBezierPath()
			path.move(to: CGPoint(x: bounds.minX, y: bounds.midY))
			path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
		}
		path.lineWidth = lineWidth
		color.setStroke()
		path.stroke()
		
	}
}
