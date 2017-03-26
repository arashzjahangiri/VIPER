//
//  Networking.h
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "NetworkApi.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^NetworkingSuccessBlock)(NSDictionary * responseDict);
typedef void(^NetworkingFailureBlock)(NSError * _Nonnull error);
typedef void(^NetworkingCallBackBlock)(void);


@interface NetworkManager : AFHTTPSessionManager

+ (instancetype)shareManager;

@end

@interface Networking : NSObject

/* get */
+ (void)getWithPath:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(NetworkingSuccessBlock)successBlock
            failure:(NetworkingFailureBlock)failureBlock;

/* post */
+ (void)postWithPath:(NSString *)path
          parameters:(NSDictionary *)parameters
             success:(NetworkingSuccessBlock)successBlock
             failure:(NetworkingFailureBlock)failureBlock;

/* put */
+ (void)putWithPath:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(NetworkingSuccessBlock)successBlock
            failure:(NetworkingFailureBlock)failureBlock
           callBack:(NetworkingCallBackBlock)callBackBlock;

/* delete */
+ (void)deleteWithPath:(NSString *)path
            parameters:(NSDictionary *)parameters
               success:(NetworkingSuccessBlock)successBlock
               failure:(NetworkingFailureBlock)failureBlock
              callBack:(NetworkingCallBackBlock)callBackBlock;

/* 头像 */
+ (void)uploadImageWithPath:(NSString *)path
                 parameters:(NSDictionary *)parameters
                      image:(UIImage *)image
                       name:(NSString *)name
                  imageName:(NSString *)imageName
                  imageType:(NSString *)imageType
                    success:(NetworkingSuccessBlock)successBlock
                    failure:(NetworkingFailureBlock)failureBlock
                   callBack:(NetworkingCallBackBlock)callBackBlock;

/* form data */
+ (void)formDataWithPath:(NSString *)path
              parameters:(NSDictionary *)parameters
                 success:(NetworkingSuccessBlock)successBlock
                 failure:(NetworkingFailureBlock)failureBlock;

NS_ASSUME_NONNULL_END

@end
