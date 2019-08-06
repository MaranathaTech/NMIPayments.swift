//
//  NMIPayments.swift
//  Wrath and Grace
//
//  Created by Ernie Lail on 8/1/19.
//  Copyright © 2019 Development. All rights reserved.
//

import UIKit
import Alamofire


enum nmiStatus {
    case APPROVED, DECLINED, ERROR
}

class NMIPayments: NSObject {

    var status:nmiStatus?
    
    var login = [String:String]()
    var order = [String:String]()
    var billing = [String:String]()
    var shipping = [String:String]()

    func setLogin(username:String, password:String) {
    self.login["username"] = username;
    self.login["password"] = password;
    }
    
    func setOrder(orderid:String, orderdescription:String,tax:String,shipping:String,ponumber:String,ipaddress:String) {
    self.order["orderid"]          = orderid;
    self.order["orderdescription"] = orderdescription;
    self.order["tax"]              = tax;
    self.order["shipping"]         = shipping;
    self.order["ponumber"]         = ponumber;
    self.order["ipaddress"]        = ipaddress;
    }
    
    func setBilling(firstname:String,lastname:String,company:String,address1:String,address2:String,city:String,state:String,zip:String,country:String,phone:String,fax:String,email:String,website:String) {
    self.billing["firstname"] = firstname;
    self.billing["lastname"]  = lastname;
    self.billing["company"]   = company;
    self.billing["address1"]  = address1;
    self.billing["address2"]  = address2;
    self.billing["city"]      = city;
    self.billing["state"]     = state;
    self.billing["zip"]       = zip;
    self.billing["country"]   = country;
    self.billing["phone"]     = phone;
    self.billing["fax"]       = fax;
    self.billing["email"]     = email;
    self.billing["website"]   = website;
    }
    
    func setShipping(firstname:String, lastname:String, company:String, address1:String, address2:String, city:String, state:String, zip:String, country:String, email:String) {
    self.shipping["firstname"] = firstname;
    self.shipping["lastname"]  = lastname;
    self.shipping["company"]   = company;
    self.shipping["address1"]  = address1;
    self.shipping["address2"]  = address2;
    self.shipping["city"]      = city;
    self.shipping["state"]     = state;
    self.shipping["zip"]       = zip;
    self.shipping["country"]   = country;
    self.shipping["email"]     = email;
    }
    
    // Transaction Functions
    
    func doSale(amount:Double, ccnumber:String, ccexp:String, cvv:String, with completion:@escaping (String) -> () ){
        
        print(self.login["username"])
    
    var query  = [String:String]();
    // Login Information
        query["username"] = (self.login["username"]) ;
        print(query["username"])

    query["password"] = (self.login["password"]) ;
    // Sales Information
    query["ccnumber"] = (ccnumber) ;
    query["ccexp"] = (ccexp) ;
    query["amount"] = (amount.description) ;
    query["cvv"] = (cvv) ;
    // Order Information
    query["ipaddress"] = (self.order["ipaddress"]) ;
    query["orderid"] = (self.order["orderid"]) ;
    query["orderdescription"] = (self.order["orderdescription"]) ;
    query["tax"] = (self.order["tax"]) ;
    query["shipping"] = (self.order["shipping"]) ;
    query["ponumber"] = (self.order["ponumber"]) ;
    // Billing Information
    query["firstname"] = (self.billing["firstname"]) ;
    query["lastname"] = (self.billing["lastname"]) ;
    query["company"] = (self.billing["company"]) ;
    query["address1"] = (self.billing["address1"]) ;
    query["address2"] = (self.billing["address2"]) ;
    query["city"] = (self.billing["city"]) ;
    query["state"] = (self.billing["state"]) ;
    query["zip"] = (self.billing["zip"]) ;
    query["country"] = (self.billing["country"]) ;
    query["phone"] = (self.billing["phone"]) ;
    query["fax"] = (self.billing["fax"]) ;
    query["email"] = (self.billing["email"]) ;
    query["website"] = (self.billing["website"]) ;
    // Shipping Information
    query["shipping_firstname"] = (self.shipping["firstname"]) ;
    query["shipping_lastname"] = (self.shipping["lastname"]) ;
    query["shipping_company"] = (self.shipping["company"]) ;
    query["shipping_address1"] = (self.shipping["address1"]) ;
    query["shipping_address2"] = (self.shipping["address2"]) ;
    query["shipping_city"] = (self.shipping["city"]) ;
    query["shipping_state"] = (self.shipping["state"]) ;
    query["shipping_zip"] = (self.shipping["zip"]) ;
    query["shipping_country"] = (self.shipping["country"]) ;
    query["shipping_email"] = (self.shipping["email"]) ;
    query["type"] = "sale";
        
        print("Doing Sale")
        
    self._doPost(query: query, with: { (result) in
       
        print("results received")
        
        completion(result);
        
        })
    }
    
    func doAuth(amount:Double, ccnumber:String, ccexp:String, cvv:String, with completion:@escaping (String) -> () ){
    
    var query  = [String:String]();
    // Login Information
    query["username"] = (self.login["username"]) ;
    query["password"] = (self.login["password"]) ;
    // Sales Information
    query["ccnumber"] = (ccnumber) ;
    query["ccexp"] = (ccexp) ;
    query["amount"] = (amount.description) ;
    query["cvv"] = (cvv) ;
    // Order Information
    query["ipaddress"] = (self.order["ipaddress"]) ;
    query["orderid"] = (self.order["orderid"]) ;
    query["orderdescription"] = (self.order["orderdescription"]) ;
    query["tax"] = (self.order["tax"]) ;
    query["shipping"] = (self.order["shipping"]) ;
    query["ponumber"] = (self.order["ponumber"]) ;
    // Billing Information
    query["firstname"] = (self.billing["firstname"]) ;
    query["lastname"] = (self.billing["lastname"]) ;
    query["company"] = (self.billing["company"]) ;
    query["address1"] = (self.billing["address1"]) ;
    query["address2"] = (self.billing["address2"]) ;
    query["city"] = (self.billing["city"]) ;
    query["state"] = (self.billing["state"]) ;
    query["zip"] = (self.billing["zip"]) ;
    query["country"] = (self.billing["country"]) ;
    query["phone"] = (self.billing["phone"]) ;
    query["fax"] = (self.billing["fax"]) ;
    query["email"] = (self.billing["email"]) ;
    query["website"] = (self.billing["website"]) ;
    // Shipping Information
    query["shipping_firstname"] = (self.shipping["firstname"]) ;
    query["shipping_lastname"] = (self.shipping["lastname"]) ;
    query["shipping_company"] = (self.shipping["company"]) ;
    query["shipping_address1"] = (self.shipping["address1"]) ;
    query["shipping_address2"] = (self.shipping["address2"]) ;
    query["shipping_city"] = (self.shipping["city"]) ;
    query["shipping_state"] = (self.shipping["state"]) ;
    query["shipping_zip"] = (self.shipping["zip"]) ;
    query["shipping_country"] = (self.shipping["country"]) ;
    query["shipping_email"] = (self.shipping["email"]) ;
    query["type"] = "auth";
    self._doPost(query: query, with: { (result) in
        completion(result);
        })
    }
    
    func doCredit(amount:Double, ccnumber:String, ccexp:String, with completion:@escaping (String) -> () ){
    
    var query  = [String:String]();
    // Login Information
    query["username"] = (self.login["username"]) ;
    query["password"] = (self.login["password"]) ;
    // Sales Information
    query["ccnumber"] = (ccnumber) ;
    query["ccexp"] = (ccexp) ;
    query["amount"] = (amount.description) ;
    // Order Information
    query["ipaddress"] = (self.order["ipaddress"]) ;
    query["orderid"] = (self.order["orderid"]) ;
    query["orderdescription"] = (self.order["orderdescription"]) ;
    query["tax"] = (self.order["tax"]) ;
    query["shipping"] = (self.order["shipping"]) ;
    query["ponumber"] = (self.order["ponumber"]) ;
    // Billing Information
    query["firstname"] = (self.billing["firstname"]) ;
    query["lastname"] = (self.billing["lastname"]) ;
    query["company"] = (self.billing["company"]) ;
    query["address1"] = (self.billing["address1"]) ;
    query["address2"] = (self.billing["address2"]) ;
    query["city"] = (self.billing["city"]) ;
    query["state"] = (self.billing["state"]) ;
    query["zip"] = (self.billing["zip"]) ;
    query["country"] = (self.billing["country"]) ;
    query["phone"] = (self.billing["phone"]) ;
    query["fax"] = (self.billing["fax"]) ;
    query["email"] = (self.billing["email"]) ;
    query["website"] = (self.billing["website"]) ;
    query["type"] = "credit";
    self._doPost(query: query, with: { (result) in
        completion(result);
        })
    }
    
    func doOffline(authorizationcode:String, amount:Double, ccnumber:String, ccexp:String, with completion:@escaping (String) -> () ){
    
    var query  = [String:String]();
    // Login Information
    query["username"] = (self.login["username"]) ;
    query["password"] = (self.login["password"]) ;
    // Sales Information
    query["ccnumber"] = (ccnumber) ;
    query["ccexp"] = (ccexp) ;
    query["amount"] = (amount.description) ;
    query["authorizationcode"] = (authorizationcode) ;
    // Order Information
    query["ipaddress"] = (self.order["ipaddress"]) ;
    query["orderid"] = (self.order["orderid"]) ;
    query["orderdescription"] = (self.order["orderdescription"]) ;
    query["tax"] = (self.order["tax"]) ;
    query["shipping"] = (self.order["shipping"]) ;
    query["ponumber"] = (self.order["ponumber"]) ;
    // Billing Information
    query["firstname"] = (self.billing["firstname"]) ;
    query["lastname"] = (self.billing["lastname"]) ;
    query["company"] = (self.billing["company"]) ;
    query["address1"] = (self.billing["address1"]) ;
    query["address2"] = (self.billing["address2"]) ;
    query["city"] = (self.billing["city"]) ;
    query["state"] = (self.billing["state"]) ;
    query["zip"] = (self.billing["zip"]) ;
    query["country"] = (self.billing["country"]) ;
    query["phone"] = (self.billing["phone"]) ;
    query["fax"] = (self.billing["fax"]) ;
    query["email"] = (self.billing["email"]) ;
    query["website"] = (self.billing["website"]) ;
    // Shipping Information
    query["shipping_firstname"] = (self.shipping["firstname"]) ;
    query["shipping_lastname"] = (self.shipping["lastname"]) ;
    query["shipping_company"] = (self.shipping["company"]) ;
    query["shipping_address1"] = (self.shipping["address1"]) ;
    query["shipping_address2"] = (self.shipping["address2"]) ;
    query["shipping_city"] = (self.shipping["city"]) ;
    query["shipping_state"] = (self.shipping["state"]) ;
    query["shipping_zip"] = (self.shipping["zip"]) ;
    query["shipping_country"] = (self.shipping["country"]) ;
    query["shipping_email"] = (self.shipping["email"]) ;
    query["type"] = "offline";
    return self._doPost(query: query, with: { (result) in
        completion(result);
        })
    }
    
    func doCapture(transactionid:String, amount:Double, with completion:@escaping (String) -> () ){
    
    var query  = [String:String]();
    // Login Information
    query["username"] = (self.login["username"]) ;
    query["password"] = (self.login["password"]) ;
    // Transaction Information
    query["transactionid"] = (transactionid) ;
    if (amount > 0) {
    query["amount"] = (amount.description) ;
    }
    query["type"] = "capture";
    return self._doPost(query: query, with: { (result) in
        completion(result);
        })
    }
    
    func doVoid(transactionid:String, with completion:@escaping (String) -> () ){
    
    var query  = [String:String]();
    // Login Information
    query["username"] = (self.login["username"]) ;
    query["password"] = (self.login["password"]) ;
    // Transaction Information
    query["transactionid"] = (transactionid) ;
    query["type"] = "void";
    return self._doPost(query: query, with: { (result) in
        completion(result);
        })
    }
    
    func doRefund(transactionid:String, amount:Double, with completion:@escaping (String) -> () ){
    
    var query  = [String:String]();
    // Login Information
    query["username"] = (self.login["username"]) ;
    query["password"] = (self.login["password"]) ;
    // Transaction Information
    query["transactionid"] = (transactionid) ;
        if (amount > 0) {
    query["amount"] = amount.description ;
    }
    query["type"] = "refund";
        self._doPost(query: query, with: { (result) in
            completion(result);
        })
    }
    
    
    func _doPost(query:[String:String], with completion:@escaping (String) -> () ){
        print("Posting to NMI server")
        
        print(query)
        
        let headers:HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
        //url request to woocommerce API to see if we have stock
        Alamofire.request("https://secure.networkmerchants.com/api/transact.php", method: .post, parameters: query, headers: headers).responseString(completionHandler: { (response:DataResponse<String>) in
            
            print(response.result)
            
            if let data = response.result.value{
                print(data)
                completion(data);
            }
            else{
                print("Error - No Response From Server")
                completion("Error - No Response From Server");
            }
        })
        
    }
    
 
    
    
    
    
}
