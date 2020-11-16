//
//  APIMacros.h
//  StandardProject-OC
//
//  Created by nucarf on 2020/9/9.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#ifndef APIMacros_h
#define APIMacros_h

#pragma mark --  油站端API --
/*
 测试http://t2api.nucarf.cn
 预发http://rapi.nucarf.cn
 生产https://api.nucarf.net
 */

#define Main_URL_HOST(Url, IntrefaceName) [NSString stringWithFormat:@"%@%@", Url, IntrefaceName]
#define Main_URL(IntrefaceName) [NSString stringWithFormat:@"%@%@", [[EnvironmentManager shareManager] url_head], IntrefaceName]

#pragma mark - 登录相关接口/设置密码/添加员工

#define  GET_AUTH_CODE             @"Sms/sendCaptcha" // 获取验证码 post

#define  USER_LOGIN_CODE           @"StationUser/login" // 验证码登录 post

#define  USER_SET_PASSWORD         @"StationUser/setPassword" // 修改密码

#define  Setting_ADD_EMPLOYEE      @"StationUser/register?" // 添加员工

#pragma mark - 油品价格接口

#define  OIL_PRICE_LIST            @"StationUser/getStationFu" // 获取油价列表和栏目个数

#define  OIL_PRICE_ADD_OIL         @"Fuel/setFuelOne" // 添加油站油价

#define  OIL_PRICE_DELETE_OIL      @"Fuel/delFuelOne" // 删除油站油价

#define  OIL_PRICE_CHANGE_OIL      @"Station/changeFuelPrice" // 修改油站油价

#define  OIL_PRICE_FUEL_LIST       @"Fuel/getFuelList" // 添加油价的油品列表

#define  HOME_USER_INFO            @"StationUser/userInfo" // 首页请求用户信息

#define  HOME_PRICE_CHANGE_OIL     @"Station/newChangeFuelPrice"    // 首页调价 修改油站油价

#define  OIL_RECORD_CHARGE_LIST    @"StationUser/getStationOrder"   // 加油记录 记账列表

#define  OIL_RECORD_CHARGE_FAIL    @"StationUser/getFailOrder"      // 加油记录 交易失败

#define  OIL_RECORD_CHARGE_SUMMARY @"StationUser/getOrderStatis"    // 加油记录 记账汇总

#define  OIL_RECORD_ORDER_INFO     @"Order/getOrderInfo"    // 加油记录 记账详情

#define  OIL_RECORD_ORDER_CANCEL   @"Order/cancelOrder"     // 加油记录 记账详情 撤销订单

#pragma mark - 优惠接口

#define  OIL_DISCOUNT_LIST         @"StationUserDiscount/list"     //会员优惠 优惠列表

#define  OIL_DISCOUNT_ADD          @"StationUserDiscount/add"      //会员优惠 添加优惠

#define  OIL_DISCOUNT_EDIT         @"StationUserDiscount/edit"     //会员优惠 修改优化

#define  OIL_DISCOUNT_DETAIL       @"StationUserDiscount/detail"   //会员优惠 优化详情

#define  OIL_DISCOUNT_ENABLE       @"StationUserDiscount/enable"   //会员优惠 优惠状态修改

#define  OIL_RECORD_ORDER_PRINT    @"Print/sendOrderInfo"           // 加油记录 记账详情 打印小票

#endif /* APIMacros_h */
