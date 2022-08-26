package com.ruoyi.project.front.image.service;

import java.util.List;

import com.ruoyi.project.front.image.domain.ImageInformation;

/**
 * image informationService接口
 *
 * @author lzp
 * @date 2022-07-27
 */
public interface IImageInformationService {
    /**
     * 查询image information
     *
     * @param id image information主键
     * @return image information
     */
    public ImageInformation selectImageInformationById(Long id);

    /**
     * 查询image information列表
     *
     * @param imageInformation image information
     * @return image information集合
     */
    public List<ImageInformation> selectImageInformationList(ImageInformation imageInformation);

    /**
     * 新增image information
     *
     * @param imageInformation image information
     * @return 结果
     */
    public int insertImageInformation(ImageInformation imageInformation);

    /**
     * 修改image information
     *
     * @param imageInformation image information
     * @return 结果
     */
    public int updateImageInformation(ImageInformation imageInformation);

    /**
     * 批量删除image information
     *
     * @param ids 需要删除的image information主键集合
     * @return 结果
     */
    public int deleteImageInformationByIds(String ids);

    /**
     * 删除image information信息
     *
     * @param id image information主键
     * @return 结果
     */
    public int deleteImageInformationById(Long id);
}
