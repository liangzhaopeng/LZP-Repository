package com.ruoyi.project.front.item.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.front.menu.domain.MenuInformation;
import com.ruoyi.project.front.menu.service.IMenuInformationService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.item.mapper.OrderItemMapper;
import com.ruoyi.project.front.item.domain.OrderItem;
import com.ruoyi.project.front.item.service.IOrderItemService;
import com.ruoyi.common.utils.text.Convert;

/**
 * order itemService业务层处理
 *
 * @author lzp
 * @date 2022-07-28
 */
@Service
public class OrderItemServiceImpl implements IOrderItemService {
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private IMenuInformationService menuInformationService;

    /**
     * 查询order item
     *
     * @param id order item主键
     * @return order item
     */
    @Override
    public OrderItem selectOrderItemById(Long id) {
        return orderItemMapper.selectOrderItemById(id);
    }

    /**
     * 查询order item列表
     *
     * @param orderItem order item
     * @return order item
     */
    @Override
    public List<OrderItem> selectOrderItemList(OrderItem orderItem) {
        if (orderItem == null) {
            orderItem = new OrderItem();
        }
        List<OrderItem> orderItemList = orderItemMapper.selectOrderItemList(orderItem);
        if (CollectionUtils.isEmpty(orderItemList)) {
            return orderItemList;
        }
        for (OrderItem item : orderItemList) {
            // 设置食物图片
            Long foodId = item.getFoodId();
            if (foodId == null) {
                continue;
            }
            MenuInformation food = menuInformationService.selectMenuInformationById(foodId);
            if (food == null) {
                continue;
            }
            item.setFoodImage(food.getFoodImage());
        }
        return orderItemList;
    }

    /**
     * 新增order item
     *
     * @param orderItem order item
     * @return 结果
     */
    @Override
    public int insertOrderItem(OrderItem orderItem) {
        orderItem.setCreateTime(DateUtils.getNowDate());
        return orderItemMapper.insertOrderItem(orderItem);
    }

    /**
     * 修改order item
     *
     * @param orderItem order item
     * @return 结果
     */
    @Override
    public int updateOrderItem(OrderItem orderItem) {
        orderItem.setUpdateTime(DateUtils.getNowDate());
        return orderItemMapper.updateOrderItem(orderItem);
    }

    /**
     * 批量删除order item
     *
     * @param ids 需要删除的order item主键
     * @return 结果
     */
    @Override
    public int deleteOrderItemByIds(String ids) {
        return orderItemMapper.deleteOrderItemByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除order item信息
     *
     * @param id order item主键
     * @return 结果
     */
    @Override
    public int deleteOrderItemById(Long id) {
        return orderItemMapper.deleteOrderItemById(id);
    }
}
