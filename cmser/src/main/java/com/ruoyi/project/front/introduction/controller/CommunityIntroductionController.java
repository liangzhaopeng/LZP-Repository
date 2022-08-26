package com.ruoyi.project.front.introduction.controller;

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
import com.ruoyi.project.front.introduction.domain.CommunityIntroduction;
import com.ruoyi.project.front.introduction.service.ICommunityIntroductionService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * community introductionController
 *
 * @author lzp
 * @date 2022-07-23
 */
@Controller
@RequestMapping("/front/introduction")
public class CommunityIntroductionController extends BaseController {
    private String prefix = "front/introduction";

    @Autowired
    private ICommunityIntroductionService communityIntroductionService;

    @RequiresPermissions("front:introduction:view")
    @GetMapping()
    public String introduction() {
        return prefix + "/introduction";
    }

    /**
     * 查询community introduction列表
     */
    @RequiresPermissions("front:introduction:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CommunityIntroduction communityIntroduction) {
        startPage();
        List<CommunityIntroduction> list = communityIntroductionService.selectCommunityIntroductionList(communityIntroduction);
        return getDataTable(list);
    }

    /**
     * 导出community introduction列表
     */
    @RequiresPermissions("front:introduction:export")
    @Log(title = "community introduction", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CommunityIntroduction communityIntroduction) {
        List<CommunityIntroduction> list = communityIntroductionService.selectCommunityIntroductionList(communityIntroduction);
        ExcelUtil<CommunityIntroduction> util = new ExcelUtil<>(CommunityIntroduction.class);
        return util.exportExcel(list, "community introduction数据");
    }

    /**
     * 新增community introduction
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存community introduction
     */
    @RequiresPermissions("front:introduction:add")
    @Log(title = "community introduction", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CommunityIntroduction communityIntroduction) {
        return toAjax(communityIntroductionService.insertCommunityIntroduction(communityIntroduction));
    }

    /**
     * 修改community introduction
     */
    @RequiresPermissions("front:introduction:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        CommunityIntroduction communityIntroduction = communityIntroductionService.selectCommunityIntroductionById(id);
        mMap.put("communityIntroduction", communityIntroduction);
        return prefix + "/edit";
    }

    /**
     * 修改保存community introduction
     */
    @RequiresPermissions("front:introduction:edit")
    @Log(title = "community introduction", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CommunityIntroduction communityIntroduction) {
        return toAjax(communityIntroductionService.updateCommunityIntroduction(communityIntroduction));
    }

    /**
     * 删除community introduction
     */
    @RequiresPermissions("front:introduction:remove")
    @Log(title = "community introduction", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(communityIntroductionService.deleteCommunityIntroductionByIds(ids));
    }
}
