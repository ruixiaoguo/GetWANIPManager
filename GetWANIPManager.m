//
//  GetWANIPManager.m
//  GetWANIP
//
//  Created by grx on 2021/3/5.
//

#import "GetWANIPManager.h"

@implementation GetWANIPManager
+(GetWANIPManager *)share{
    static GetWANIPManager *info  = nil;
    static dispatch_once_t onece;
    dispatch_once(&onece, ^{
        info = [[GetWANIPManager alloc]init];
    });
    return info;
}

-(NSString *)getWANIPAddress
{
    NSError *error;
    NSURL *ipURL = [NSURL URLWithString:@"http://pv.sohu.com/cityjson?ie=utf-8"];
    
    NSMutableString *ip = [NSMutableString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    //判断返回字符串是否为所需数据
    if ([ip hasPrefix:@"var returnCitySN = "]) {
        //对字符串进行处理，然后进行json解析
        //删除字符串多余字符串
        NSRange range = NSMakeRange(0, 19);
        [ip deleteCharactersInRange:range];
        NSString * nowIp =[ip substringToIndex:ip.length-1];
        //将字符串转换成二进制进行Json解析
        NSData * data = [nowIp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"搜狐===%@",dict);
        return dict[@"cip"] ? dict[@"cip"] : @"";
    }
    return @"";
}
@end
