package com.ruoyi.project.front.household.service;

import java.util.List;

import com.ruoyi.project.front.household.domain.HouseholdManagement;

/**
 * household managementService接口
 *
 * @author lzp
 * @date 2022-07-22
 */
public interface IHouseholdManagementService {
    /**
     * 查询household management
     *
     * @param id household management主键
     * @return household management
     */
    public HouseholdManagement selectHouseholdManagementById(Long id);

    /**
     * 查询household management列表
     *
     * @param householdManagement household management
     * @return household management集合
     */
    public List<HouseholdManagement> selectHouseholdManagementList(HouseholdManagement householdManagement);

    /**
     * 新增household management
     *
     * @param householdManagement household management
     * @return 结果
     */
    public int insertHouseholdManagement(HouseholdManagement householdManagement);

    /**
     * 修改household management
     *
     * @param householdManagement household management
     * @return 结果
     */
    public int updateHouseholdManagement(HouseholdManagement householdManagement);

    /**
     * 批量删除household management
     *
     * @param ids 需要删除的household management主键集合
     * @return 结果
     */
    public int deleteHouseholdManagementByIds(String ids);

    /**
     * 删除household management信息
     *
     * @param id household management主键
     * @return 结果
     */
    public int deleteHouseholdManagementById(Long id);
}
