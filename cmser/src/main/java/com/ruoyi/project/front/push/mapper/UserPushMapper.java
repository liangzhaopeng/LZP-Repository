package com.ruoyi.project.front.push.mapper;

import java.util.List;
import com.ruoyi.project.front.push.domain.UserPush;

/**
 * user_pushMapper接口
 * 
 * @author lzp
 * @date 2022-08-18
 */
public interface UserPushMapper 
{
    /**
     * 查询user_push
     * 
     * @param id user_push主键
     * @return user_push
     */
    public UserPush selectUserPushById(Long id);

    /**
     * 查询user_push列表
     * 
     * @param userPush user_push
     * @return user_push集合
     */
    public List<UserPush> selectUserPushList(UserPush userPush);

    /**
     * 新增user_push
     * 
     * @param userPush user_push
     * @return 结果
     */
    public int insertUserPush(UserPush userPush);

    /**
     * 修改user_push
     * 
     * @param userPush user_push
     * @return 结果
     */
    public int updateUserPush(UserPush userPush);

    /**
     * 删除user_push
     * 
     * @param id user_push主键
     * @return 结果
     */
    public int deleteUserPushById(Long id);

    /**
     * 批量删除user_push
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserPushByIds(String[] ids);
}
