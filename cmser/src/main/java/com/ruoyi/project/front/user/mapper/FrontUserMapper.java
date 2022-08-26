package com.ruoyi.project.front.user.mapper;

import java.util.List;

import com.ruoyi.project.front.user.domain.FrontUser;

/**
 * front userMapper接口
 *
 * @author lzp
 * @date 2022-07-21
 */
public interface FrontUserMapper {
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
     * 删除front user
     *
     * @param id front user主键
     * @return 结果
     */
    public int deleteFrontUserById(Long id);

    /**
     * 批量删除front user
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFrontUserByIds(String[] ids);
}
