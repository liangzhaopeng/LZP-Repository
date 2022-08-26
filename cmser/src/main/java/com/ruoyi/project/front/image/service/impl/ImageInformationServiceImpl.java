package com.ruoyi.project.front.image.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.image.mapper.ImageInformationMapper;
import com.ruoyi.project.front.image.domain.ImageInformation;
import com.ruoyi.project.front.image.service.IImageInformationService;
import com.ruoyi.common.utils.text.Convert;

/**
 * image informationService业务层处理
 *
 * @author lzp
 * @date 2022-07-27
 */
@Service
public class ImageInformationServiceImpl implements IImageInformationService {
    @Autowired
    private ImageInformationMapper imageInformationMapper;

    /**
     * 查询image information
     *
     * @param id image information主键
     * @return image information
     */
    @Override
    public ImageInformation selectImageInformationById(Long id) {
        return imageInformationMapper.selectImageInformationById(id);
    }

    /**
     * 查询image information列表
     *
     * @param imageInformation image information
     * @return image information
     */
    @Override
    public List<ImageInformation> selectImageInformationList(ImageInformation imageInformation) {
        return imageInformationMapper.selectImageInformationList(imageInformation);
    }

    /**
     * 新增image information
     *
     * @param imageInformation image information
     * @return 结果
     */
    @Override
    public int insertImageInformation(ImageInformation imageInformation) {
        imageInformation.setCreateTime(DateUtils.getNowDate());
        return imageInformationMapper.insertImageInformation(imageInformation);
    }

    /**
     * 修改image information
     *
     * @param imageInformation image information
     * @return 结果
     */
    @Override
    public int updateImageInformation(ImageInformation imageInformation) {
        imageInformation.setUpdateTime(DateUtils.getNowDate());
        return imageInformationMapper.updateImageInformation(imageInformation);
    }

    /**
     * 批量删除image information
     *
     * @param ids 需要删除的image information主键
     * @return 结果
     */
    @Override
    public int deleteImageInformationByIds(String ids) {
        return imageInformationMapper.deleteImageInformationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除image information信息
     *
     * @param id image information主键
     * @return 结果
     */
    @Override
    public int deleteImageInformationById(Long id) {
        return imageInformationMapper.deleteImageInformationById(id);
    }
}
