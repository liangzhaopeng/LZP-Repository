package com.ruoyi.project.front.hand.domain;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * second hand exchange对象 second_hand
 *
 * @author lzp
 * @date 2022-07-23
 */
public class SecondHand extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * second hand id
     */
    private Long id;

    /**
     * goods name
     */
    @Excel(name = "goods name")
    private String goodsName;

    /**
     * goods describe
     */
    @Excel(name = "goods describe")
    private String goodsDescribe;

    /**
     * goods price
     */
    @Excel(name = "goods price")
    private BigDecimal price;

    /**
     * goods image one
     */
    @Excel(name = "goods image one")
    private String goodsImageOne;

    /**
     * goods image two
     */
    @Excel(name = "goods image two")
    private String goodsImageTwo;

    /**
     * goods image three
     */
    @Excel(name = "goods image three")
    private String goodsImageThree;

    /**
     * goods image four
     */
    @Excel(name = "goods image four")
    private String goodsImageFour;

    /**
     * goods image five
     */
    @Excel(name = "goods image five")
    private String goodsImageFive;

    /**
     * goods image six
     */
    @Excel(name = "goods image six")
    private String goodsImageSix;

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
     * exchange status
     */
    @Excel(name = "exchange status")
    private Integer status;

    /**
     * 商品图片列表
     */
    private List<String> imageList;

    /**
     * id列表
     */
    private List<String> ids;

    public void setIds(List<String> ids) {
        this.ids = ids;
    }

    public List<String> getIds() {
        return ids;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsDescribe(String goodsDescribe) {
        this.goodsDescribe = goodsDescribe;
    }

    public String getGoodsDescribe() {
        return goodsDescribe;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setGoodsImageOne(String goodsImageOne) {
        this.goodsImageOne = goodsImageOne;
    }

    public String getGoodsImageOne() {
        return goodsImageOne;
    }

    public void setGoodsImageTwo(String goodsImageTwo) {
        this.goodsImageTwo = goodsImageTwo;
    }

    public String getGoodsImageTwo() {
        return goodsImageTwo;
    }

    public void setGoodsImageThree(String goodsImageThree) {
        this.goodsImageThree = goodsImageThree;
    }

    public String getGoodsImageThree() {
        return goodsImageThree;
    }

    public void setGoodsImageFour(String goodsImageFour) {
        this.goodsImageFour = goodsImageFour;
    }

    public String getGoodsImageFour() {
        return goodsImageFour;
    }

    public void setGoodsImageFive(String goodsImageFive) {
        this.goodsImageFive = goodsImageFive;
    }

    public String getGoodsImageFive() {
        return goodsImageFive;
    }

    public void setGoodsImageSix(String goodsImageSix) {
        this.goodsImageSix = goodsImageSix;
    }

    public String getGoodsImageSix() {
        return goodsImageSix;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("goodsName", getGoodsName())
                .append("goodsDescribe", getGoodsDescribe())
                .append("price", getPrice())
                .append("goodsImageOne", getGoodsImageOne())
                .append("goodsImageTwo", getGoodsImageTwo())
                .append("goodsImageThree", getGoodsImageThree())
                .append("goodsImageFour", getGoodsImageFour())
                .append("goodsImageFive", getGoodsImageFive())
                .append("goodsImageSix", getGoodsImageSix())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
