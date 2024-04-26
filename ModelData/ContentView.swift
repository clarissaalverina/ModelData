//
//  ContentView.swift
//  ModelData
//
//  Created by Clarissa Alverina on 16/04/24.
//

import SwiftUI

//Data Model
struct ProductModel : Identifiable {
    let id: Int
    let namaProduk: String
    let fotoProduk: String
    let hargaProduk: Int
    let lokasi: String
    let ratingCount: Int
    let jumlahRating: Int
    
    init(id: Int, namaProduk: String, fotoProduk: String, hargaProduk: Int, lokasi: String, ratingCount: Int, jumlahRating: Int) {
        self.id = id
        self.namaProduk = namaProduk
        self.fotoProduk = fotoProduk
        self.hargaProduk = hargaProduk
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}

struct ContentView: View {
    
    let data : [ProductModel] = [
        ProductModel(id: 1, namaProduk: "Kucing 1", fotoProduk: "220325case013", hargaProduk: 3500000, lokasi: "Tangerang", ratingCount: 5, jumlahRating: 1),
        ProductModel(id: 2, namaProduk: "Kucing 2", fotoProduk: "GettyImages-1140917170-727bc42801da47c4ace4eb34940d2120", hargaProduk: 4000000, lokasi: "Jakarta", ratingCount: 4, jumlahRating: 1),
        ProductModel(id: 3, namaProduk: "Kucing 3", fotoProduk: "image-53920-800", hargaProduk: 2500000, lokasi: "Bandung", ratingCount: 3, jumlahRating: 1),
        ProductModel(id: 4, namaProduk: "Kucing 4", fotoProduk: "beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026", hargaProduk: 3000000, lokasi: "Bogor", ratingCount: 5, jumlahRating: 1),
        ProductModel(id: 5, namaProduk: "Kucing 5,", fotoProduk: "environmental-enrichment-for-cats", hargaProduk: 5000000, lokasi: "Bogor", ratingCount: 4, jumlahRating: 1)
    ]
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach (data) { row in
                    VStack (spacing:10){
                        Product (data: row)
                    }
                    .padding()
                }
            }
            .navigationTitle("Kucing")
        }
    }
}

#Preview {
    ContentView()
}


struct Product : View {
    let data: ProductModel
    
    var body : some View {
        VStack(alignment:.leading){
            
            ZStack(alignment:.topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height:200)
                    .clipped()
                
                Button(action: {print("OK")}) {
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            
            Text(self.data.namaProduk).font(.title)
                .fontWeight(.medium)
                .padding(.leading)
                .padding(.trailing)
            
            
            Text("Rp. \(self.data.hargaProduk)").font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.orange)
                .padding([.leading, .bottom])
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack{
                    ForEach(0..<self.data.ratingCount) {
                        items in
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)

            Button(action: {print()}) {
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "cart")
                        Text("Add to cart")
                            .font(.callout)
                            .padding()
                        
                    }
                    Spacer()
                }
            }
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding()
        }
        .background(Color("warna"))
        .cornerRadius(15)
        
    }
}
