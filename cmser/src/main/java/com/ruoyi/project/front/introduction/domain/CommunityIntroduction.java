package com.ruoyi.project.front.introduction.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * community introduction对象 community_introduction
 *
 * @author lzp
 * @date 2022-07-23
 */
public class CommunityIntroduction extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * community id
     */
    private Long id;

    /**
     * title
     */
    @Excel(name = "title")
    private String title;

    /**
     * introduce content
     */
    @Excel(name = "introduce content")
    private String introduceContent;

    /**
     * content url
     */
    private String contentUrl;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setIntroduceContent(String introduceContent) {
        this.introduceContent = introduceContent;
    }

    public String getIntroduceContent() {
        return introduceContent;
    }

    public String getContentUrl() {
        return contentUrl;
    }

    public void setContentUrl(String contentUrl) {
        this.contentUrl = contentUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("title", getTitle())
                .append("introduceContent", getIntroduceContent())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
