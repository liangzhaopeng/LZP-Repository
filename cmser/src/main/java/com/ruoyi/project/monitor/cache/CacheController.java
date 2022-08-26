package com.ruoyi.project.monitor.cache;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.service.CacheService;

/**
 * 缓存监控
 *
 * @author lzp
 */
@Controller
@RequestMapping("/monitor/cache")
public class CacheController extends BaseController {
    private String prefix = "monitor/cache";

    @Autowired
    private CacheService cacheService;

    @RequiresPermissions("monitor:cache:view")
    @GetMapping()
    public String cache(ModelMap mMap) {
        mMap.put("cacheNames", cacheService.getCacheNames());
        return prefix + "/cache";
    }

    @RequiresPermissions("monitor:cache:view")
    @PostMapping("/getNames")
    public String getCacheNames(String fragment, ModelMap mMap) {
        mMap.put("cacheNames", cacheService.getCacheNames());
        return prefix + "/cache::" + fragment;
    }

    @RequiresPermissions("monitor:cache:view")
    @PostMapping("/getKeys")
    public String getCacheKeys(String fragment, String cacheName, ModelMap mMap) {
        mMap.put("cacheName", cacheName);
        mMap.put("cacheKyes", cacheService.getCacheKeys(cacheName));
        return prefix + "/cache::" + fragment;
    }

    @RequiresPermissions("monitor:cache:view")
    @PostMapping("/getValue")
    public String getCacheValue(String fragment, String cacheName, String cacheKey, ModelMap mMap) {
        mMap.put("cacheName", cacheName);
        mMap.put("cacheKey", cacheKey);
        mMap.put("cacheValue", cacheService.getCacheValue(cacheName, cacheKey));
        return prefix + "/cache::" + fragment;
    }

    @RequiresPermissions("monitor:cache:view")
    @PostMapping("/clearCacheName")
    @ResponseBody
    public AjaxResult clearCacheName(String cacheName, ModelMap mMap) {
        cacheService.clearCacheName(cacheName);
        return AjaxResult.success();
    }

    @RequiresPermissions("monitor:cache:view")
    @PostMapping("/clearCacheKey")
    @ResponseBody
    public AjaxResult clearCacheKey(String cacheName, String cacheKey, ModelMap mMap) {
        cacheService.clearCacheKey(cacheName, cacheKey);
        return AjaxResult.success();
    }

    @RequiresPermissions("monitor:cache:view")
    @GetMapping("/clearAll")
    @ResponseBody
    public AjaxResult clearAll(ModelMap mMap) {
        cacheService.clearAll();
        return AjaxResult.success();
    }
}
