package com.ruoyi.project.front.item.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * order item对象 order_item
 *
 * @author lzp
 * @date 2022-07-28
 */
public class OrderItem extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * item id
     */
    private Long id;

    /**
     * order id
     */
    @Excel(name = "order id")
    private Long orderId;

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
     * food number
     */
    @Excel(name = "food number")
    private Integer foodNumber;

    /**
     * food image
     */
    private String foodImage;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getOrderId() {
        return orderId;
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

    public void setFoodNumber(Integer foodNumber) {
        this.foodNumber = foodNumber;
    }

    public Integer getFoodNumber() {
        return foodNumber;
    }

    public String getFoodImage() {
        return foodImage;
    }

    public void setFoodImage(String foodImage) {
        this.foodImage = foodImage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("orderId", getOrderId())
                .append("foodId", getFoodId())
                .append("foodName", getFoodName())
                .append("foodNumber", getFoodNumber())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
