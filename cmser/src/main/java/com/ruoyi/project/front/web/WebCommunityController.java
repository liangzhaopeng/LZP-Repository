package com.ruoyi.project.front.web;

import cn.jpush.api.push.PushResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.utils.PushUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.service.DictService;
import com.ruoyi.project.front.banner.domain.BannerImage;
import com.ruoyi.project.front.banner.service.IBannerImageService;
import com.ruoyi.project.front.collection.domain.SecondHandCollection;
import com.ruoyi.project.front.collection.service.ISecondHandCollectionService;
import com.ruoyi.project.front.comment.domain.SecondHandComment;
import com.ruoyi.project.front.comment.service.ISecondHandCommentService;
import com.ruoyi.project.front.hand.domain.SecondHand;
import com.ruoyi.project.front.hand.service.ISecondHandService;
import com.ruoyi.project.front.household.domain.HouseholdManagement;
import com.ruoyi.project.front.household.service.IHouseholdManagementService;
import com.ruoyi.project.front.image.domain.ImageInformation;
import com.ruoyi.project.front.image.service.IImageInformationService;
import com.ruoyi.project.front.introduction.domain.CommunityIntroduction;
import com.ruoyi.project.front.introduction.service.ICommunityIntroductionService;
import com.ruoyi.project.front.menu.domain.MenuInformation;
import com.ruoyi.project.front.menu.service.IMenuInformationService;
import com.ruoyi.project.front.order.domain.MenuOrder;
import com.ruoyi.project.front.order.service.IMenuOrderService;
import com.ruoyi.project.front.push.domain.UserPush;
import com.ruoyi.project.front.push.service.IUserPushService;
import com.ruoyi.project.front.user.domain.FrontUser;
import com.ruoyi.project.front.user.service.IFrontUserService;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.print.Doc;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 社区服务网络接口
 */
@Controller
@RequestMapping("/web/community")
public class WebCommunityController extends BaseController {

    @Autowired
    private ISecondHandCollectionService collectionService;

    @Autowired
    private ISecondHandCommentService commentService;

    @Autowired
    private IFrontUserService userService;

    @Autowired
    private IMenuInformationService menuInformationService;

    @Autowired
    private IMenuOrderService orderService;

    @Autowired
    private IFrontUserService frontUserService;

    @Autowired
    private DictService dictService;

    @Autowired
    private IHouseholdManagementService householdManagementService;

    @Autowired
    private ICommunityIntroductionService communityIntroductionService;

    @Autowired
    private ISecondHandService secondHandService;

    @Autowired
    private IBannerImageService bannerImageService;

    @Autowired
    private IImageInformationService imageInformationService;

    @Autowired
    private IUserPushService userPushService;


    /**
     * 获取用户和推送信息
     *
     * @param userPush
     * @return
     */
    @PostMapping("/userPush/list")
    @ResponseBody
    public AjaxResult userPushList(@RequestBody UserPush userPush) {
        List<UserPush> list = userPushService.selectUserPushList(userPush);
        return AjaxResult.success(list);
    }

    /**
     * 获取app 推送
     *
     * @param userPush
     * @return
     */
    @PostMapping("/userPush/add")
    @ResponseBody
    public AjaxResult userPushAdd(@RequestBody UserPush userPush) {
        FrontUser user = frontUserService.selectFrontUserById(userPush.getUserId());
        if(user!= null && user.getRegistrationId() != null ){
            Map<String, String> param = new HashMap<>();
            param.put("msg",userPush.getContent());
            param.put("id",user.getRegistrationId());
            PushResult pu = PushUtil.jpushAndroidUser(param);
            return toAjax(userPushService.insertUserPush(userPush));
        }else {
            return error("registrationId defect error");
        }

    }
    /**
     * 更新用户 registrationId
     *
     * @param frontUser
     * @return
     */
    @PostMapping("/frontUser/update")
    @ResponseBody
    public AjaxResult frontUserUpdate(@RequestBody FrontUser frontUser) {
        if (frontUser == null) {
            return error("data error");
        }
        return toAjax(userService.updateFrontUser(frontUser));
    }

    /**
     * 点赞收藏相关
     *
     * @param collection
     * @return
     */
    @PostMapping("/collection/relevant")
    @ResponseBody
    public AjaxResult collectionRelevant(@RequestBody SecondHandCollection collection) {
        return toAjax( collectionService.collectonRelevant(collection));
    }

    /**
     * 点赞统计
     *
     * @param collection
     * @return
     */
    @PostMapping("/collection/sum")
    @ResponseBody
    public AjaxResult collectionSun(@RequestBody SecondHandCollection collection) {
        List<SecondHandCollection> list = collectionService.selectSecondHandCollectionList(collection);
        if(ObjectUtils.isEmpty(list)){
            return AjaxResult.success(0);
        }else {
            return AjaxResult.success(list.size());
        }
    }
    /**
     * 收藏列表
     *
     * @param collection
     * @return
     */
    @PostMapping("/collection/list")
    @ResponseBody
    public AjaxResult collectionList(@RequestBody SecondHandCollection collection) {
        List<SecondHandCollection> list = collectionService.selectSecondHandCollectionList(collection);
        if(ObjectUtils.isNotEmpty(list)){
            List<String> secondHandIdList = new ArrayList<>();
            for(SecondHandCollection data : list){
                secondHandIdList.add(String.valueOf(data.getSecondHandId()));
            }
            SecondHand secondHand = new SecondHand();
            secondHand.setIds(secondHandIdList);
            List<SecondHand> secondHandList = secondHandService.selectSecondHandList(secondHand);
            for (SecondHand item : secondHandList) {
                // 获取图片列表
                ImageInformation imageParam = new ImageInformation();
                imageParam.setInformationId(item.getId());
                imageParam.setImageType(2);
                List<ImageInformation> imageInformationList = imageInformationService.selectImageInformationList(imageParam);
                List<String> imageList = new ArrayList<>();
                if (CollectionUtils.isNotEmpty(imageInformationList)) {
                    for (ImageInformation image : imageInformationList) {
                        imageList.add(image.getImageUrl());
                    }
                }
                item.setImageList(imageList);
            }
            return AjaxResult.success(secondHandList);
        }

        return AjaxResult.success();
    }




    /**
     * 评论
     *
     * @param comment
     * @return
     */
    @PostMapping("/comment/add")
    @ResponseBody
    public AjaxResult commentAdd(@RequestBody SecondHandComment comment ) {
        return toAjax(commentService.insertSecondHandComment(comment));
    }


    /**
     * 查询评论数量
     *
     * @param comment
     * @return
     */
    @PostMapping("/comment/sum")
    @ResponseBody
    public AjaxResult commentSum(@RequestBody SecondHandComment comment) {
        List<SecondHandComment> list =commentService.selectSecondHandCommentList(comment);
        if(ObjectUtils.isEmpty(list)){
            return AjaxResult.success(0);
        }
        return AjaxResult.success(list.size());
    }

    /**
     * 评论列表
     *
     * @param comment
     * @return
     */
    @PostMapping("/comment/list")
    @ResponseBody
    public AjaxResult commentList( @RequestBody SecondHandComment comment) {
        PageHelper.startPage(comment.getCurrentPage(),comment.getPageSize());
        List<SecondHandComment> pList = commentService.selectSecondHandCommentList(comment);
        if(ObjectUtils.isNotEmpty(pList)){
            //数据量小 就先这么处理了
            for(SecondHandComment data :pList ){
                SecondHandComment handComment = new SecondHandComment();
                handComment.setpId(data.getId());
                List<SecondHandComment> list = commentService.selectSecondHandCommentList(handComment);
                data.setCommentList(list);
            }
        }
        PageInfo<SecondHandComment> pageInfo = new PageInfo<>(pList);
        return  AjaxResult.success(pageInfo);
    }


    /**
     * 前端用户登录
     *
     * @param frontUser
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public AjaxResult login(FrontUser frontUser) {
        if (frontUser == null) {
            return error("Account or password is incorrect");
        }
        String loginName = frontUser.getLoginName();
        String password = frontUser.getPassword();
        if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
            return AjaxResult.error("Account or password is incorrect");
        }
        Long userId = userService.login(loginName, password);
        if (userId == null) {
            return error("Account or password is incorrect");
        }
        return AjaxResult.success("success!", userId);
    }

    /**
     * 前端用户注册
     *
     * @param frontUser
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public AjaxResult register(FrontUser frontUser) {
        if (frontUser == null) {
            return error("Account or password is blank");
        }
        String password = frontUser.getPassword();
        String loginName = frontUser.getLoginName();
        if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
            return AjaxResult.error("Account or password is blank");
        }
        return toAjax(userService.insertFrontUser(frontUser));
    }


    /**
     * 修改用户密码
     *
     * @param userId
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @PostMapping("/modify/password")
    @ResponseBody
    public AjaxResult modifyPassword(Long userId, String oldPassword, String newPassword) {
        if (userId == null || StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword)) {
            return error("modify password failure");
        }
        FrontUser user = frontUserService.selectFrontUserById(userId);
        if (user == null) {
            return error("modify password failure");
        }
        Long login = userService.login(user.getLoginName(), oldPassword);
        if (login == null) {
            return error("modify password failure");
        }
        user.setPassword(newPassword);
        return toAjax(userService.updateFrontUser(user));
    }

    /**
     * 菜单列表信息
     *
     * @return
     */
    @PostMapping("/menu/list")
    @ResponseBody
    public AjaxResult menuList() {
        MenuInformation param = new MenuInformation();
        return AjaxResult.success(menuInformationService.selectMenuInformationList(param));
    }

    /**
     * 创建点菜订单
     *
     * @param order
     * @return
     */
    @PostMapping("/create/order")
    @ResponseBody
    public AjaxResult createOrder(@RequestBody MenuOrder order) {
        if (order == null) {
            return error("order creation failure");
        }
        Long userId = order.getUserId();
        // Long foodId = order.getFoodId();
        if (userId == null) {
            return error("order creation failure");
        }
        FrontUser user = frontUserService.selectFrontUserById(userId);
        if (user == null) {
            return error("order creation failure");
        }
        /*MenuInformation food = menuInformationService.selectMenuInformationById(foodId);
        if (food == null) {
            return error("order creation failure");
        }
        Integer number = order.getFoodNumber();
        if (number == null) {
            number = 1;
            order.setFoodNumber(number);
        }*/
        String userName = order.getUserName();
        if (StringUtils.isBlank(userName)) {
            order.setUserName(user.getLoginName());
        }
        // order.setFoodName(food.getFoodName());
        // 计算订单价格
        /*BigDecimal price = food.getPrice();
        if (price == null) {
            price = BigDecimal.ZERO;
        }
        BigDecimal orderAmount = price.multiply(new BigDecimal(number));
        order.setOrderAmount(orderAmount);*/
        order.setOrderStatus(1);
        return toAjax(orderService.insertMenuOrder(order));
    }

    /**
     * 点菜订单列表
     *
     * @param order
     * @return
     */
    @PostMapping("/order/list")
    @ResponseBody
    public AjaxResult orderList(MenuOrder order) {
        if (order == null) {
            return error("request failure");
        }
        Long userId = order.getUserId();
        if (userId == null) {
            return error("request failure");
        }
        FrontUser user = frontUserService.selectFrontUserById(userId);
        if (user == null) {
            return error("request failure");
        }
        return AjaxResult.success(orderService.selectMenuOrderList(order));
    }

    /**
     * 家政类别列表
     *
     * @return
     */
    @PostMapping("/household/category")
    @ResponseBody
    public AjaxResult householdCategory() {
        return success(dictService.getType("household_category"));
    }

    /**
     * 提交家政服务
     *
     * @param householdManagement
     * @return
     */
    @PostMapping("/household/service")
    @ResponseBody
    public AjaxResult householdService(@RequestBody HouseholdManagement householdManagement) {
        if (householdManagement == null) {
            return error("request failure");
        }
        String householdCategory = householdManagement.getHouseholdCategory();
        if (StringUtils.isBlank(householdCategory)) {
            return error("request failure");
        }
        Long userId = householdManagement.getUserId();
        if (userId == null) {
            return error("request failure");
        }
        FrontUser user = frontUserService.selectFrontUserById(userId);
        if (user == null) {
            return error("request failure");
        }
        BigDecimal householdPrice = householdManagement.getHouseholdPrice();
        if (householdPrice == null) {
            return error("request failure");
        }
        String houseNumber = householdManagement.getHouseNumber();
        if (StringUtils.isBlank(houseNumber)) {
            return error("request failure");
        }
        String userName = householdManagement.getUserName();
        if (StringUtils.isBlank(userName)) {
            householdManagement.setUserName(user.getLoginName());
        }
        householdManagement.setHouseholdStatus(1);
        return toAjax(householdManagementService.insertHouseholdManagement(householdManagement));
    }

    /**
     * 家政服务记录
     *
     * @param userId
     * @return
     */
    @PostMapping("/household/list")
    @ResponseBody
    public AjaxResult householdList(Long userId) {
        if (userId == null) {
            return error("request failure");
        }
        HouseholdManagement param = new HouseholdManagement();
        param.setUserId(userId);
        List<HouseholdManagement> list = householdManagementService.selectHouseholdManagementList(param);
        if (CollectionUtils.isEmpty(list)) {
            return AjaxResult.success(list);
        }
        for (HouseholdManagement item : list) {
            // 设置类别名称
            String category = item.getHouseholdCategory();
            if (StringUtils.isNotBlank(category)) {
                item.setCategoryName(dictService.getLabel("household_category", category));
            }
            // 获取图片列表
            ImageInformation imageParam = new ImageInformation();
            imageParam.setInformationId(item.getId());
            imageParam.setImageType(1);
            List<ImageInformation> imageInformationList = imageInformationService.selectImageInformationList(imageParam);
            List<String> imageList = new ArrayList<>();
            if (CollectionUtils.isEmpty(imageInformationList)) {
                item.setImageList(imageList);
                continue;
            }
            for (ImageInformation image : imageInformationList) {
                imageList.add(image.getImageUrl());
            }
            item.setImageList(imageList);
        }
        return AjaxResult.success(list);
    }

    /**
     * 社区介绍信息
     *
     * @return
     */
    @PostMapping("/community/introduction")
    @ResponseBody
    public AjaxResult communityIntroduction() {
        CommunityIntroduction param = new CommunityIntroduction();
        List<CommunityIntroduction> list = communityIntroductionService.selectCommunityIntroductionList(param);
        if (CollectionUtils.isEmpty(list)) {
            return AjaxResult.success(list);
        }
        String baseUrl = "/web/community/content/";
        for (CommunityIntroduction introduction : list) {
            Long id = introduction.getId();
            introduction.setContentUrl(baseUrl + id);
        }
        return AjaxResult.success(list);
    }

    /**
     * 社区介绍内容
     *
     * @param id
     * @param mMap
     * @return
     */
    @GetMapping("/content/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        CommunityIntroduction communityIntroduction = communityIntroductionService.selectCommunityIntroductionById(id);
        String content = "";
        if (communityIntroduction != null) {
            content = communityIntroduction.getIntroduceContent();
        }
        mMap.put("introduceContent", content);
        return "front/introduction/content";
    }

    /**
     * 二手物品交易
     *
     * @param secondHand
     * @return
     */
    @PostMapping("/second/hand")
    @ResponseBody
    public AjaxResult secondHand(@RequestBody SecondHand secondHand) {
        if (secondHand == null) {
            return error("secondHand request failure");
        }
        Long userId = secondHand.getUserId();
        if (userId == null) {
            return error("secondHand request failure");
        }
        FrontUser user = frontUserService.selectFrontUserById(userId);
        if (user == null) {
            return error("secondHand request failure");
        }
        String userName = secondHand.getUserName();
        if (StringUtils.isBlank(userName)) {
            secondHand.setUserName(user.getLoginName());
        }
        return toAjax(secondHandService.insertSecondHand(secondHand));
    }

    /**
     * 二手物品记录
     *
     * @param userId
     * @return
     */
    @PostMapping("/second/list")
    @ResponseBody
    public AjaxResult secondList(Long userId) {
        SecondHand param = new SecondHand();
        if (userId != null) {
            param.setUserId(userId);
        }
        List<SecondHand> list = secondHandService.selectSecondHandList(param);
        if (CollectionUtils.isEmpty(list)) {
            return AjaxResult.success(list);
        }
        for (SecondHand item : list) {
            // 获取图片列表
            ImageInformation imageParam = new ImageInformation();
            imageParam.setInformationId(item.getId());
            imageParam.setImageType(2);
            List<ImageInformation> imageInformationList = imageInformationService.selectImageInformationList(imageParam);
            List<String> imageList = new ArrayList<>();
            if (CollectionUtils.isNotEmpty(imageInformationList)) {
                for (ImageInformation image : imageInformationList) {
                    imageList.add(image.getImageUrl());
                }
            }
            item.setImageList(imageList);
        }
        return AjaxResult.success(list);
    }

    /**
     * 轮播图片列表
     *
     * @return
     */
    @PostMapping("/banner/list")
    @ResponseBody
    public AjaxResult bannerList() {
        BannerImage param = new BannerImage();
        return AjaxResult.success(bannerImageService.selectBannerImageList(param));
    }
}
