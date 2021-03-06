/* Copyright © 2019 Mastercard. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 =============================================================================*/

#import "MCFEnvironmentConfiguration.h"
#import "MCFCoreConstants+Private.h"

@implementation MCFEnvironmentConfiguration

+ (MCFEnvironmentConfiguration *) sharedInstance {
    static MCFEnvironmentConfiguration *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MCFEnvironmentConfiguration alloc] init];
    });
    return sharedInstance;
}


- (instancetype)init {
    
    if (self = [super init]) {
        _buttonImageHost = @"https://src.mastercard.com/assets/img/btn/src_chk_btn_376x088px.svg";
    }
    
    return self;
}

@end
