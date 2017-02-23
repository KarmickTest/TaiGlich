//
//  User.m
//  DarAlkitab
//
//  Created by Sayanta Bhowmick on 28/03/16.
//
//

#import "User.h"

static User *user=nil;

@implementation User

-(id) init
{
    // always call "super" init
    // Apple recommends to re-assign "self" with the "super" return value
    if(user==nil)
    {
        if( (self=[super init])) {
            user.user_ID = @"";
            user.userDeviceID = @"";
            user.userEmailID = @"";
            user.userSocialID = @"";
            user.userFirstName = @"";
            user.userLastName = @"";
            user.userLatitude = @"";
            user.userLongitude = @"";
            user.userName = @"";
            user.userPassword = @"";
            user.userType = @"";
            user.userImageUrl = @"";
            user.userAddress = @"";
            user.userDOB = @"";
            user.userGender = @"";
            user.userPhoneNo = @"";
        }
        ////NSLog(@"This is allocated");
        user=self;
        return  self;
    }
    return user;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:_user_ID forKey:@"user_ID"];
    [encoder encodeObject:_userDeviceID forKey:@"userDeviceID"];
    [encoder encodeObject:_userEmailID forKey:@"userEmailID"];
    [encoder encodeObject:_userSocialID forKey:@"userSocialID"];
    [encoder encodeObject:_userFirstName forKey:@"userFirstName"];
    [encoder encodeObject:_userLastName forKey:@"userLastName"];
    [encoder encodeObject:_userLatitude forKey:@"userLatitude"];
    [encoder encodeObject:_userLongitude forKey:@"userLongitude"];
    [encoder encodeObject:_userName forKey:@"userName"];
    [encoder encodeObject:_userPassword forKey:@"userPassword"];
    [encoder encodeObject:_userType forKey:@"userType"];
    [encoder encodeObject:_userImageUrl forKey:@"userImageUrl"];
    [encoder encodeObject:_userAddress forKey:@"userAddress"];
    [encoder encodeObject:_userDOB forKey:@"userDOB"];
    [encoder encodeObject:_userGender forKey:@"userGender"];
    [encoder encodeObject:_userPhoneNo forKey:@"userPhoneNo"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        _user_ID = [decoder decodeObjectForKey:@"user_ID"];
        _userDeviceID = [decoder decodeObjectForKey:@"userDeviceID"];
        _userEmailID = [decoder decodeObjectForKey:@"userEmailID"];
        _userSocialID = [decoder decodeObjectForKey:@"userSocialID"];
        _userFirstName = [decoder decodeObjectForKey:@"userFirstName"];
        _userLastName = [decoder decodeObjectForKey:@"userLastName"];
        _userLatitude = [decoder decodeObjectForKey:@"userLatitude"];
        _userLongitude = [decoder decodeObjectForKey:@"userLongitude"];
        _userName = [decoder decodeObjectForKey:@"userName"];
        _userPassword = [decoder decodeObjectForKey:@"userPassword"];
        _userType = [decoder decodeObjectForKey:@"userType"];
        _userImageUrl = [decoder decodeObjectForKey:@"userImageUrl"];
        _userAddress = [decoder decodeObjectForKey:@"userAddress"];
        _userDOB = [decoder decodeObjectForKey:@"userDOB"];
        _userGender = [decoder decodeObjectForKey:@"userGender"];
        _userPhoneNo = [decoder decodeObjectForKey:@"userPhoneNo"];
    }
    return self;
}

@end
