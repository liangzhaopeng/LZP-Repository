package com.ruoyi.project.front.push.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * user_push对象 user_push
 * 
 * @author lzp
 * @date 2022-08-18
 */
public class UserPush extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;


    /** modular */
    @Excel(name = "modular")
    private String modular;

    /** user_id */
    @Excel(name = "user_id")
    private Long userId;

    /** user_name */
    @Excel(name = "user_name")
    private String userName;

    /** content */
    @Excel(name = "content")
    private String content;

    public String getModular()
    {
        return modular;
    }
    public void setModular(String modular)
    {
        this.modular = modular;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("content", getContent())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
