# NMIPayments.swift
Swift class for processing NMI Gateway payments


## Getting Started

Import NMIPayments.swift into your Xcode project.

Create transactions using:
```
let nmiPayment = NMIPayments()
nmiPayment.setLogin(username: "demo", password: "password");

nmiPayment.setBilling(firstname: "John",lastname: "Smith",company: "Acme, Inc.",address1: "123 Main St",address2: "Suite 200", city: "Beverly Hills", state: "CA",zip: "90210",country: "US",phone: "555-555-5555",fax: "555-555-5556",email: "support@example.com", website: "www.example.com");

nmiPayment.setShipping(firstname: "Mary",lastname: "Smith",company: "na",address1: "124 Shipping Main St",address2: "Suite Ship", city: "Beverly Hills", state: "CA",zip: "90210",country: "US",email: "support@example.com");

nmiPayment.setOrder(orderid: "1234",orderdescription: "Big Order",tax: "1", shipping: "2", ponumber: "PO1234",ipaddress: "65.192.14.10");

nmiPayment.doSale(amount: 50.00, ccnumber: "4111111111111111", ccexp: "1010", cvv: "123") { (result) in
  print(result)
}

```

### Prerequisites

Import Alamofire:
* [Alamofire](https://github.com/Alamofire/Alamofire) - Networking Framework


## Built With

* [Alamofire](https://github.com/Alamofire/Alamofire) - Networking Framework
* [CocoaPods](https://cocoapods.org) - Dependency Management


## Authors

* **Ernie Lail** - *Initial work* - [MaranathaTech](https://github.com/MaranathaTech)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


