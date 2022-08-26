package com.ruoyi.project.front.comment.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.comment.mapper.SecondHandCommentMapper;
import com.ruoyi.project.front.comment.domain.SecondHandComment;
import com.ruoyi.project.front.comment.service.ISecondHandCommentService;
import com.ruoyi.common.utils.text.Convert;

/**
 * second_hand_commentService业务层处理
 * 
 * @author lzp
 * @date 2022-08-12
 */
@Service
public class SecondHandCommentServiceImpl implements ISecondHandCommentService 
{
    @Autowired
    private SecondHandCommentMapper secondHandCommentMapper;

    /**
     * 查询second_hand_comment
     * 
     * @param id second_hand_comment主键
     * @return second_hand_comment
     */
    @Override
    public SecondHandComment selectSecondHandCommentById(Long id)
    {
        return secondHandCommentMapper.selectSecondHandCommentById(id);
    }

    /**
     * 查询second_hand_comment列表
     * 
     * @param secondHandComment second_hand_comment
     * @return second_hand_comment
     */
    @Override
    public List<SecondHandComment> selectSecondHandCommentList(SecondHandComment secondHandComment)
    {
        return secondHandCommentMapper.selectSecondHandCommentList(secondHandComment);
    }

    /**
     * 新增second_hand_comment
     * 
     * @param secondHandComment second_hand_comment
     * @return 结果
     */
    @Override
    public int insertSecondHandComment(SecondHandComment secondHandComment)
    {
        secondHandComment.setCreateTime(DateUtils.getNowDate());
        return secondHandCommentMapper.insertSecondHandComment(secondHandComment);
    }

    /**
     * 修改second_hand_comment
     * 
     * @param secondHandComment second_hand_comment
     * @return 结果
     */
    @Override
    public int updateSecondHandComment(SecondHandComment secondHandComment)
    {
        secondHandComment.setUpdateTime(DateUtils.getNowDate());
        return secondHandCommentMapper.updateSecondHandComment(secondHandComment);
    }

    /**
     * 批量删除second_hand_comment
     * 
     * @param ids 需要删除的second_hand_comment主键
     * @return 结果
     */
    @Override
    public int deleteSecondHandCommentByIds(String ids)
    {
        return secondHandCommentMapper.deleteSecondHandCommentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除second_hand_comment信息
     * 
     * @param id second_hand_comment主键
     * @return 结果
     */
    @Override
    public int deleteSecondHandCommentById(Long id)
    {
        return secondHandCommentMapper.deleteSecondHandCommentById(id);
    }
}
