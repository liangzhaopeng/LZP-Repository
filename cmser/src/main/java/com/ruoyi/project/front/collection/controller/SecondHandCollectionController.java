package com.ruoyi.project.front.collection.controller;

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
import com.ruoyi.project.front.collection.domain.SecondHandCollection;
import com.ruoyi.project.front.collection.service.ISecondHandCollectionService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * second_hand_collectionController
 * 
 * @author lzp
 * @date 2022-08-11
 */
@Controller
@RequestMapping("/front/collection")
public class SecondHandCollectionController extends BaseController
{
    private String prefix = "front/collection";

    @Autowired
    private ISecondHandCollectionService secondHandCollectionService;

    @RequiresPermissions("front:collection:view")
    @GetMapping()
    public String collection()
    {
        return prefix + "/collection";
    }

    /**
     * 查询second_hand_collection列表
     */
    @RequiresPermissions("front:collection:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SecondHandCollection secondHandCollection)
    {
        startPage();
        List<SecondHandCollection> list = secondHandCollectionService.selectSecondHandCollectionList(secondHandCollection);
        return getDataTable(list);
    }

    /**
     * 导出second_hand_collection列表
     */
    @RequiresPermissions("front:collection:export")
    @Log(title = "second_hand_collection", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SecondHandCollection secondHandCollection)
    {
        List<SecondHandCollection> list = secondHandCollectionService.selectSecondHandCollectionList(secondHandCollection);
        ExcelUtil<SecondHandCollection> util = new ExcelUtil<SecondHandCollection>(SecondHandCollection.class);
        return util.exportExcel(list, "second_hand_collection数据");
    }

    /**
     * 新增second_hand_collection
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存second_hand_collection
     */
    @RequiresPermissions("front:collection:add")
    @Log(title = "second_hand_collection", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SecondHandCollection secondHandCollection)
    {
        return toAjax(secondHandCollectionService.insertSecondHandCollection(secondHandCollection));
    }

    /**
     * 修改second_hand_collection
     */
    @RequiresPermissions("front:collection:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap)
    {
        SecondHandCollection secondHandCollection = secondHandCollectionService.selectSecondHandCollectionById(id);
        mMap.put("secondHandCollection", secondHandCollection);
        return prefix + "/edit";
    }

    /**
     * 修改保存second_hand_collection
     */
    @RequiresPermissions("front:collection:edit")
    @Log(title = "second_hand_collection", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SecondHandCollection secondHandCollection)
    {
        return toAjax(secondHandCollectionService.updateSecondHandCollection(secondHandCollection));
    }

    /**
     * 删除second_hand_collection
     */
    @RequiresPermissions("front:collection:remove")
    @Log(title = "second_hand_collection", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(secondHandCollectionService.deleteSecondHandCollectionByIds(ids));
    }
}
