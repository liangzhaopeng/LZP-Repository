package com.ruoyi.project.front.household.controller;

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
import com.ruoyi.project.front.household.domain.HouseholdManagement;
import com.ruoyi.project.front.household.service.IHouseholdManagementService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * household managementController
 *
 * @author lzp
 * @date 2022-07-22
 */
@Controller
@RequestMapping("/front/household")
public class HouseholdManagementController extends BaseController {
    private String prefix = "front/household";

    @Autowired
    private IHouseholdManagementService householdManagementService;

    @RequiresPermissions("front:household:view")
    @GetMapping()
    public String household() {
        return prefix + "/household";
    }

    /**
     * 图片列表页
     *
     * @return
     */
    @GetMapping("/image/{id}")
    public String imageList(@PathVariable("id") Long id, ModelMap map) {
        map.put("id", id);
        map.put("imageType", 1);
        return "front/image/image";
    }

    /**
     * 查询household management列表
     */
    @RequiresPermissions("front:household:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HouseholdManagement householdManagement) {
        startPage();
        List<HouseholdManagement> list = householdManagementService.selectHouseholdManagementList(householdManagement);
        return getDataTable(list);
    }

    /**
     * 导出household management列表
     */
    @RequiresPermissions("front:household:export")
    @Log(title = "household management", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HouseholdManagement householdManagement) {
        List<HouseholdManagement> list = householdManagementService.selectHouseholdManagementList(householdManagement);
        ExcelUtil<HouseholdManagement> util = new ExcelUtil<>(HouseholdManagement.class);
        return util.exportExcel(list, "household management数据");
    }

    /**
     * 新增household management
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存household management
     */
    @RequiresPermissions("front:household:add")
    @Log(title = "household management", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HouseholdManagement householdManagement) {
        return toAjax(householdManagementService.insertHouseholdManagement(householdManagement));
    }

    /**
     * 修改household management
     */
    @RequiresPermissions("front:household:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        HouseholdManagement householdManagement = householdManagementService.selectHouseholdManagementById(id);
        mMap.put("householdManagement", householdManagement);
        return prefix + "/edit";
    }

    /**
     * 修改保存household management
     */
    @RequiresPermissions("front:household:edit")
    @Log(title = "household management", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HouseholdManagement householdManagement) {
        return toAjax(householdManagementService.updateHouseholdManagement(householdManagement));
    }

    /**
     * 删除household management
     */
    @RequiresPermissions("front:household:remove")
    @Log(title = "household management", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(householdManagementService.deleteHouseholdManagementByIds(ids));
    }
}
