package com.ruoyi.project.front.collection.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * second_hand_collection对象 second_hand_collection
 * 
 * @author lzp
 * @date 2022-08-11
 */
public class SecondHandCollection extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** second_hand_id */
    @Excel(name = "second_hand_id")
    private Long secondHandId;

    /** user_id */
    @Excel(name = "user_id")
    private Long userId;

    /** type  1收藏 2点赞 */
    @Excel(name = "type")
    private String type;
//
//    /** action：1新增（收藏） 2删除（取消） */
//    private String action;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setSecondHandId(Long secondHandId)
    {
        this.secondHandId = secondHandId;
    }

    public Long getSecondHandId()
    {
        return secondHandId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }

//    public void setAction(String action)
//    {
//        this.action = action;
//    }
//
//    public String getAction()
//    {
//        return action;
//    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("secondHandId", getSecondHandId())
            .append("userId", getUserId())
            .append("type", getType())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
