

#ifndef hairvii_Constant_h
#define hairvii_Constant_h


 //#define API @"http://demo.hairvii.com/webservice/"
#define API @"http://karmickdev.com/taiglich/webservice/"
//#define API @"http://61.16.241.116/matrix/project/hairvii/webservice/"

#define REGISTRATION @"registration.php"
#define EVENTLISTINGBYDATE  @"eventsListingByDate.php"
#define LOCATIONLISTING  @"locationListing.php"
#define TOWNLISTING @"townListing.php"
#define YIDDISKWEEK @"yiddiskdayweek.php"
#define LOCATIONLISTING @"locationListing.php"
#define CREATEEVENT @"createEvent.php"
#define ADDVERTISEMENTCOUNT @"customers/adv_clickcount"
#define ADDVERTISEMENTIMPRESSION @"customers/adv_impression"
#define BUSINESSES @"customers/businesses"
#define BUSINESSDETAILS @"customers/business_details/"
#define RATE @"customers/rate_business"
#define FAVORITE @"customers/set_unset_favourites/"
#define SHAREAPP @"customers/share_app"
#define FAVORITELIST @"customers/favourite_list/"
#define HAIRTYPE @"customers/hairtypes"
#define HOWITWORKS @"pages/showpage/how-it-works"
#define EDITPROFILE @"customers/edit_profile"
#define FORGOTPASSWORD @"customers/forgot_password"
#define REFERRAL @"customers/add_referral"
#define GOOGLEPLUS @"customers/gpluslogin"
#define GETAVAILABELTIMESLOTS @"customers/get_available_timeslots"
#define SHOWAPPOINMENTTIME @"customers/validate_appotime"
#define APPOINTMENTBOOKING @"customers/appointment_booking"
#define APPOINTMENTLISTING @"customers/appointment_listing"
#define APPOINTMENTCANCELVIEW @"customers/appointment_cancel_view"
#define APPOINTMENTCANCEL @"customers/appointment_cancel"
#define APPOINTMENTVIEW @"customers/appointment_view"
#define APPOINTMENTCOMPLETE @"customers/appointment_complete"

#define BLOG @"customers/autologin"
#define NEARBYSHOPS @"customers/nearby"
#define ALERT_TITLE @"hairvii"
#define ALERT_NOTIFICATION @""

#define BASEURL @"http://karmickdev.com/taiglich/webservice/"
//#define BASEURL @""
#define DebugLog(...) NSLog(__VA_ARGS__)
static NSString * const kClientID =@"1024831568071-b7g559ldi06rvhefujosn8f7nlil25u1.apps.googleusercontent.com";

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RobotoConso @"RobotoCondensed-Regular"
#define Roboto @"Roboto-Regular"
#define MainStory [UIStoryboard storyboardWithName:@"Main" bundle:nil]

#define MAINSTORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#endif
typedef void(^KHJSondataBlock) (NSURLResponse *response, NSError *error,id resopncedata);
//typedef void (^KHDownloadImage)(NSError *error,  *image);
