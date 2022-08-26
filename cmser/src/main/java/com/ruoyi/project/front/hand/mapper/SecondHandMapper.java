package com.ruoyi.project.front.hand.mapper;

import java.util.List;

import com.ruoyi.project.front.hand.domain.SecondHand;

/**
 * second hand exchangeMapper接口
 *
 * @author lzp
 * @date 2022-07-23
 */
public interface SecondHandMapper {
    /**
     * 查询second hand exchange
     *
     * @param id second hand exchange主键
     * @return second hand exchange
     */
    public SecondHand selectSecondHandById(Long id);

    /**
     * 查询second hand exchange列表
     *
     * @param secondHand second hand exchange
     * @return second hand exchange集合
     */
    public List<SecondHand> selectSecondHandList(SecondHand secondHand);

    /**
     * 新增second hand exchange
     *
     * @param secondHand second hand exchange
     * @return 结果
     */
    public int insertSecondHand(SecondHand secondHand);

    /**
     * 修改second hand exchange
     *
     * @param secondHand second hand exchange
     * @return 结果
     */
    public int updateSecondHand(SecondHand secondHand);

    /**
     * 删除second hand exchange
     *
     * @param id second hand exchange主键
     * @return 结果
     */
    public int deleteSecondHandById(Long id);

    /**
     * 批量删除second hand exchange
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSecondHandByIds(String[] ids);
}
