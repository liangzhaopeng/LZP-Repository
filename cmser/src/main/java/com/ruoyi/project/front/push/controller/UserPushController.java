package com.ruoyi.project.front.push.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.jpush.api.push.PushResult;
import com.ruoyi.common.utils.PushUtil;
import com.ruoyi.project.front.user.domain.FrontUser;
import com.ruoyi.project.front.user.service.IFrontUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.front.push.domain.UserPush;
import com.ruoyi.project.front.push.service.IUserPushService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * user_pushController
 * 
 * @author lzp
 * @date 2022-08-18
 */
@Controller
@RequestMapping("/front/push")
public class UserPushController extends BaseController
{
    private String prefix = "front/push";

    @Autowired
    private IUserPushService userPushService;
    @Autowired
    private IFrontUserService frontUserService;

    @RequiresPermissions("front:push:view")
    @GetMapping()
    public String push()
    {
        return prefix + "/push";
    }

    /**
     * 查询user_push列表
     */
    @RequiresPermissions("front:push:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserPush userPush)
    {
        startPage();
        userPush.setModular("pc");
        List<UserPush> list = userPushService.selectUserPushList(userPush);
        return getDataTable(list);
    }

    /**
     * 导出user_push列表
     */
    @RequiresPermissions("front:push:export")
    @Log(title = "user_push", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserPush userPush)
    {
        List<UserPush> list = userPushService.selectUserPushList(userPush);
        ExcelUtil<UserPush> util = new ExcelUtil<UserPush>(UserPush.class);
        return util.exportExcel(list, "user_push数据");
    }

    /**
     * 新增user_push
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存user_push
     */
    @RequiresPermissions("front:push:add")
    @Log(title = "user_push", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserPush userPush)
    {
        userPush.setModular("pc");
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
     * 修改user_push
     */
    @RequiresPermissions("front:push:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap)
    {
        UserPush userPush = userPushService.selectUserPushById(id);
        mMap.put("userPush", userPush);
        return prefix + "/edit";
    }

    /**
     * 修改保存user_push
     */
    @RequiresPermissions("front:push:edit")
    @Log(title = "user_push", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserPush userPush)
    {
        return toAjax(userPushService.updateUserPush(userPush));
    }

    /**
     * 删除user_push
     */
    @RequiresPermissions("front:push:remove")
    @Log(title = "user_push", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userPushService.deleteUserPushByIds(ids));
    }
}
