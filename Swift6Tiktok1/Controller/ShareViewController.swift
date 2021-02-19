//
//  ShareViewController.swift
//  Swift6Tiktok1
//
//  Created by Tatsushi Fukunaga on 2021/02/19.
//

import UIKit
import AVKit
import Photos

class ShareViewController: UIViewController {

    var captionString = String()
    var passedURL = String()
    var player: AVPlayer?
    var playerController: AVPlayerViewController?
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = NotificationCenter.default
        
        notification.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notification.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUPVideoPlayer(url: URL(string: passedURL)!)
    }
    
    func setUPVideoPlayer(url:URL) {
        
        playerController?.removeFromParent()
        player = nil
        
        view.backgroundColor = .black
        
        playerController = AVPlayerViewController()
        playerController?.videoGravity = .resizeAspectFill
        playerController?.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        playerController?.showsPlaybackControls = false
        playerController?.player = player!
        self.addChild(playerController!)
        self.view.addSubview((playerController?.view)!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
        player?.play()
    }
    
    @objc func playerItemDidReachEnd(_ nitification: Notification){
        // リピート
        if self.player != nil {
            self.player?.seek(to: CMTime.zero)
            self.player?.volume = 1
            self.player?.play()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: Notification?){
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification?){
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform.identity
        }
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
