//
//  Connectivity.swift
//  CinemaTime
//
//  Created by Mark Frazier on 7/25/22.
//

import Foundation


// 1
import WatchConnectivity


// final classes are ones that cannot be inherited from
final class Connectivity: NSObject {
  // 2
  static let shared = Connectivity()
// 3
  override private init() {
    super.init()
    // 4
    #if !os(watchOS)
    guard WCSession.isSupported() else {
return
}
#endif
    
    WCSession.default.delegate = self
// 5
    WCSession.default.activate()
  }
  
  public func send(movieIds: [Int]) {
    guard WCSession.default.activationState == .activated else {
  return
  }
    
  }
}

// MARK: - WCSessionDelegate
extension Connectivity: WCSessionDelegate {
  func session(
      _ session: WCSession,
      activationDidCompleteWith activationState:
WCSessionActivationState,
error: Error? ){
}
  
#if os(iOS)
  
  func sessionDidBecomeInactive(_ session: WCSession) {
  }
  func sessionDidDeactivate(_ session: WCSession) {
    // If the person has more than one watch, and they switch,
    // reactivate their session on the new device.
    WCSession.default.activate()
}
#endif
  
}
