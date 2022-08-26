package com.ruoyi.project.front.household.domain;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * household management对象 household_management
 *
 * @author lzp
 * @date 2022-07-22
 */
public class HouseholdManagement extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * household id
     */
    private Long id;

    /**
     * household category
     */
    @Excel(name = "household category")
    private String householdCategory;

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
     * house number
     */
    @Excel(name = "house number")
    private String houseNumber;

    /**
     * household price
     */
    @Excel(name = "household price")
    private BigDecimal householdPrice;

    /**
     * household status
     */
    @Excel(name = "household status(1not send 2sent)")
    private Integer householdStatus;

    /**
     * 商品图片列表
     */
    private List<String> imageList;

    /**
     * 家政类别名称
     */
    private String categoryName;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setHouseholdCategory(String householdCategory) {
        this.householdCategory = householdCategory;
    }

    public String getHouseholdCategory() {
        return householdCategory;
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

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseholdPrice(BigDecimal householdPrice) {
        this.householdPrice = householdPrice;
    }

    public BigDecimal getHouseholdPrice() {
        return householdPrice;
    }

    public void setHouseholdStatus(Integer householdStatus) {
        this.householdStatus = householdStatus;
    }

    public Integer getHouseholdStatus() {
        return householdStatus;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("householdCategory", getHouseholdCategory())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("houseNumber", getHouseNumber())
                .append("householdPrice", getHouseholdPrice())
                .append("householdStatus", getHouseholdStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
