//
//  ScannerView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/29.
//

import SwiftUI
import AVFoundation

struct ScannerView: UIViewRepresentable {
    let onCodeScanned: (String) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onCodeScanned: onCodeScanned)
    }

    func makeUIView(context: Context) -> CameraPreview {
        let view = CameraPreview()
        context.coordinator.configureSession(for: view)
        return view
    }

    func updateUIView(_ uiView: CameraPreview, context: Context) {
        // Nothing to update dynamically for now
    }

    // MARK: - Coordinator

    final class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        private let session = AVCaptureSession()
        private let onCodeScanned: (String) -> Void
        private var didSendResult = false

        init(onCodeScanned: @escaping (String) -> Void) {
            self.onCodeScanned = onCodeScanned
        }

        func configureSession(for preview: CameraPreview) {
            preview.setup(with: session)

            guard let device = AVCaptureDevice.default(for: .video),
                  let input = try? AVCaptureDeviceInput(device: device),
                  session.canAddInput(input) else {
                return
            }

            session.addInput(input)

            let metadataOutput = AVCaptureMetadataOutput()
            guard session.canAddOutput(metadataOutput) else { return }
            session.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .upce, .code128]

            session.startRunning()
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput,
                            didOutput metadataObjects: [AVMetadataObject],
                            from connection: AVCaptureConnection) {
            guard !didSendResult,
                  let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
                  let value = metadataObject.stringValue else { return }

            didSendResult = true
            session.stopRunning()
            onCodeScanned(value)
        }
    }
}
