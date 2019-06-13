package com.ssm.mapper;

import com.ssm.pojo.TMenuRoleExample;
import com.ssm.pojo.TMenuRoleKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TMenuRoleMapper {
    int countByExample(TMenuRoleExample example);

    int deleteByExample(TMenuRoleExample example);

    int deleteByPrimaryKey(TMenuRoleKey key);

    int insert(TMenuRoleKey record);

    int insertSelective(TMenuRoleKey record);

    List<TMenuRoleKey> selectByExample(TMenuRoleExample example);

    int updateByExampleSelective(@Param("record") TMenuRoleKey record, @Param("example") TMenuRoleExample example);

    int updateByExample(@Param("record") TMenuRoleKey record, @Param("example") TMenuRoleExample example);
}