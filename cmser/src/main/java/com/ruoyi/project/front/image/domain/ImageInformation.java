package com.ruoyi.project.front.image.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * image information对象 image_information
 *
 * @author lzp
 * @date 2022-07-27
 */
public class ImageInformation extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * image id
     */
    private Long id;

    /**
     * image type
     */
    @Excel(name = "image type")
    private Integer imageType;

    /**
     * information id
     */
    @Excel(name = "information id")
    private Long informationId;

    /**
     * image url
     */
    @Excel(name = "image url")
    private String imageUrl;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setImageType(Integer imageType) {
        this.imageType = imageType;
    }

    public Integer getImageType() {
        return imageType;
    }

    public void setInformationId(Long informationId) {
        this.informationId = informationId;
    }

    public Long getInformationId() {
        return informationId;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("imageType", getImageType())
                .append("informationId", getInformationId())
                .append("imageUrl", getImageUrl())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
