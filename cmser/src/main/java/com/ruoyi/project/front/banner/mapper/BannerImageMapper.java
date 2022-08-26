package com.ruoyi.project.front.banner.mapper;

import java.util.List;

import com.ruoyi.project.front.banner.domain.BannerImage;

/**
 * banner imageMapper接口
 *
 * @author lzp
 * @date 2022-07-25
 */
public interface BannerImageMapper {
    /**
     * 查询banner image
     *
     * @param id banner image主键
     * @return banner image
     */
    public BannerImage selectBannerImageById(Long id);

    /**
     * 查询banner image列表
     *
     * @param bannerImage banner image
     * @return banner image集合
     */
    public List<BannerImage> selectBannerImageList(BannerImage bannerImage);

    /**
     * 新增banner image
     *
     * @param bannerImage banner image
     * @return 结果
     */
    public int insertBannerImage(BannerImage bannerImage);

    /**
     * 修改banner image
     *
     * @param bannerImage banner image
     * @return 结果
     */
    public int updateBannerImage(BannerImage bannerImage);

    /**
     * 删除banner image
     *
     * @param id banner image主键
     * @return 结果
     */
    public int deleteBannerImageById(Long id);

    /**
     * 批量删除banner image
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBannerImageByIds(String[] ids);
}
