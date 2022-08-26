package com.ruoyi.project.front.order.domain;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.project.front.item.domain.OrderItem;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * menu order对象 menu_order
 *
 * @author lzp
 * @date 2022-07-22
 */
public class MenuOrder extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * order id
     */
    private Long id;

    /**
     * food id
     */
    @Excel(name = "food id")
    private Long foodId;

    /**
     * food name
     */
    @Excel(name = "food name")
    private String foodName;

    /**
     * customer id
     */
    @Excel(name = "customer id")
    private Long userId;

    /**
     * customer name
     */
    @Excel(name = "customer name")
    private String userName;

    /**
     * food number
     */
    @Excel(name = "food number")
    private Integer foodNumber;

    /**
     * order amount
     */
    @Excel(name = "food amount")
    private BigDecimal orderAmount;

    /**
     * order status(1not send 2sent)
     */
    @Excel(name = "order status(1not send 2sent)")
    private Integer orderStatus;

    /**
     * deliveryman
     */
    @Excel(name = "deliveryman")
    private String deliveryman;

    /**
     * deliveryman phone
     */
    @Excel(name = "deliveryman phone")
    private String deliverymanPhone;

    /**
     * order item list
     */
    private List<OrderItem> itemList;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public Long getFoodId() {
        return foodId;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setFoodNumber(Integer foodNumber) {
        this.foodNumber = foodNumber;
    }

    public Integer getFoodNumber() {
        return foodNumber;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setDeliveryman(String deliveryman) {
        this.deliveryman = deliveryman;
    }

    public String getDeliveryman() {
        return deliveryman;
    }

    public void setDeliverymanPhone(String deliverymanPhone) {
        this.deliverymanPhone = deliverymanPhone;
    }

    public String getDeliverymanPhone() {
        return deliverymanPhone;
    }

    public List<OrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OrderItem> itemList) {
        this.itemList = itemList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("foodId", getFoodId())
                .append("foodName", getFoodName())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("foodNumber", getFoodNumber())
                .append("orderAmount", getOrderAmount())
                .append("orderStatus", getOrderStatus())
                .append("deliveryman", getDeliveryman())
                .append("deliverymanPhone", getDeliverymanPhone())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
