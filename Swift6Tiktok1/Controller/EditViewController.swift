//
//  EditViewViewController.swift
//  Swift6Tiktok1
//
//  Created by Tatsushi Fukunaga on 2021/02/17.
//

import UIKit
import AVKit

class EditViewController: UIViewController {

    var url:URL?
    var playerController:AVPlayerViewController?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUPVideoPlayer(url: url!)
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
        
        let cancelButton = UIButton(frame: CGRect(x: 10.0, y: 10.0, width: 30.0, height: 30.0))
        cancelButton.setImage(UIImage(named: "cancel"), for: UIControl.State())
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
        player?.play()
    }
    
    @objc func cancel(){
        // 画面を戻る
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func playerItemDidReachEnd(){
        // リピート
        if self.player != nil {
            self.player?.seek(to: CMTime.zero)
            self.player?.volume = 1
            self.player?.play()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //selectVC
        if segue.identifier == "selectVC" {
            
            let selectVC = segue.destination as! SelectMusicViewController
            selectVC.passedURL = url
            //非同期処理
            DispatchQueue.global().async {
                selectVC.resultHandler = { url,text1,text2 in
                    //合成された動画のURL
                    self.setUPVideoPlayer(url: URL(string: url)!)
                }
            }
            
        }
        //shareVC
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
