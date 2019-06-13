package com.ssm.mapper;

import com.ssm.pojo.TAdminRoleExample;
import com.ssm.pojo.TAdminRoleKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TAdminRoleMapper {
    int countByExample(TAdminRoleExample example);

    int deleteByExample(TAdminRoleExample example);

    int deleteByPrimaryKey(TAdminRoleKey key);

    int insert(TAdminRoleKey record);

    int insertSelective(TAdminRoleKey record);

    List<TAdminRoleKey> selectByExample(TAdminRoleExample example);

    int updateByExampleSelective(@Param("record") TAdminRoleKey record, @Param("example") TAdminRoleExample example);

    int updateByExample(@Param("record") TAdminRoleKey record, @Param("example") TAdminRoleExample example);
}