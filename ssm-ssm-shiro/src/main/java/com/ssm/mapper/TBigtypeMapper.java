package com.ssm.mapper;

import com.ssm.pojo.TBigtype;
import com.ssm.pojo.TBigtypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TBigtypeMapper {
    int countByExample(TBigtypeExample example);

    int deleteByExample(TBigtypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TBigtype record);

    int insertSelective(TBigtype record);

    List<TBigtype> selectByExample(TBigtypeExample example);

    TBigtype selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TBigtype record, @Param("example") TBigtypeExample example);

    int updateByExample(@Param("record") TBigtype record, @Param("example") TBigtypeExample example);

    int updateByPrimaryKeySelective(TBigtype record);

    int updateByPrimaryKey(TBigtype record);
}