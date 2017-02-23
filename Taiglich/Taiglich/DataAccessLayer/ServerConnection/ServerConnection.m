//
//  ServerConnection.m
//  DarAlkitab
//
//  Created by Sayanta Bhowmick on 28/03/16.
//
//

#import "ServerConnection.h"
#import "Constant.h"
#import "JSON.h"
#import "AppDelegate.h"
@implementation ServerConnection
#pragma mark Singleton Methods

+ (ServerConnection *)sharedManager {
    
    static ServerConnection *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedManager = [[self
                          alloc] init];
    });
    return sharedManager;
}
-(void)userRegistration:(NSString *)deviceId deviceToken:(NSString *)_deviceToken name:(NSString *)_name deviceType:(NSString *)_deviceType registrationType:(NSString *)_registrationType language:(NSString *)_language phoneNo:(NSString *)_phoneNo
{
    mConnection = userRegistration;
    NSString *post = [NSString stringWithFormat:@"deviceId=%@&deviceToken=%@&deviceType=%@&name=%@&registrationType=%@&language=%@&phoneNo=%@",deviceId,_deviceToken,_deviceType,_name,_registrationType,_language,_phoneNo];//&userType=%@
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/registration.php",BASEURL]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    if (connection) {
        _receivedData = [[NSMutableData alloc] init];
    }
}
#pragma mark - Connection Delegates
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receivedData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //NSLog(@"%@",error);
    NSLog(@"%@",error);
    switch (mConnection) {
        case userRegistration:
            [self.delegate userRegistration:error];
            break;
        default:
            break;
    }
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *value=[[NSString alloc]initWithData:_receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",value);
    NSError *myError = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:&myError];
    switch (mConnection) {
        case userRegistration:
            [self.delegate userRegistration:jsonDict];
            break;
        default:
            break;
    }
}


@end
