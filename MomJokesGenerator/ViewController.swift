//
//  ViewController.swift
//  MomJokesGenerator
//
//  Created by Dias Karimov on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var JokeString: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    
    func decodeAPI() {
        let url = URL(string: "https://api.yomomma.info/")
        
        let task = URLSession.shared.dataTask(with: url!){
            data, response, error in
            
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode(Jokes.self, from: data)
                    let lastJoke = tasks.joke
                    DispatchQueue.main.async {
                        self.JokeString.text = lastJoke
                    }
                }catch{
                    print(error)
                    
                }
            }
        }
        task.resume()
        
    }
    
    @IBAction func JokeGenerator(_ sender: UIButton) {
        decodeAPI()
    }
}


















//    func parseJSON(_ data: Data)-> String {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(Jokes.self, from: data)
//            let lastJoke = decodedData.joke
//            return lastJoke
//        }
//        catch {
//            print(error)
//
//        }
//    }



//extension URLSession {
//    func fetchData(at url: URL, completion: @escaping (Result<Jokes, Error> ) -> Void) {
//    self.dataTask(with: url) { data, response, error in
//        if data != nil &&  error == nil {
//        do {
//          let fetchingData  = try JSONDecoder().decode(Jokes.self, from: data!)
//            completion(.success(fetchingData))
//        } catch   {
//            completion(.failure(error))
//        }
//      }
//    }.resume()
//  }
//}
