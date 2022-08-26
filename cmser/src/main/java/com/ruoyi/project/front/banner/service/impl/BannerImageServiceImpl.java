package com.ruoyi.project.front.banner.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.banner.mapper.BannerImageMapper;
import com.ruoyi.project.front.banner.domain.BannerImage;
import com.ruoyi.project.front.banner.service.IBannerImageService;
import com.ruoyi.common.utils.text.Convert;

/**
 * banner imageService业务层处理
 *
 * @author lzp
 * @date 2022-07-25
 */
@Service
public class BannerImageServiceImpl implements IBannerImageService {
    @Autowired
    private BannerImageMapper bannerImageMapper;

    /**
     * 查询banner image
     *
     * @param id banner image主键
     * @return banner image
     */
    @Override
    public BannerImage selectBannerImageById(Long id) {
        return bannerImageMapper.selectBannerImageById(id);
    }

    /**
     * 查询banner image列表
     *
     * @param bannerImage banner image
     * @return banner image
     */
    @Override
    public List<BannerImage> selectBannerImageList(BannerImage bannerImage) {
        return bannerImageMapper.selectBannerImageList(bannerImage);
    }

    /**
     * 新增banner image
     *
     * @param bannerImage banner image
     * @return 结果
     */
    @Override
    public int insertBannerImage(BannerImage bannerImage) {
        bannerImage.setCreateTime(DateUtils.getNowDate());
        return bannerImageMapper.insertBannerImage(bannerImage);
    }

    /**
     * 修改banner image
     *
     * @param bannerImage banner image
     * @return 结果
     */
    @Override
    public int updateBannerImage(BannerImage bannerImage) {
        bannerImage.setUpdateTime(DateUtils.getNowDate());
        return bannerImageMapper.updateBannerImage(bannerImage);
    }

    /**
     * 批量删除banner image
     *
     * @param ids 需要删除的banner image主键
     * @return 结果
     */
    @Override
    public int deleteBannerImageByIds(String ids) {
        return bannerImageMapper.deleteBannerImageByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除banner image信息
     *
     * @param id banner image主键
     * @return 结果
     */
    @Override
    public int deleteBannerImageById(Long id) {
        return bannerImageMapper.deleteBannerImageById(id);
    }
}
