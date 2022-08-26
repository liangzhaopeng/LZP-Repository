package com.ruoyi.project.front.menu.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.menu.mapper.MenuInformationMapper;
import com.ruoyi.project.front.menu.domain.MenuInformation;
import com.ruoyi.project.front.menu.service.IMenuInformationService;
import com.ruoyi.common.utils.text.Convert;

/**
 * menu informationService业务层处理
 *
 * @author lzp
 * @date 2022-07-22
 */
@Service
public class MenuInformationServiceImpl implements IMenuInformationService {
    @Autowired
    private MenuInformationMapper menuInformationMapper;

    /**
     * 查询menu information
     *
     * @param id menu information主键
     * @return menu information
     */
    @Override
    public MenuInformation selectMenuInformationById(Long id) {
        return menuInformationMapper.selectMenuInformationById(id);
    }

    /**
     * 查询menu information列表
     *
     * @param menuInformation menu information
     * @return menu information
     */
    @Override
    public List<MenuInformation> selectMenuInformationList(MenuInformation menuInformation) {
        return menuInformationMapper.selectMenuInformationList(menuInformation);
    }

    /**
     * 新增menu information
     *
     * @param menuInformation menu information
     * @return 结果
     */
    @Override
    public int insertMenuInformation(MenuInformation menuInformation) {
        menuInformation.setCreateTime(DateUtils.getNowDate());
        return menuInformationMapper.insertMenuInformation(menuInformation);
    }

    /**
     * 修改menu information
     *
     * @param menuInformation menu information
     * @return 结果
     */
    @Override
    public int updateMenuInformation(MenuInformation menuInformation) {
        menuInformation.setUpdateTime(DateUtils.getNowDate());
        return menuInformationMapper.updateMenuInformation(menuInformation);
    }

    /**
     * 批量删除menu information
     *
     * @param ids 需要删除的menu information主键
     * @return 结果
     */
    @Override
    public int deleteMenuInformationByIds(String ids) {
        return menuInformationMapper.deleteMenuInformationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除menu information信息
     *
     * @param id menu information主键
     * @return 结果
     */
    @Override
    public int deleteMenuInformationById(Long id) {
        return menuInformationMapper.deleteMenuInformationById(id);
    }
}
