package com.ruoyi.project.front.menu.domain;

import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * menu information对象 menu_information
 *
 * @author lzp
 * @date 2022-07-22
 */
public class MenuInformation extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * menu id
     */
    private Long id;

    /**
     * food name
     */
    @Excel(name = "food name")
    private String foodName;

    /**
     * food introduce
     */
    @Excel(name = "food introduce")
    private String foodIntroduce;

    /**
     * food price
     */
    @Excel(name = "food price")
    private BigDecimal price;

    /**
     * food image
     */
    @Excel(name = "food image")
    private String foodImage;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodIntroduce(String foodIntroduce) {
        this.foodIntroduce = foodIntroduce;
    }

    public String getFoodIntroduce() {
        return foodIntroduce;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setFoodImage(String foodImage) {
        this.foodImage = foodImage;
    }

    public String getFoodImage() {
        return foodImage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("foodName", getFoodName())
                .append("foodIntroduce", getFoodIntroduce())
                .append("price", getPrice())
                .append("foodImage", getFoodImage())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
