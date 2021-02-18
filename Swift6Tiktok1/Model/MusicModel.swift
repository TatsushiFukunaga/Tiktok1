//
//  MusicModel.swift
//  Swift6Tiktok1
//
//  Created by Tatsushi Fukunaga on 2021/02/18.
//

import Foundation
import SwiftyJSON
import Alamofire

class MusicModel {

    var artistNameArray = [String]()
    var trackCensoredNameArray = [String]()
    var preViewUrlArray = [String]()
    var artworkUrl100Array = [String]()
    
    //JSON解析
    func setData(resultCount:Int, encodeUrlString:String){
        //通信
        AF.request(encodeUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            self.artistNameArray.removeAll()
            self.trackCensoredNameArray.removeAll()
            self.preViewUrlArray.removeAll()
            self.artworkUrl100Array.removeAll()
            
            print(response)
            
            switch response.result{
            
              case.success:
                do {
                    let json:JSON = try JSON(data: response.data!)
                    for i in 0...resultCount - 1 {
                        print(i)
                        
                        if json["results"][i]["artistName"].string == nil {
                            print("ヒットしませんでした")
                            return
                        }
                        
                        self.artistNameArray.append(json["results"][i]["artistName"].string!)
                        self.trackCensoredNameArray.append(json["results"][i]["trackCensoredName"].string!)
                        self.preViewUrlArray.append(json["results"][i]["preViewUrl"].string!)
                        self.artworkUrl100Array.append(json["results"][i]["artworkUrl100"].string!)
                    }
                } catch {
                }
                break
              case .failure(_): break
                
            }
        }
    }
}
