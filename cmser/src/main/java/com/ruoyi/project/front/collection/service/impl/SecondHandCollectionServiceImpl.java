package com.ruoyi.project.front.collection.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.collection.mapper.SecondHandCollectionMapper;
import com.ruoyi.project.front.collection.domain.SecondHandCollection;
import com.ruoyi.project.front.collection.service.ISecondHandCollectionService;
import com.ruoyi.common.utils.text.Convert;

/**
 * second_hand_collectionService业务层处理
 * 
 * @author lzp
 * @date 2022-08-11
 */
@Service
public class SecondHandCollectionServiceImpl implements ISecondHandCollectionService 
{
    @Autowired
    private SecondHandCollectionMapper secondHandCollectionMapper;

    /**
     * 查询second_hand_collection
     * 
     * @param id second_hand_collection主键
     * @return second_hand_collection
     */
    @Override
    public SecondHandCollection selectSecondHandCollectionById(Long id)
    {
        return secondHandCollectionMapper.selectSecondHandCollectionById(id);
    }

    /**
     * 查询second_hand_collection列表
     * 
     * @param secondHandCollection second_hand_collection
     * @return second_hand_collection
     */
    @Override
    public List<SecondHandCollection> selectSecondHandCollectionList(SecondHandCollection secondHandCollection)
    {
        return secondHandCollectionMapper.selectSecondHandCollectionList(secondHandCollection);
    }

    /**
     * 新增second_hand_collection
     * 
     * @param secondHandCollection second_hand_collection
     * @return 结果
     */
    @Override
    public int insertSecondHandCollection(SecondHandCollection secondHandCollection)
    {
        secondHandCollection.setCreateTime(DateUtils.getNowDate());
        return secondHandCollectionMapper.insertSecondHandCollection(secondHandCollection);
    }

    /**
     * 修改second_hand_collection
     * 
     * @param secondHandCollection second_hand_collection
     * @return 结果
     */
    @Override
    public int updateSecondHandCollection(SecondHandCollection secondHandCollection)
    {
        secondHandCollection.setUpdateTime(DateUtils.getNowDate());
        return secondHandCollectionMapper.updateSecondHandCollection(secondHandCollection);
    }

    /**
     * 批量删除second_hand_collection
     * 
     * @param ids 需要删除的second_hand_collection主键
     * @return 结果
     */
    @Override
    public int deleteSecondHandCollectionByIds(String ids)
    {
        return secondHandCollectionMapper.deleteSecondHandCollectionByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除second_hand_collection信息
     * 
     * @param id second_hand_collection主键
     * @return 结果
     */
    @Override
    public int deleteSecondHandCollectionById(Long id)
    {
        return secondHandCollectionMapper.deleteSecondHandCollectionById(id);
    }

    @Override
    public int collectonRelevant(SecondHandCollection collection) {
        List<SecondHandCollection> list = secondHandCollectionMapper.selectSecondHandCollectionList(collection);
        if(ObjectUtils.isEmpty(list)){
            return this.insertSecondHandCollection(collection);
        }else {
            return  secondHandCollectionMapper.delCollection(collection);
        }
    }
}
