//
//  Networking.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "Networking.h"

@implementation NetworkManager

+ (instancetype)shareManager
{
    static NetworkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[NetworkManager alloc] initWithBaseURL:[NSURL URLWithString: [self baseURL]]];
        // Set the request timeout
        manager.requestSerializer.timeoutInterval = 30;
        // The requested data type
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        // Request header type
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        // The data type returned
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", @"application/x-javascript", @"text/plain", @"image/gif", nil];
        
        // AFSecurityPolicy
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return manager;
}

#pragma mark BaseURL
+ (NSString *)baseURL
{
    return BaseURL;
}


@end

@implementation Networking

+ (void)getWithPath:(NSString *)path
         parameters:(NSString *)parameters
            success:(NetworkingSuccessBlock)successBlock
            failure:(NetworkingFailureBlock)failureBlock
{
    NetworkManager * manager = [NetworkManager shareManager];
    [manager GET:path
      parameters:parameters
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         successBlock(responseObject);
     }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        failureBlock(error);
    }];
    
  }

+ (void)postWithPath:(NSString *)path parameters:(NSString *)parameters success:(NetworkingSuccessBlock)successBlock failure:(NetworkingFailureBlock)failureBlock{
//    NSLog(@"Api = %@,parameters = %@", path, parameters);
    NetworkManager * manager = [NetworkManager shareManager];
    [manager POST:path parameters:parameters
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
//         NSLog(@"responseObject = %@",responseObject);
         successBlock(responseObject);
     }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         failureBlock(error);
     }];

}

+(void)putWithPath:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(NetworkingSuccessBlock)successBlock
           failure:(NetworkingFailureBlock)failureBlock
          callBack:(NetworkingCallBackBlock)callBackBlock
{
    NetworkManager * manager = [NetworkManager shareManager];
    [manager PUT:path parameters:parameters
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        successBlock(responseObject);
        callBackBlock();
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        failureBlock(error);
        callBackBlock();
    }];
}

+ (void)deleteWithPath:(NSString *)path
            parameters:(NSDictionary *)parameters
               success:(NetworkingSuccessBlock)successBlock
               failure:(NetworkingFailureBlock)failureBlock
              callBack:(NetworkingCallBackBlock)callBackBlock
{
    NetworkManager * manager = [NetworkManager shareManager];
    [manager DELETE:path parameters:parameters
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         successBlock(responseObject);
         callBackBlock();
     }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         failureBlock(error);
         callBackBlock();
     }];
    
    
    
}


+ (void)uploadImageWithPath:(NSString *)path
                 parameters:(NSDictionary *)parameters
                      image:(UIImage *)image
                       name:(NSString *)name
                  imageName:(NSString *)imageName
                  imageType:(NSString *)imageType
                    success:(NetworkingSuccessBlock)successBlock
                    failure:(NetworkingFailureBlock)failureBlock
                   callBack:(NetworkingCallBackBlock)callBackBlock
{
    NetworkManager * manager = [NetworkManager shareManager];
    [manager POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //  When it is set to 1.0, it will be compressed with the default value (0.6).
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:imageData name:name fileName:imageName mimeType:[NSString stringWithFormat:@"image/%@",imageType]]; // png/jpeg
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
        callBackBlock();
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        callBackBlock();
    }];

}

+ (void)formDataWithPath:(NSString *)path
          parameters:(NSDictionary *)parameters
             success:(NetworkingSuccessBlock)successBlock
             failure:(NetworkingFailureBlock)failureBlock
{
    NetworkManager * manager = [NetworkManager shareManager];
    [manager POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end
