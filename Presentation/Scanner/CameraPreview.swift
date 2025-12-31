//
//  CameraPreview.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/31.
//

import UIKit
import AVFoundation

final class CameraPreview: UIView {

    private var previewLayer: AVCaptureVideoPreviewLayer?

    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }

    func setup(with session: AVCaptureSession) {
        guard let previewLayer = self.layer as? AVCaptureVideoPreviewLayer else { return }
        self.previewLayer = previewLayer
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
    }
}
