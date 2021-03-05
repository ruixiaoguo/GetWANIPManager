//
//  GetWANIPManager.h
//  GetWANIP
//
//  Created by grx on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetWANIPManager : NSObject

+(GetWANIPManager *)share;
-(NSString *)getWANIPAddress;
@end

NS_ASSUME_NONNULL_END
