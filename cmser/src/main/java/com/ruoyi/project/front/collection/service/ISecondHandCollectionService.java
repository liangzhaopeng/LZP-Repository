package com.ruoyi.project.front.collection.service;

import java.util.List;
import com.ruoyi.project.front.collection.domain.SecondHandCollection;

/**
 * second_hand_collectionService接口
 * 
 * @author lzp
 * @date 2022-08-11
 */
public interface ISecondHandCollectionService 
{
    /**
     * 查询second_hand_collection
     * 
     * @param id second_hand_collection主键
     * @return second_hand_collection
     */
    public SecondHandCollection selectSecondHandCollectionById(Long id);

    /**
     * 查询second_hand_collection列表
     * 
     * @param secondHandCollection second_hand_collection
     * @return second_hand_collection集合
     */
    public List<SecondHandCollection> selectSecondHandCollectionList(SecondHandCollection secondHandCollection);

    /**
     * 新增second_hand_collection
     * 
     * @param secondHandCollection second_hand_collection
     * @return 结果
     */
    public int insertSecondHandCollection(SecondHandCollection secondHandCollection);

    /**
     * 修改second_hand_collection
     * 
     * @param secondHandCollection second_hand_collection
     * @return 结果
     */
    public int updateSecondHandCollection(SecondHandCollection secondHandCollection);

    /**
     * 批量删除second_hand_collection
     * 
     * @param ids 需要删除的second_hand_collection主键集合
     * @return 结果
     */
    public int deleteSecondHandCollectionByIds(String ids);

    /**
     * 删除second_hand_collection信息
     * 
     * @param id second_hand_collection主键
     * @return 结果
     */
    public int deleteSecondHandCollectionById(Long id);

    int collectonRelevant(SecondHandCollection collection);
}
