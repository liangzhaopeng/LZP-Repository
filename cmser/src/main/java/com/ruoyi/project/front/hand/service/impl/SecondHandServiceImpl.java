package com.ruoyi.project.front.hand.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.front.image.domain.ImageInformation;
import com.ruoyi.project.front.image.service.IImageInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.hand.mapper.SecondHandMapper;
import com.ruoyi.project.front.hand.domain.SecondHand;
import com.ruoyi.project.front.hand.service.ISecondHandService;
import com.ruoyi.common.utils.text.Convert;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

/**
 * second hand exchangeService业务层处理
 *
 * @author lzp
 * @date 2022-07-23
 */
@Service
public class SecondHandServiceImpl implements ISecondHandService {

    @Autowired
    private SecondHandMapper secondHandMapper;

    @Autowired
    private IImageInformationService imageInformationService;

    /**
     * 查询second hand exchange
     *
     * @param id second hand exchange主键
     * @return second hand exchange
     */
    @Override
    public SecondHand selectSecondHandById(Long id) {
        return secondHandMapper.selectSecondHandById(id);
    }

    /**
     * 查询second hand exchange列表
     *
     * @param secondHand second hand exchange
     * @return second hand exchange
     */
    @Override
    public List<SecondHand> selectSecondHandList(SecondHand secondHand) {
        return secondHandMapper.selectSecondHandList(secondHand);
    }

    /**
     * 新增second hand exchange
     *
     * @param secondHand second hand exchange
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSecondHand(SecondHand secondHand) {
        if (secondHand == null) {
            return 0;
        }
        secondHand.setCreateTime(DateUtils.getNowDate());
        // 保存图片列表
        List<String> imageList = secondHand.getImageList();
        if (CollectionUtils.isEmpty(imageList)) {
            return secondHandMapper.insertSecondHand(secondHand);
        }
        int result = secondHandMapper.insertSecondHand(secondHand);
        if (result > 0) {
            Long id = secondHand.getId();
            for (String image : imageList) {
                ImageInformation imageInformation = new ImageInformation();
                imageInformation.setInformationId(id);
                imageInformation.setImageType(2);
                imageInformation.setImageUrl(image);
                imageInformationService.insertImageInformation(imageInformation);
            }
        }
        return result;
    }

    /**
     * 修改second hand exchange
     *
     * @param secondHand second hand exchange
     * @return 结果
     */
    @Override
    public int updateSecondHand(SecondHand secondHand) {
        secondHand.setUpdateTime(DateUtils.getNowDate());
        return secondHandMapper.updateSecondHand(secondHand);
    }

    /**
     * 批量删除second hand exchange
     *
     * @param ids 需要删除的second hand exchange主键
     * @return 结果
     */
    @Override
    public int deleteSecondHandByIds(String ids) {
        return secondHandMapper.deleteSecondHandByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除second hand exchange信息
     *
     * @param id second hand exchange主键
     * @return 结果
     */
    @Override
    public int deleteSecondHandById(Long id) {
        return secondHandMapper.deleteSecondHandById(id);
    }
}
