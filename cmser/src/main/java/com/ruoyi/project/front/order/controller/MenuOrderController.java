package com.ruoyi.project.front.order.controller;

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
import com.ruoyi.project.front.order.domain.MenuOrder;
import com.ruoyi.project.front.order.service.IMenuOrderService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * menu orderController
 *
 * @author lzp
 * @date 2022-07-22
 */
@Controller
@RequestMapping("/front/order")
public class MenuOrderController extends BaseController {
    private String prefix = "front/order";

    @Autowired
    private IMenuOrderService menuOrderService;

    @RequiresPermissions("front:order:view")
    @GetMapping()
    public String order() {
        return prefix + "/order";
    }

    /**
     * 子订单列表
     *
     * @param id
     * @param map
     * @return
     */
    @GetMapping("/item/{id}")
    public String item(@PathVariable("id") Long id, ModelMap map) {
        map.put("orderId", id);
        return "front/item/item";
    }

    /**
     * 查询menu order列表
     */
    @RequiresPermissions("front:order:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MenuOrder menuOrder) {
        startPage();
        List<MenuOrder> list = menuOrderService.selectMenuOrderList(menuOrder);
        return getDataTable(list);
    }

    /**
     * 导出menu order列表
     */
    @RequiresPermissions("front:order:export")
    @Log(title = "menu order", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MenuOrder menuOrder) {
        List<MenuOrder> list = menuOrderService.selectMenuOrderList(menuOrder);
        ExcelUtil<MenuOrder> util = new ExcelUtil<>(MenuOrder.class);
        return util.exportExcel(list, "menu order数据");
    }

    /**
     * 新增menu order
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存menu order
     */
    @RequiresPermissions("front:order:add")
    @Log(title = "menu order", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MenuOrder menuOrder) {
        return toAjax(menuOrderService.insertMenuOrder(menuOrder));
    }

    /**
     * 修改menu order
     */
    @RequiresPermissions("front:order:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        MenuOrder menuOrder = menuOrderService.selectMenuOrderById(id);
        mMap.put("menuOrder", menuOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存menu order
     */
    @RequiresPermissions("front:order:edit")
    @Log(title = "menu order", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MenuOrder menuOrder) {
        return toAjax(menuOrderService.updateMenuOrder(menuOrder));
    }

    /**
     * 删除menu order
     */
    @RequiresPermissions("front:order:remove")
    @Log(title = "menu order", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(menuOrderService.deleteMenuOrderByIds(ids));
    }
}
