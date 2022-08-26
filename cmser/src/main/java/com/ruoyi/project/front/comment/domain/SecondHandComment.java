package com.ruoyi.project.front.comment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.List;

/**
 * second_hand_comment对象 second_hand_comment
 * 
 * @author lzp
 * @date 2022-08-12
 */

public class SecondHandComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** p_id */
    @Excel(name = "p_id")
    private Long pId;

    /** second_hand */
    @Excel(name = "second_hand")
    private Long secondHandId;

    /** user_id */
    @Excel(name = "user_id")
    private Long userId;

    /** user_name */
    @Excel(name = "user_name")
    private String userName;

    /** content */
    @Excel(name = "content")
    private String content;


    /**p_id 集合  */
    private List<Long> pIdList;

    /**第二层评论 集合  */
    List<SecondHandComment> commentList;

    /** 分页页码 */
    Integer  currentPage;
    /** 每页数量 */
    Integer  pageSize;


    public void setCommentList(List<SecondHandComment> commentList)
    {
        this.commentList = commentList;
    }

    public List<SecondHandComment> getCommentList()
    {
        return commentList;
    }

    public void setPIdList(List<Long> pIdList)
    {
        this.pIdList = pIdList;
    }

    public List<Long> getPIdList()
    {
        return pIdList;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setCurrentPage(Integer currentPage)
    {
        this.currentPage = currentPage;
    }

    public Integer getCurrentPage()
    {
        return currentPage;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setpId(Long pId)
    {
        this.pId = pId;
    }

    public Long getpId()
    {
        return pId;
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
            .append("pId", getpId())
            .append("secondHandId", getSecondHandId())
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
