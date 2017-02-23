//
//  ServerConnection.h
//  DarAlkitab
//
//  Created by Sayanta Bhowmick on 28/03/16.
//
//

#import <Foundation/Foundation.h>
typedef enum{
    userRegistration = 0,

} Connection;

@protocol ServerConnectionDelegate
@optional
-(void)userRegistration:(id)result;
@end

@interface ServerConnection : NSObject<NSURLConnectionDelegate>{
    Connection mConnection;
}

@property(nonatomic,assign)id <ServerConnectionDelegate> delegate;
@property (retain, nonatomic)NSMutableData *receivedData;

+ (id)sharedManager;
-(void)userRegistration:(NSString *)deviceId deviceToken:(NSString *)_deviceToken name:(NSString *)_name deviceType:(NSString *)_deviceType registrationType:(NSString *)_registrationType language:(NSString *)_language phoneNo:(NSString *)_phoneNo;

@end
//deviceId:”ba2407d9a6ff3e92”,
//deviceToken:”asdbjasd”,
//deviceType:”Android”,
//name:”test”,
//registrationType:”normal”,
//language:”en”,
//phoneNo:”15555215554”
