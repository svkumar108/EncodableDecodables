//
//  ViewController.swift
//  EncodableDecodable
//
//  Created by sivakumar on 10/12/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit

struct Post2 : Codable{
    
    let title: String
    let userId: Int
    let body: String
    let id: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    
        
    }
    
    
    @IBAction func SendPost(_ sender: UIButton) {
        
    
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
      //  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let newPost = Post2(title: "siva kumar", userId: 111, body: "oh my god", id: 22)
    
        do{
        request.httpBody = try JSONEncoder().encode(newPost)
            
        } catch {}
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            
            guard let data = request.httpBody else {return}
            
            do{
                let jsonData = try JSONDecoder().decode(Post2.self, from: data)
                print(jsonData)
            } catch{
                print("error while parsing")
            }
        }.resume()
        
        
    }
    
    
    @IBAction func GetUsers(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else{return}
           
            do{
//                let myJson = try JSONSerialization.jsonObject(with: data, options: [])
//                print(myJson)
                let users = try JSONDecoder().decode([User].self, from: data)
                
                for user in users {
                    print(user.address.city)
                    
                }
                
            } catch{
                print("error")
            }
        }.resume()
       
    }
    



// parsing our own Data

//func mydata(){
//
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let postDict = ["userId" : "111",
//                    "title" : "siva kumar",
//                    "id" : "21",
//                    "body" : "you are awesome baby"]
//
//
//    do{
//        request.httpBody = try JSONSerialization.data(withJSONObject: postDict, options: [])
//
//    } catch {}
//
//    URLSession.shared.dataTask(with: request) { (data, _, _) in
//
//        guard let data = request.httpBody else { return }
//        do{
//            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
//            print(jsonData)
//        } catch{
//            print("error while parsing")
//        }
//
//        }.resume()
//
//}
    
  
    // encoding our own data
//    func encoding(){
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        //  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//        let newPost = Post2(title: "siva kumar", userId: 111, body: "oh my god", id: 22)
//        do{
//            request.httpBody = try JSONEncoder().encode(newPost)
//
//        } catch {}
//
//        URLSession.shared.dataTask(with: request) { (data, _, _) in
//
//            guard let data = request.httpBody else {return}
//
//            do{
//                let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
//                print(jsonData)
//            } catch{
//                print("error while parsing")
//            }
//            }.resume()
//    }
    
    
//Decoding our own data
    
//    func decoding(){
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        //  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//        let newPost = Post2(title: "siva kumar", userId: 111, body: "oh my god", id: 22)
//        do{
//            request.httpBody = try JSONEncoder().encode(newPost)
//
//        } catch {}
//
//        URLSession.shared.dataTask(with: request) { (data, _, _) in
//
//            guard let data = request.httpBody else {return}
//
//            do{
//                let jsonData = try JSONDecoder().decode(Post2.self, from: data)
//                print(jsonData)
//            } catch{
//                print("error while parsing")
//            }
//            }.resume()
//    }

}
