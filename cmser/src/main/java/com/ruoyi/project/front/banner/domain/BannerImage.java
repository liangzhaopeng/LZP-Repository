package com.ruoyi.project.front.banner.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * banner image对象 banner_image
 *
 * @author lzp
 * @date 2022-07-25
 */
public class BannerImage extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * second hand id
     */
    private Long id;

    /**
     * goods image one
     */
    @Excel(name = "goods image one")
    private String bannerImageUrl;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setBannerImageUrl(String bannerImageUrl) {
        this.bannerImageUrl = bannerImageUrl;
    }

    public String getBannerImageUrl() {
        return bannerImageUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("bannerImageUrl", getBannerImageUrl())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
