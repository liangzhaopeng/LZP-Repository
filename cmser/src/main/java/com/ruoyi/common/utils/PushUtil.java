package com.ruoyi.common.utils;


import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description 极光推送工具类
 * @Author lc
 * @Date 2019-11-20 上午 11:20
 */
public class PushUtil {

    public static final String APP_KEY = "c108efaf9e6923690031cecf";
    public static final String MASTER_SECRET = "39991500713992d34d57d53f";

    public static void main(String[] args) {
        Map<String, String> param = new HashMap<>();
        param.put("msg","无弹框");
        param.put("id","18071adc03f19f15452");
        PushResult pu = jpushAndroidUser(param);
        System.out.println("pu="+pu.toString());
    }

    /**
     * @param param
     * @return cn.jpush.api.push.PushResult
     * @Description Android
     * @Author lc
     * @Date 2019-11-20 上午 11:34
     **/
    public static PushResult jpushAndroidUser(Map<String, String> param) {
        //创建JPushClient(极光推送的实例)
        JPushClient jpushClient = new JPushClient(MASTER_SECRET, APP_KEY);
        //推送的关键,构造一个payload
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.android())//指定android平台的用户
//                .setAudience(Audience.all())//你项目中的所有用户
                .setAudience(Audience.registrationId(param.get("id")))//registrationId指定用户
//                .setNotification(Notification.android(param.get("msg"), "这是title", param))
                //发送内容
                .setOptions(Options.newBuilder().setApnsProduction(false).build())
                //这里是指定开发环境,不用设置也没关系
                .setMessage(Message.content(param.get("msg")))//自定义信息
                .build();
        PushResult pu = null;
        try {
            pu = jpushClient.sendPush(payload);
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
        return pu;
    }

    /**
     * @param param
     * @return cn.jpush.api.push.PushResult
     * @Description Android
     * @Author lc
     * @Date 2019-11-20 上午 11:34
     **/
    public static PushResult jpushAndroid(Map<String, String> param) {
        //创建JPushClient(极光推送的实例)
        JPushClient jpushClient = new JPushClient(MASTER_SECRET, APP_KEY);
        //推送的关键,构造一个payload
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.android())//指定android平台的用户
                .setAudience(Audience.all())//你项目中的所有用户
                //.setAudience(Audience.registrationId(param.get("id")))//registrationId指定用户
//                .setNotification(Notification.android(param.get("msg"), "这是title", param))
//                .setNotification(Notification.android(param.get("msg"), "这是title", param))
                //发送内容
                .setOptions(Options.newBuilder().setApnsProduction(false).build())
                //这里是指定开发环境,不用设置也没关系
                .setMessage(Message.content(param.get("msg")))//自定义信息
                .build();
        PushResult pu = null;
        try {
            pu = jpushClient.sendPush(payload);
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
        return pu;
    }

    /**
     * @param param
     * @return cn.jpush.api.push.PushResult
     * @Description ios
     * @Author lc
     * @Date 2019-11-20 上午 11:34
     **/
    public static PushResult jpushIOS(Map<String, String> param) {
        //创建JPushClient
        JPushClient jpushClient = new JPushClient(MASTER_SECRET, APP_KEY);
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.ios())//ios平台的用户
                .setAudience(Audience.all())//所有用户
                //.setAudience(Audience.registrationId(param.get("id")))//registrationId指定用户
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder()
                                .setAlert(param.get("msg"))
                                .setBadge(+1)
                                .setSound("happy")//这里是设置提示音(更多可以去官网看看)
                                .addExtras(param)
                                .build())
                        .build())
                .setOptions(Options.newBuilder().setApnsProduction(false).build())
                .setMessage(Message.newBuilder().setMsgContent(param.get("msg")).addExtras(param).build())//自定义信息
                .build();
        PushResult pu = null;
        try {
            pu = jpushClient.sendPush(payload);
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
        return pu;
    }

    /**
     * @param param
     * @return void
     * @Description All所有平台
     * @Author lc
     * @Date 2019-11-20 上午 11:26
     **/
    public static PushResult jpushAll(Map<String, String> param) {
        //创建JPushClient
        JPushClient jpushClient = new JPushClient(MASTER_SECRET, APP_KEY);
        //创建option
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.all())  //所有平台的用户
                .setAudience(Audience.registrationId(param.get("id")))//registrationId指定用户
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder() //发送ios
                                .setAlert(param.get("msg")) //消息体
                                .setBadge(+1)
                                .setSound("happy") //ios提示音
                                .addExtras(param) //附加参数
                                .build())
                        .addPlatformNotification(AndroidNotification.newBuilder() //发送android
                                .addExtras(param) //附加参数
                                .setAlert(param.get("msg")) //消息体
                                .build())
                        .build())
                .setOptions(Options.newBuilder().setApnsProduction(true).build())//指定开发环境 true为生产模式 false 为测试模式 (android不区分模式,ios区分模式)
                .setMessage(Message.newBuilder().setMsgContent(param.get("msg")).addExtras(param).build())//自定义信息
                .build();
        PushResult pu = null;
        try {
            pu = jpushClient.sendPush(payload);
            System.out.println(pu.toString());
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
        return pu;
    }


}