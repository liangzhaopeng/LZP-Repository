package com.ruoyi.project.front.comment.service;

import java.util.List;
import com.ruoyi.project.front.comment.domain.SecondHandComment;

/**
 * second_hand_commentService接口
 * 
 * @author lzp
 * @date 2022-08-12
 */
public interface ISecondHandCommentService 
{
    /**
     * 查询second_hand_comment
     * 
     * @param id second_hand_comment主键
     * @return second_hand_comment
     */
    public SecondHandComment selectSecondHandCommentById(Long id);

    /**
     * 查询second_hand_comment列表
     * 
     * @param secondHandComment second_hand_comment
     * @return second_hand_comment集合
     */
    public List<SecondHandComment> selectSecondHandCommentList(SecondHandComment secondHandComment);

    /**
     * 新增second_hand_comment
     * 
     * @param secondHandComment second_hand_comment
     * @return 结果
     */
    public int insertSecondHandComment(SecondHandComment secondHandComment);

    /**
     * 修改second_hand_comment
     * 
     * @param secondHandComment second_hand_comment
     * @return 结果
     */
    public int updateSecondHandComment(SecondHandComment secondHandComment);

    /**
     * 批量删除second_hand_comment
     * 
     * @param ids 需要删除的second_hand_comment主键集合
     * @return 结果
     */
    public int deleteSecondHandCommentByIds(String ids);

    /**
     * 删除second_hand_comment信息
     * 
     * @param id second_hand_comment主键
     * @return 结果
     */
    public int deleteSecondHandCommentById(Long id);
}
