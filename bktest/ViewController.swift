//
//  ViewController.swift
//  bktest
//
//  Created by Rian Sanjaya Ng on 23/01/19.
//  Copyright © 2019 Rian Sanjaya Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products: [Product] = [
//        Product(description: "prod1", image: ""),
//        Product(description: "prod2", image: "")
    ]
    
    var prods: [String: Any] = [:]
    
    func getData() {
//        let url = URL(string: "https://api.bukalapak.com/v2/flash_banners.json")!
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let data = data,
//                let string = String(data: data, encoding: .utf8) {
//                    print(string)
//                }
//        }
//        task.resume()
        
        let mySession = URLSession(configuration: .default)
        let baseURL = URL(string: "https://api.bukalapak.com/v2/flash_banners.json")
        let myDataTask = mySession.dataTask(with: baseURL!) { (data, response, error) in
            if let errorProcess = error {
                print("Error: \(errorProcess.localizedDescription)")

            } else if let myData = data {
//                print("Data: \(myData)")

                do {
                    let jsonData = try JSONSerialization.jsonObject(with: myData, options: [])
                    
                    if let castedJSON = jsonData as? [String: Any] {
//                        print(castedJSON)
//                        for (key, value) in castedJSON {
//                            print("\(key): \(value)")
//                        }

                        let banners = castedJSON["banners"]
                        if let array = banners as? [Any] {
                            print(array)
                            
//                            let data = try? JSONSerialization.data(withJSONObject: array[0], options: [])
//                            let product = try? JSONDecoder().decode(Product.self, from: data!)
//                            print(product?.image)
//                            self.products.append(product!)
//                            print(self.products[0].image)
                            
                            for prod in array {
                                let data = try? JSONSerialization.data(withJSONObject: prod, options: [])
                                let product = try? JSONDecoder().decode(Product.self, from: data!)
                                print("\(product?.image), \(product?.description)")
                                self.products.append(product!)
//                                print(self.products[0].image)
                            }
                            for el in self.products {
                                print(el.image)
                            }
                        }
                    }

                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }

        myDataTask.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        let product = products[indexPath.row]
        
        cell.proImage.image = UIImage(named: product.image)
        cell.prodLabel.text = product.description
        
        return cell
    }

}

