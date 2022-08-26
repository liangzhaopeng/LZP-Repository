package com.ruoyi.project.front.image.controller;

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
import com.ruoyi.project.front.image.domain.ImageInformation;
import com.ruoyi.project.front.image.service.IImageInformationService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * image informationController
 *
 * @author lzp
 * @date 2022-07-27
 */
@Controller
@RequestMapping("/front/image")
public class ImageInformationController extends BaseController {
    private String prefix = "front/image";

    @Autowired
    private IImageInformationService imageInformationService;

    // @RequiresPermissions("front:image:view")
    @GetMapping()
    public String image() {
        return prefix + "/image";
    }

    /**
     * 查询image information列表
     */
    // @RequiresPermissions("front:image:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ImageInformation imageInformation) {
        startPage();
        List<ImageInformation> list = imageInformationService.selectImageInformationList(imageInformation);
        return getDataTable(list);
    }

    /**
     * 导出image information列表
     */
    @RequiresPermissions("front:image:export")
    @Log(title = "image information", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ImageInformation imageInformation) {
        List<ImageInformation> list = imageInformationService.selectImageInformationList(imageInformation);
        ExcelUtil<ImageInformation> util = new ExcelUtil<ImageInformation>(ImageInformation.class);
        return util.exportExcel(list, "image information数据");
    }

    /**
     * 新增image information
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存image information
     */
    @RequiresPermissions("front:image:add")
    @Log(title = "image information", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ImageInformation imageInformation) {
        return toAjax(imageInformationService.insertImageInformation(imageInformation));
    }

    /**
     * 修改image information
     */
    @RequiresPermissions("front:image:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        ImageInformation imageInformation = imageInformationService.selectImageInformationById(id);
        mMap.put("imageInformation", imageInformation);
        return prefix + "/edit";
    }

    /**
     * 修改保存image information
     */
    @RequiresPermissions("front:image:edit")
    @Log(title = "image information", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ImageInformation imageInformation) {
        return toAjax(imageInformationService.updateImageInformation(imageInformation));
    }

    /**
     * 删除image information
     */
    @RequiresPermissions("front:image:remove")
    @Log(title = "image information", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(imageInformationService.deleteImageInformationByIds(ids));
    }
}
