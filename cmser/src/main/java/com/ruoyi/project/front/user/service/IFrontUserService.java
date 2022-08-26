package com.ruoyi.project.front.user.service;

import java.util.List;

import com.ruoyi.project.front.user.domain.FrontUser;

/**
 * front userService接口
 *
 * @author lzp
 * @date 2022-07-21
 */
public interface IFrontUserService {

    /**
     * 查询front user
     *
     * @param id front user主键
     * @return front user
     */
    public FrontUser selectFrontUserById(Long id);

    /**
     * 查询front user列表
     *
     * @param frontUser front user
     * @return front user集合
     */
    public List<FrontUser> selectFrontUserList(FrontUser frontUser);

    /**
     * 根据登录名称查询用户
     *
     * @param loginName
     * @return
     */
    FrontUser selectUserByLoginName(String loginName);

    /**
     * 新增front user
     *
     * @param frontUser front user
     * @return 结果
     */
    public int insertFrontUser(FrontUser frontUser);

    /**
     * 修改front user
     *
     * @param frontUser front user
     * @return 结果
     */
    public int updateFrontUser(FrontUser frontUser);

    /**
     * 批量删除front user
     *
     * @param ids 需要删除的front user主键集合
     * @return 结果
     */
    public int deleteFrontUserByIds(String ids);

    /**
     * 删除front user信息
     *
     * @param id front user主键
     * @return 结果
     */
    public int deleteFrontUserById(Long id);

    /**
     * 登录
     *
     * @param loginName
     * @param password
     * @return
     */
    Long login(String loginName, String password);
}
