package com.ssm.mapper;

import com.ssm.pojo.TSmalltype;
import com.ssm.pojo.TSmalltypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TSmalltypeMapper {
    int countByExample(TSmalltypeExample example);

    int deleteByExample(TSmalltypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TSmalltype record);

    int insertSelective(TSmalltype record);

    List<TSmalltype> selectByExample(TSmalltypeExample example);

    TSmalltype selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TSmalltype record, @Param("example") TSmalltypeExample example);

    int updateByExample(@Param("record") TSmalltype record, @Param("example") TSmalltypeExample example);

    int updateByPrimaryKeySelective(TSmalltype record);

    int updateByPrimaryKey(TSmalltype record);
}