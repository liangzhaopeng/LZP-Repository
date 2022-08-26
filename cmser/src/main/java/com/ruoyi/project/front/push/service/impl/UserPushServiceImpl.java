package com.ruoyi.project.front.push.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.push.mapper.UserPushMapper;
import com.ruoyi.project.front.push.domain.UserPush;
import com.ruoyi.project.front.push.service.IUserPushService;
import com.ruoyi.common.utils.text.Convert;

/**
 * user_pushService业务层处理
 * 
 * @author lzp
 * @date 2022-08-18
 */
@Service
public class UserPushServiceImpl implements IUserPushService 
{
    @Autowired
    private UserPushMapper userPushMapper;

    /**
     * 查询user_push
     * 
     * @param id user_push主键
     * @return user_push
     */
    @Override
    public UserPush selectUserPushById(Long id)
    {
        return userPushMapper.selectUserPushById(id);
    }

    /**
     * 查询user_push列表
     * 
     * @param userPush user_push
     * @return user_push
     */
    @Override
    public List<UserPush> selectUserPushList(UserPush userPush)
    {
        return userPushMapper.selectUserPushList(userPush);
    }

    /**
     * 新增user_push
     * 
     * @param userPush user_push
     * @return 结果
     */
    @Override
    public int insertUserPush(UserPush userPush)
    {
        userPush.setCreateTime(DateUtils.getNowDate());
        return userPushMapper.insertUserPush(userPush);
    }

    /**
     * 修改user_push
     * 
     * @param userPush user_push
     * @return 结果
     */
    @Override
    public int updateUserPush(UserPush userPush)
    {
        userPush.setUpdateTime(DateUtils.getNowDate());
        return userPushMapper.updateUserPush(userPush);
    }

    /**
     * 批量删除user_push
     * 
     * @param ids 需要删除的user_push主键
     * @return 结果
     */
    @Override
    public int deleteUserPushByIds(String ids)
    {
        return userPushMapper.deleteUserPushByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除user_push信息
     * 
     * @param id user_push主键
     * @return 结果
     */
    @Override
    public int deleteUserPushById(Long id)
    {
        return userPushMapper.deleteUserPushById(id);
    }
}
