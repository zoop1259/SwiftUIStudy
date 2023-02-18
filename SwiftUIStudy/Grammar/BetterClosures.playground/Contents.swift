import UIKit

struct Company {
  let name: String
  let isPublic: Bool
  let stockPrice: Int
  
  var shouldSave: Bool {
    if isPublic {
      false
    }
    
    if stockPrice > 1000 {
      return true
    }
    
    return false
  }
}

let companies: [Company] = [
  Company(name: "Apple", isPublic: true, stockPrice: 140),
  Company(name: "Facebook", isPublic: true, stockPrice: 12),
  Company(name: "Fake", isPublic: false, stockPrice: 333),
  Company(name: "Fake2", isPublic: false, stockPrice: 1200),
  Company(name: "Google", isPublic: true, stockPrice: 222)

]

func demo() {
  let publicCompanies = companies.filter( { company in //근데 이렇게 써본적은 없다..
    company.isPublic
  }).compactMap { company in
    company.name
  }
  
  print("demo : ",publicCompanies)
}

demo()

func demo2() {
  let publicCompanies = companies.filter(\.isPublic).map(\.name) //코드가 매우 줄어듦.
  
  print("demo2 : ",publicCompanies)
}

demo2()

func demo3() {
  let publicCompanies = companies.filter(\.shouldSave).map(\.name)
  
  print("demo3 : ",publicCompanies)
}

demo3()


