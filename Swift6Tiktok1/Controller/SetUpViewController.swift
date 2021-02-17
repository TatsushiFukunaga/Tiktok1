//
//  SetUpViewController.swift
//  Swift6Tiktok1
//
//  Created by Tatsushi Fukunaga on 2021/02/16.
//

import UIKit
import SwiftyCam
import AVFoundation
import MobileCoreServices

class SetUpViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var captureButton: SwiftyRecordButton!
    @IBOutlet weak var flipCameraButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldPrompToAppSettings = true
        cameraDelegate = self
        maximumVideoDuration = 20.0
        shouldUseDeviceOrientation = false
        allowAutoRotate = false
        audioEnabled = false
        captureButton.buttonEnabled = true
        captureButton.delegate = self
        swipeToZoomInverted = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        // 動画のみを閲覧できるアルバムを起動
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.mediaTypes = ["public.movie"]
        imagePickerController.allowsEditing = false
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
