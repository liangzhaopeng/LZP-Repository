package com.ruoyi.project.front.item.controller;

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
import com.ruoyi.project.front.item.domain.OrderItem;
import com.ruoyi.project.front.item.service.IOrderItemService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * order itemController
 *
 * @author lzp
 * @date 2022-07-28
 */
@Controller
@RequestMapping("/front/item")
public class OrderItemController extends BaseController {
    private String prefix = "front/item";

    @Autowired
    private IOrderItemService orderItemService;

    @RequiresPermissions("front:item:view")
    @GetMapping()
    public String item() {
        return prefix + "/item";
    }

    /**
     * 查询order item列表
     */
    // @RequiresPermissions("front:item:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(OrderItem orderItem) {
        startPage();
        List<OrderItem> list = orderItemService.selectOrderItemList(orderItem);
        return getDataTable(list);
    }

    /**
     * 导出order item列表
     */
    @RequiresPermissions("front:item:export")
    @Log(title = "order item", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(OrderItem orderItem) {
        List<OrderItem> list = orderItemService.selectOrderItemList(orderItem);
        ExcelUtil<OrderItem> util = new ExcelUtil<OrderItem>(OrderItem.class);
        return util.exportExcel(list, "order item数据");
    }

    /**
     * 新增order item
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存order item
     */
    @RequiresPermissions("front:item:add")
    @Log(title = "order item", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(OrderItem orderItem) {
        return toAjax(orderItemService.insertOrderItem(orderItem));
    }

    /**
     * 修改order item
     */
    @RequiresPermissions("front:item:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        OrderItem orderItem = orderItemService.selectOrderItemById(id);
        mMap.put("orderItem", orderItem);
        return prefix + "/edit";
    }

    /**
     * 修改保存order item
     */
    @RequiresPermissions("front:item:edit")
    @Log(title = "order item", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(OrderItem orderItem) {
        return toAjax(orderItemService.updateOrderItem(orderItem));
    }

    /**
     * 删除order item
     */
    @RequiresPermissions("front:item:remove")
    @Log(title = "order item", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(orderItemService.deleteOrderItemByIds(ids));
    }
}
