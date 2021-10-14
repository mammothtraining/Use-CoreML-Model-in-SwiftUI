 
import SwiftUI
import CoreML

struct ContentView: View {
    
    let images = ["cat", "person", "berries",
    "car", "orange", "spider"]
    
    @State private var currentIndex: Int = 0
    
    let model: MobileNetV2 = {
        
        do {
            
            let config = MLModelConfiguration()
            return try MobileNetV2(configuration: config)
            
        } catch {
            
            print(error)
            fatalError("Couldn't create MobileNetV2")
            
        }
    }()
    
    private func classifyImage() {
        
        //let currentImage = images[currentIndex]
        
    }
    
    var body: some View {
        VStack {
            Text("Image Classifier")
                .padding()
            
            Image(images[currentIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button("Next Image >") {
                
                if self.currentIndex < self.images.count - 1 {
                    
                    self.currentIndex = self.currentIndex + 1
                    
                }
                else {
                    self.currentIndex = 0
                    
                }
                 
            }.padding()
            Button("Classify") {
                
                classifyImage()
                
            }
        }
        .font(.system(size: 60))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
