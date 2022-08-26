package com.ruoyi.project.front.user.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * front user对象 front_user
 *
 * @author lzp
 * @date 2022-07-21
 */
public class FrontUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * user id
     */
    private Long id;

    /**
     * user name
     */
    @Excel(name = "user name")
    private String name;

    /**
     * login name
     */
    @Excel(name = "login name")
    private String loginName;

    /**
     * password
     */
    @Excel(name = "password")
    private String password;

    /**
     * registrationId
     */
    @Excel(name = "registrationId")
    private String registrationId;

    public void setRegistrationId(String registrationId) {
        this.registrationId = registrationId;
    }

    public String getRegistrationId() {
        return registrationId;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("loginName", getLoginName())
                .append("password", getPassword())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
