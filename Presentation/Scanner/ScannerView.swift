//
//  ScannerView.swift
//  NutritionLens
//
//  Created by Patrician Andres on 2025/12/29.
//

import SwiftUI

//struct ScannerView: View {
//    let onScan: (String) -> Void
//
//    var body: some View {
//        VStack {
//            Text("scanner.instructions")
//                .padding()
//
//            // Your scanner implementation here
//        }
//        .navigationTitle("scanner.title")
//    }
//}


import AVFoundation
import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    var onScan: (String) -> Void

    func makeUIViewController(context: Context) -> ScannerViewController {
        let controller = ScannerViewController()
        controller.onScan = onScan
        return controller
    }

    func updateUIViewController(
        _ uiViewController: ScannerViewController,
        context: Context
    ) {}
}

final class ScannerViewController: UIViewController,
    AVCaptureMetadataOutputObjectsDelegate
{
    var onScan: ((String) -> Void)?

    private let session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    private func setupCamera() {
        guard let device = AVCaptureDevice.default(for: .video),
            let input = try? AVCaptureDeviceInput(device: device)
        else {
            return
        }

        session.addInput(input)

        let output = AVCaptureMetadataOutput()
        session.addOutput(output)

        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [
            .ean13, .ean8, .upce, .code128,
        ]

        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = .resizeAspectFill
        preview.frame = view.layer.bounds
        view.layer.addSublayer(preview)

        session.startRunning()
    }

    func metadataOutput(
        _ output: AVCaptureMetadataOutput,
        didOutput metadataObjects: [AVMetadataObject],
        from connection: AVCaptureConnection
    ) {
        guard
            let object = metadataObjects.first
                as? AVMetadataMachineReadableCodeObject,
            let value = object.stringValue
        else { return }

        session.stopRunning()
        onScan?(value)
        dismiss(animated: true)
    }
}
