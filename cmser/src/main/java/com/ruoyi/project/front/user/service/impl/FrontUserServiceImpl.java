package com.ruoyi.project.front.user.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.Md5Utils;
import com.ruoyi.common.utils.StringUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.front.user.mapper.FrontUserMapper;
import com.ruoyi.project.front.user.domain.FrontUser;
import com.ruoyi.project.front.user.service.IFrontUserService;
import com.ruoyi.common.utils.text.Convert;

/**
 * front userService业务层处理
 *
 * @author lzp
 * @date 2022-07-21
 */
@Service
public class FrontUserServiceImpl implements IFrontUserService {
    @Autowired
    private FrontUserMapper frontUserMapper;

    /**
     * 查询front user
     *
     * @param id front user主键
     * @return front user
     */
    @Override
    public FrontUser selectFrontUserById(Long id) {
        return frontUserMapper.selectFrontUserById(id);
    }

    /**
     * 查询front user列表
     *
     * @param frontUser front user
     * @return front user
     */
    @Override
    public List<FrontUser> selectFrontUserList(FrontUser frontUser) {
        return frontUserMapper.selectFrontUserList(frontUser);
    }

    /**
     * 根据登录名称查询用户
     *
     * @param loginName
     * @return
     */
    @Override
    public FrontUser selectUserByLoginName(String loginName) {
        if (StringUtils.isBlank(loginName)) {
            return null;
        }
        FrontUser param = new FrontUser();
        param.setLoginName(loginName);
        List<FrontUser> list = selectFrontUserList(param);
        if (CollectionUtils.isNotEmpty(list)) {
            return list.get(0);
        }
        return null;
    }

    /**
     * 新增front user
     *
     * @param frontUser front user
     * @return 结果
     */
    @Override
    public int insertFrontUser(FrontUser frontUser) {
        if (frontUser == null) {
            return 0;
        }
        String loginName = frontUser.getLoginName();
        String password = frontUser.getPassword();
        if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
            return 0;
        }
        // 校验登录名称是否重复
        FrontUser user = selectUserByLoginName(loginName);
        if (user != null) {
            return 0;
        }
        // 密码MD5加密后保存
        String sign = Md5Utils.generate(password);
        frontUser.setPassword(sign);
        frontUser.setCreateTime(DateUtils.getNowDate());
        return frontUserMapper.insertFrontUser(frontUser);
    }

    /**
     * 修改front user
     *
     * @param frontUser front user
     * @return 结果
     */
    @Override
    public int updateFrontUser(FrontUser frontUser) {
        if (frontUser == null) {
            return 0;
        }
        Long id = frontUser.getId();
        if (id == null) {
            return 0;
        }
        String loginName = frontUser.getLoginName();
        String password = frontUser.getPassword();
        if (StringUtils.isNotBlank(loginName)) {
            // 校验登录名称是否重复
            FrontUser user = selectUserByLoginName(loginName);
            if (user != null && !id.equals(user.getId())) {
                return 0;
            }
        }
        if (StringUtils.isNotBlank(password)) {
            // 密码MD5加密后保存
            String sign = Md5Utils.generate(password);
            frontUser.setPassword(sign);
        }
        frontUser.setUpdateTime(DateUtils.getNowDate());
        return frontUserMapper.updateFrontUser(frontUser);
    }

    /**
     * 批量删除front user
     *
     * @param ids 需要删除的front user主键
     * @return 结果
     */
    @Override
    public int deleteFrontUserByIds(String ids) {
        return frontUserMapper.deleteFrontUserByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除front user信息
     *
     * @param id front user主键
     * @return 结果
     */
    @Override
    public int deleteFrontUserById(Long id) {
        return frontUserMapper.deleteFrontUserById(id);
    }

    /**
     * 登录
     *
     * @param loginName
     * @param password
     * @return
     */
    @Override
    public Long login(String loginName, String password) {
        if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
            return null;
        }
        FrontUser user = selectUserByLoginName(loginName);
        if (user == null) {
            return null;
        }
        // 验证MD5签名
        boolean verify = Md5Utils.verify(password, user.getPassword());
        if (verify) {
            return user.getId();
        }
        return null;
    }
}
