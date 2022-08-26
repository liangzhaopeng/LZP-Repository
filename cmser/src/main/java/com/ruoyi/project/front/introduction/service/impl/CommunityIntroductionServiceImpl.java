package com.ruoyi.project.front.introduction.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.introduction.mapper.CommunityIntroductionMapper;
import com.ruoyi.project.front.introduction.domain.CommunityIntroduction;
import com.ruoyi.project.front.introduction.service.ICommunityIntroductionService;
import com.ruoyi.common.utils.text.Convert;

/**
 * community introductionService业务层处理
 *
 * @author lzp
 * @date 2022-07-23
 */
@Service
public class CommunityIntroductionServiceImpl implements ICommunityIntroductionService {
    @Autowired
    private CommunityIntroductionMapper communityIntroductionMapper;

    /**
     * 查询community introduction
     *
     * @param id community introduction主键
     * @return community introduction
     */
    @Override
    public CommunityIntroduction selectCommunityIntroductionById(Long id) {
        return communityIntroductionMapper.selectCommunityIntroductionById(id);
    }

    /**
     * 查询community introduction列表
     *
     * @param communityIntroduction community introduction
     * @return community introduction
     */
    @Override
    public List<CommunityIntroduction> selectCommunityIntroductionList(CommunityIntroduction communityIntroduction) {
        return communityIntroductionMapper.selectCommunityIntroductionList(communityIntroduction);
    }

    /**
     * 新增community introduction
     *
     * @param communityIntroduction community introduction
     * @return 结果
     */
    @Override
    public int insertCommunityIntroduction(CommunityIntroduction communityIntroduction) {
        communityIntroduction.setCreateTime(DateUtils.getNowDate());
        return communityIntroductionMapper.insertCommunityIntroduction(communityIntroduction);
    }

    /**
     * 修改community introduction
     *
     * @param communityIntroduction community introduction
     * @return 结果
     */
    @Override
    public int updateCommunityIntroduction(CommunityIntroduction communityIntroduction) {
        communityIntroduction.setUpdateTime(DateUtils.getNowDate());
        return communityIntroductionMapper.updateCommunityIntroduction(communityIntroduction);
    }

    /**
     * 批量删除community introduction
     *
     * @param ids 需要删除的community introduction主键
     * @return 结果
     */
    @Override
    public int deleteCommunityIntroductionByIds(String ids) {
        return communityIntroductionMapper.deleteCommunityIntroductionByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除community introduction信息
     *
     * @param id community introduction主键
     * @return 结果
     */
    @Override
    public int deleteCommunityIntroductionById(Long id) {
        return communityIntroductionMapper.deleteCommunityIntroductionById(id);
    }
}
