
//
//

#import <Foundation/Foundation.h>
//	==================================================== 系统宏 =============================================
#define UserDefaultEntity             [UserDefault currentDefault]

@interface UserDefault : NSObject

@property(nonatomic,strong) NSString* session_id;
@property(nonatomic,strong) NSString* uid;
@property(nonatomic,strong) NSString* zoneCode;
+(UserDefault *)currentDefault;
+(void)saveUserDefault;
//将类objcet存到userDefault里面，对应的key值为strKey
+(BOOL)saveObject:(id)object key:(NSString *)strKey;
//根据key为strKey获取存入的类
+(id)getObject:(NSString *)strKey;

int examine(char* numbers);
void reverse(char * str);
@end
