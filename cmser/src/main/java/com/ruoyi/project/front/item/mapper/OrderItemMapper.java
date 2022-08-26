package com.ruoyi.project.front.item.mapper;

import java.util.List;

import com.ruoyi.project.front.item.domain.OrderItem;

/**
 * order itemMapper接口
 *
 * @author lzp
 * @date 2022-07-28
 */
public interface OrderItemMapper {
    /**
     * 查询order item
     *
     * @param id order item主键
     * @return order item
     */
    public OrderItem selectOrderItemById(Long id);

    /**
     * 查询order item列表
     *
     * @param orderItem order item
     * @return order item集合
     */
    public List<OrderItem> selectOrderItemList(OrderItem orderItem);

    /**
     * 新增order item
     *
     * @param orderItem order item
     * @return 结果
     */
    public int insertOrderItem(OrderItem orderItem);

    /**
     * 修改order item
     *
     * @param orderItem order item
     * @return 结果
     */
    public int updateOrderItem(OrderItem orderItem);

    /**
     * 删除order item
     *
     * @param id order item主键
     * @return 结果
     */
    public int deleteOrderItemById(Long id);

    /**
     * 批量删除order item
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderItemByIds(String[] ids);
}
