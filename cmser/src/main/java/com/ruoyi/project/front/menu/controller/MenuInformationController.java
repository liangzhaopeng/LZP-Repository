package com.ruoyi.project.front.menu.controller;

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
import com.ruoyi.project.front.menu.domain.MenuInformation;
import com.ruoyi.project.front.menu.service.IMenuInformationService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * menu informationController
 *
 * @author lzp
 * @date 2022-07-22
 */
@Controller
@RequestMapping("/front/menu")
public class MenuInformationController extends BaseController {
    private String prefix = "front/menu";

    @Autowired
    private IMenuInformationService menuInformationService;

    @RequiresPermissions("front:menu:view")
    @GetMapping()
    public String menu() {
        return prefix + "/menu";
    }

    /**
     * 查询menu information列表
     */
    @RequiresPermissions("front:menu:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MenuInformation menuInformation) {
        startPage();
        List<MenuInformation> list = menuInformationService.selectMenuInformationList(menuInformation);
        return getDataTable(list);
    }

    /**
     * 导出menu information列表
     */
    @RequiresPermissions("front:menu:export")
    @Log(title = "menu information", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MenuInformation menuInformation) {
        List<MenuInformation> list = menuInformationService.selectMenuInformationList(menuInformation);
        ExcelUtil<MenuInformation> util = new ExcelUtil<>(MenuInformation.class);
        return util.exportExcel(list, "menu information数据");
    }

    /**
     * 新增menu information
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存menu information
     */
    @RequiresPermissions("front:menu:add")
    @Log(title = "menu information", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MenuInformation menuInformation) {
        return toAjax(menuInformationService.insertMenuInformation(menuInformation));
    }

    /**
     * 修改menu information
     */
    @RequiresPermissions("front:menu:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        MenuInformation menuInformation = menuInformationService.selectMenuInformationById(id);
        mMap.put("menuInformation", menuInformation);
        return prefix + "/edit";
    }

    /**
     * 修改保存menu information
     */
    @RequiresPermissions("front:menu:edit")
    @Log(title = "menu information", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MenuInformation menuInformation) {
        return toAjax(menuInformationService.updateMenuInformation(menuInformation));
    }

    /**
     * 删除menu information
     */
    @RequiresPermissions("front:menu:remove")
    @Log(title = "menu information", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(menuInformationService.deleteMenuInformationByIds(ids));
    }
}
