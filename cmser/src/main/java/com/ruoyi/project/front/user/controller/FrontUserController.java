package com.ruoyi.project.front.user.controller;

import java.util.List;

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
import com.ruoyi.project.front.user.domain.FrontUser;
import com.ruoyi.project.front.user.service.IFrontUserService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * front userController
 *
 * @author lzp
 * @date 2022-07-21
 */
@Controller
@RequestMapping("/front/user")
public class FrontUserController extends BaseController {
    private String prefix = "front/user";

    @Autowired
    private IFrontUserService frontUserService;

    @RequiresPermissions("front:user:view")
    @GetMapping()
    public String user() {
        return prefix + "/user";
    }

    /**
     * 查询front user列表
     */
    @RequiresPermissions("front:user:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(FrontUser frontUser) {
        startPage();
        List<FrontUser> list = frontUserService.selectFrontUserList(frontUser);
        return getDataTable(list);
    }

    /**
     * 导出front user列表
     */
    @RequiresPermissions("front:user:export")
    @Log(title = "front user", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(FrontUser frontUser) {
        List<FrontUser> list = frontUserService.selectFrontUserList(frontUser);
        ExcelUtil<FrontUser> util = new ExcelUtil<FrontUser>(FrontUser.class);
        return util.exportExcel(list, "front user数据");
    }

    /**
     * 新增front user
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存front user
     */
    @RequiresPermissions("front:user:add")
    @Log(title = "front user", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(FrontUser frontUser) {
        return toAjax(frontUserService.insertFrontUser(frontUser));
    }

    /**
     * 修改front user
     */
    @RequiresPermissions("front:user:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        FrontUser frontUser = frontUserService.selectFrontUserById(id);
        mMap.put("frontUser", frontUser);
        return prefix + "/edit";
    }

    /**
     * 修改保存front user
     */
    @RequiresPermissions("front:user:edit")
    @Log(title = "front user", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(FrontUser frontUser) {
        return toAjax(frontUserService.updateFrontUser(frontUser));
    }

    /**
     * 删除front user
     */
    @RequiresPermissions("front:user:remove")
    @Log(title = "front user", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(frontUserService.deleteFrontUserByIds(ids));
    }


    /**
     * 查询front user列表
     */
//    @RequiresPermissions("front:user:list")
    @GetMapping("/getUserList")
    @ResponseBody
    public AjaxResult list(String name) {
        startPage();
        FrontUser frontUser = new FrontUser();
        frontUser.setLoginName(name);
        List<FrontUser> list = frontUserService.selectFrontUserList(frontUser);
        return AjaxResult.success(list);
    }
}
