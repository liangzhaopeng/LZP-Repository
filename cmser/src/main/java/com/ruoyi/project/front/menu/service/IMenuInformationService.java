package com.ruoyi.project.front.menu.service;

import java.util.List;

import com.ruoyi.project.front.menu.domain.MenuInformation;

/**
 * menu informationService接口
 *
 * @author lzp
 * @date 2022-07-22
 */
public interface IMenuInformationService {
    /**
     * 查询menu information
     *
     * @param id menu information主键
     * @return menu information
     */
    public MenuInformation selectMenuInformationById(Long id);

    /**
     * 查询menu information列表
     *
     * @param menuInformation menu information
     * @return menu information集合
     */
    public List<MenuInformation> selectMenuInformationList(MenuInformation menuInformation);

    /**
     * 新增menu information
     *
     * @param menuInformation menu information
     * @return 结果
     */
    public int insertMenuInformation(MenuInformation menuInformation);

    /**
     * 修改menu information
     *
     * @param menuInformation menu information
     * @return 结果
     */
    public int updateMenuInformation(MenuInformation menuInformation);

    /**
     * 批量删除menu information
     *
     * @param ids 需要删除的menu information主键集合
     * @return 结果
     */
    public int deleteMenuInformationByIds(String ids);

    /**
     * 删除menu information信息
     *
     * @param id menu information主键
     * @return 结果
     */
    public int deleteMenuInformationById(Long id);
}
