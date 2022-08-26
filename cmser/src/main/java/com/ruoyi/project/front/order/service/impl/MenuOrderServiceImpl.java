package com.ruoyi.project.front.order.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.front.item.domain.OrderItem;
import com.ruoyi.project.front.item.service.IOrderItemService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.order.mapper.MenuOrderMapper;
import com.ruoyi.project.front.order.domain.MenuOrder;
import com.ruoyi.project.front.order.service.IMenuOrderService;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * menu orderService业务层处理
 *
 * @author lzp
 * @date 2022-07-22
 */
@Service
public class MenuOrderServiceImpl implements IMenuOrderService {
    @Autowired
    private MenuOrderMapper menuOrderMapper;

    @Autowired
    private IOrderItemService itemService;

    /**
     * 查询menu order
     *
     * @param id menu order主键
     * @return menu order
     */
    @Override
    public MenuOrder selectMenuOrderById(Long id) {
        return menuOrderMapper.selectMenuOrderById(id);
    }

    /**
     * 查询menu order列表
     *
     * @param menuOrder menu order
     * @return menu order
     */
    @Override
    public List<MenuOrder> selectMenuOrderList(MenuOrder menuOrder) {
        if (menuOrder == null) {
            menuOrder = new MenuOrder();
        }
        List<MenuOrder> orderList = menuOrderMapper.selectMenuOrderList(menuOrder);
        if (CollectionUtils.isEmpty(orderList)) {
            return orderList;
        }
        for (MenuOrder order : orderList) {
            Long orderId = order.getId();
            OrderItem param = new OrderItem();
            param.setOrderId(orderId);
            List<OrderItem> itemList = itemService.selectOrderItemList(param);
            order.setItemList(itemList);
        }
        return orderList;
    }

    /**
     * 新增menu order
     *
     * @param menuOrder menu order
     * @return 结果
     */
    @Override
    @Transactional
    public int insertMenuOrder(MenuOrder menuOrder) {
        if (menuOrder == null) {
            return 0;
        }
        menuOrder.setCreateTime(DateUtils.getNowDate());
        List<OrderItem> itemList = menuOrder.getItemList();
        if (CollectionUtils.isEmpty(itemList)) {
            return menuOrderMapper.insertMenuOrder(menuOrder);
        }
        int result = menuOrderMapper.insertMenuOrder(menuOrder);
        if (result > 0) {
            Long orderId = menuOrder.getId();
            for (OrderItem item : itemList) {
                item.setOrderId(orderId);
                itemService.insertOrderItem(item);
            }
        }
        return result;
    }

    /**
     * 修改menu order
     *
     * @param menuOrder menu order
     * @return 结果
     */
    @Override
    public int updateMenuOrder(MenuOrder menuOrder) {
        menuOrder.setUpdateTime(DateUtils.getNowDate());
        return menuOrderMapper.updateMenuOrder(menuOrder);
    }

    /**
     * 批量删除menu order
     *
     * @param ids 需要删除的menu order主键
     * @return 结果
     */
    @Override
    public int deleteMenuOrderByIds(String ids) {
        return menuOrderMapper.deleteMenuOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除menu order信息
     *
     * @param id menu order主键
     * @return 结果
     */
    @Override
    public int deleteMenuOrderById(Long id) {
        return menuOrderMapper.deleteMenuOrderById(id);
    }
}
