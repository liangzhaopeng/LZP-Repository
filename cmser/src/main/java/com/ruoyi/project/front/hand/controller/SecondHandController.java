package com.ruoyi.project.front.hand.controller;

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
import com.ruoyi.project.front.hand.domain.SecondHand;
import com.ruoyi.project.front.hand.service.ISecondHandService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * second hand exchangeController
 *
 * @author lzp
 * @date 2022-07-23
 */
@Controller
@RequestMapping("/front/hand")
public class SecondHandController extends BaseController {
    private String prefix = "front/hand";

    @Autowired
    private ISecondHandService secondHandService;

    @RequiresPermissions("front:hand:view")
    @GetMapping()
    public String hand() {
        return prefix + "/hand";
    }

    /**
     * 查询second hand exchange列表
     */
    @RequiresPermissions("front:hand:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SecondHand secondHand) {
        startPage();
        List<SecondHand> list = secondHandService.selectSecondHandList(secondHand);
        return getDataTable(list);
    }

    /**
     * 图片列表页
     *
     * @return
     */
    @GetMapping("/image/{id}")
    public String imageList(@PathVariable("id") Long id, ModelMap map) {
        map.put("id", id);
        map.put("imageType", 2);
        return "front/image/image";
    }

    /**
     * 导出second hand exchange列表
     */
    @RequiresPermissions("front:hand:export")
    @Log(title = "second hand exchange", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SecondHand secondHand) {
        List<SecondHand> list = secondHandService.selectSecondHandList(secondHand);
        ExcelUtil<SecondHand> util = new ExcelUtil<SecondHand>(SecondHand.class);
        return util.exportExcel(list, "second hand exchange数据");
    }

    /**
     * 新增second hand exchange
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存second hand exchange
     */
    @RequiresPermissions("front:hand:add")
    @Log(title = "second hand exchange", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SecondHand secondHand) {
        return toAjax(secondHandService.insertSecondHand(secondHand));
    }

    /**
     * 修改second hand exchange
     */
    @RequiresPermissions("front:hand:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        SecondHand secondHand = secondHandService.selectSecondHandById(id);
        mMap.put("secondHand", secondHand);
        return prefix + "/edit";
    }

    /**
     * 修改保存second hand exchange
     */
    @RequiresPermissions("front:hand:edit")
    @Log(title = "second hand exchange", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SecondHand secondHand) {
        return toAjax(secondHandService.updateSecondHand(secondHand));
    }

    /**
     * 删除second hand exchange
     */
    @RequiresPermissions("front:hand:remove")
    @Log(title = "second hand exchange", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(secondHandService.deleteSecondHandByIds(ids));
    }
}
