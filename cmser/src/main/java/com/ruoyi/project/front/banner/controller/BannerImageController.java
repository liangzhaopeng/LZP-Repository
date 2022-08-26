package com.ruoyi.project.front.banner.controller;

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
import com.ruoyi.project.front.banner.domain.BannerImage;
import com.ruoyi.project.front.banner.service.IBannerImageService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * banner imageController
 *
 * @author lzp
 * @date 2022-07-25
 */
@Controller
@RequestMapping("/front/banner")
public class BannerImageController extends BaseController {
    private String prefix = "front/banner";

    @Autowired
    private IBannerImageService bannerImageService;

    @RequiresPermissions("front:banner:view")
    @GetMapping()
    public String banner() {
        return prefix + "/banner";
    }

    /**
     * 查询banner image列表
     */
    @RequiresPermissions("front:banner:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BannerImage bannerImage) {
        startPage();
        List<BannerImage> list = bannerImageService.selectBannerImageList(bannerImage);
        return getDataTable(list);
    }

    /**
     * 导出banner image列表
     */
    @RequiresPermissions("front:banner:export")
    @Log(title = "banner image", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BannerImage bannerImage) {
        List<BannerImage> list = bannerImageService.selectBannerImageList(bannerImage);
        ExcelUtil<BannerImage> util = new ExcelUtil<BannerImage>(BannerImage.class);
        return util.exportExcel(list, "banner image数据");
    }

    /**
     * 新增banner image
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存banner image
     */
    @RequiresPermissions("front:banner:add")
    @Log(title = "banner image", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BannerImage bannerImage) {
        return toAjax(bannerImageService.insertBannerImage(bannerImage));
    }

    /**
     * 修改banner image
     */
    @RequiresPermissions("front:banner:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mMap) {
        BannerImage bannerImage = bannerImageService.selectBannerImageById(id);
        mMap.put("bannerImage", bannerImage);
        return prefix + "/edit";
    }

    /**
     * 修改保存banner image
     */
    @RequiresPermissions("front:banner:edit")
    @Log(title = "banner image", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BannerImage bannerImage) {
        return toAjax(bannerImageService.updateBannerImage(bannerImage));
    }

    /**
     * 删除banner image
     */
    @RequiresPermissions("front:banner:remove")
    @Log(title = "banner image", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(bannerImageService.deleteBannerImageByIds(ids));
    }
}
