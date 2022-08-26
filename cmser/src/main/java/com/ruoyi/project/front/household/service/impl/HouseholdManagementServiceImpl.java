package com.ruoyi.project.front.household.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.front.image.domain.ImageInformation;
import com.ruoyi.project.front.image.service.IImageInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.household.mapper.HouseholdManagementMapper;
import com.ruoyi.project.front.household.domain.HouseholdManagement;
import com.ruoyi.project.front.household.service.IHouseholdManagementService;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

/**
 * household managementService业务层处理
 *
 * @author lzp
 * @date 2022-07-22
 */
@Service
public class HouseholdManagementServiceImpl implements IHouseholdManagementService {

    @Autowired
    private HouseholdManagementMapper householdManagementMapper;

    @Autowired
    private IImageInformationService imageInformationService;

    /**
     * 查询household management
     *
     * @param id household management主键
     * @return household management
     */
    @Override
    public HouseholdManagement selectHouseholdManagementById(Long id) {
        return householdManagementMapper.selectHouseholdManagementById(id);
    }

    /**
     * 查询household management列表
     *
     * @param householdManagement household management
     * @return household management
     */
    @Override
    public List<HouseholdManagement> selectHouseholdManagementList(HouseholdManagement householdManagement) {
        return householdManagementMapper.selectHouseholdManagementList(householdManagement);
    }

    /**
     * 新增household management
     *
     * @param householdManagement household management
     * @return 结果
     */
    @Override
    @Transactional
    public int insertHouseholdManagement(HouseholdManagement householdManagement) {
        if (householdManagement == null) {
            return 0;
        }
        householdManagement.setCreateTime(DateUtils.getNowDate());
        // 保存图片列表
        List<String> imageList = householdManagement.getImageList();
        if (CollectionUtils.isEmpty(imageList)) {
            return householdManagementMapper.insertHouseholdManagement(householdManagement);
        }
        int result = householdManagementMapper.insertHouseholdManagement(householdManagement);
        if (result > 0) {
            Long id = householdManagement.getId();
            for (String image : imageList) {
                ImageInformation imageInformation = new ImageInformation();
                imageInformation.setInformationId(id);
                imageInformation.setImageType(1);
                imageInformation.setImageUrl(image);
                imageInformationService.insertImageInformation(imageInformation);
            }
        }
        return result;
    }

    /**
     * 修改household management
     *
     * @param householdManagement household management
     * @return 结果
     */
    @Override
    public int updateHouseholdManagement(HouseholdManagement householdManagement) {
        householdManagement.setUpdateTime(DateUtils.getNowDate());
        return householdManagementMapper.updateHouseholdManagement(householdManagement);
    }

    /**
     * 批量删除household management
     *
     * @param ids 需要删除的household management主键
     * @return 结果
     */
    @Override
    public int deleteHouseholdManagementByIds(String ids) {
        return householdManagementMapper.deleteHouseholdManagementByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除household management信息
     *
     * @param id household management主键
     * @return 结果
     */
    @Override
    public int deleteHouseholdManagementById(Long id) {
        return householdManagementMapper.deleteHouseholdManagementById(id);
    }
}
