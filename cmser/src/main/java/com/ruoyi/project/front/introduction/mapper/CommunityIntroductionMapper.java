package com.ruoyi.project.front.introduction.mapper;

import java.util.List;

import com.ruoyi.project.front.introduction.domain.CommunityIntroduction;

/**
 * community introductionMapper接口
 *
 * @author lzp
 * @date 2022-07-23
 */
public interface CommunityIntroductionMapper {
    /**
     * 查询community introduction
     *
     * @param id community introduction主键
     * @return community introduction
     */
    public CommunityIntroduction selectCommunityIntroductionById(Long id);

    /**
     * 查询community introduction列表
     *
     * @param communityIntroduction community introduction
     * @return community introduction集合
     */
    public List<CommunityIntroduction> selectCommunityIntroductionList(CommunityIntroduction communityIntroduction);

    /**
     * 新增community introduction
     *
     * @param communityIntroduction community introduction
     * @return 结果
     */
    public int insertCommunityIntroduction(CommunityIntroduction communityIntroduction);

    /**
     * 修改community introduction
     *
     * @param communityIntroduction community introduction
     * @return 结果
     */
    public int updateCommunityIntroduction(CommunityIntroduction communityIntroduction);

    /**
     * 删除community introduction
     *
     * @param id community introduction主键
     * @return 结果
     */
    public int deleteCommunityIntroductionById(Long id);

    /**
     * 批量删除community introduction
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCommunityIntroductionByIds(String[] ids);
}
