package com.ruoyi.project.front.comment.controller;

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
import com.ruoyi.project.front.comment.domain.SecondHandComment;
import com.ruoyi.project.front.comment.service.ISecondHandCommentService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * second_hand_commentController
 * 
 * @author lzp
 * @date 2022-08-12
 */
@Controller
@RequestMapping("/front/comment")
public class SecondHandCommentController extends BaseController
{
    private String prefix = "front/comment";

    @Autowired
    private ISecondHandCommentService secondHandCommentService;

    @RequiresPermissions("front:comment:view")
    @GetMapping()
    public String comment()
    {
        return prefix + "/comment";
    }

    /**
     * 查询second_hand_comment列表
     */
    @RequiresPermissions("front:comment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SecondHandComment secondHandComment)
    {
        startPage();
        List<SecondHandComment> list = secondHandCommentService.selectSecondHandCommentList(secondHandComment);
        return getDataTable(list);
    }

    /**
     * 导出second_hand_comment列表
     */
    @RequiresPermissions("front:comment:export")
    @Log(title = "second_hand_comment", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SecondHandComment secondHandComment)
    {
        List<SecondHandComment> list = secondHandCommentService.selectSecondHandCommentList(secondHandComment);
        ExcelUtil<SecondHandComment> util = new ExcelUtil<SecondHandComment>(SecondHandComment.class);
        return util.exportExcel(list, "second_hand_comment数据");
    }

    /**
     * 新增second_hand_comment
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存second_hand_comment
     */
    @RequiresPermissions("front:comment:add")
    @Log(title = "second_hand_comment", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SecondHandComment secondHandComment)
    {
        return toAjax(secondHandCommentService.insertSecondHandComment(secondHandComment));
    }

    /**
     * 修改second_hand_comment
     */
    @RequiresPermissions("front:comment:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap)
    {
        SecondHandComment secondHandComment = secondHandCommentService.selectSecondHandCommentById(id);
        mMap.put("secondHandComment", secondHandComment);
        return prefix + "/edit";
    }

    /**
     * 修改保存second_hand_comment
     */
    @RequiresPermissions("front:comment:edit")
    @Log(title = "second_hand_comment", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SecondHandComment secondHandComment)
    {
        return toAjax(secondHandCommentService.updateSecondHandComment(secondHandComment));
    }

    /**
     * 删除second_hand_comment
     */
    @RequiresPermissions("front:comment:remove")
    @Log(title = "second_hand_comment", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(secondHandCommentService.deleteSecondHandCommentByIds(ids));
    }
}
