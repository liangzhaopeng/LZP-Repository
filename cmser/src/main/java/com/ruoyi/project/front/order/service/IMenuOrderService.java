package com.ruoyi.project.front.order.service;

import java.util.List;

import com.ruoyi.project.front.order.domain.MenuOrder;

/**
 * menu orderService接口
 *
 * @author lzp
 * @date 2022-07-22
 */
public interface IMenuOrderService {
    /**
     * 查询menu order
     *
     * @param id menu order主键
     * @return menu order
     */
    public MenuOrder selectMenuOrderById(Long id);

    /**
     * 查询menu order列表
     *
     * @param menuOrder menu order
     * @return menu order集合
     */
    public List<MenuOrder> selectMenuOrderList(MenuOrder menuOrder);

    /**
     * 新增menu order
     *
     * @param menuOrder menu order
     * @return 结果
     */
    public int insertMenuOrder(MenuOrder menuOrder);

    /**
     * 修改menu order
     *
     * @param menuOrder menu order
     * @return 结果
     */
    public int updateMenuOrder(MenuOrder menuOrder);

    /**
     * 批量删除menu order
     *
     * @param ids 需要删除的menu order主键集合
     * @return 结果
     */
    public int deleteMenuOrderByIds(String ids);

    /**
     * 删除menu order信息
     *
     * @param id menu order主键
     * @return 结果
     */
    public int deleteMenuOrderById(Long id);
}
