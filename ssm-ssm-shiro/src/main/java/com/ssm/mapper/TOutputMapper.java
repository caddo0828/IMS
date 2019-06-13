package com.ssm.mapper;

import com.ssm.pojo.TOutput;
import com.ssm.pojo.TOutputExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TOutputMapper {
    int countByExample(TOutputExample example);

    int deleteByExample(TOutputExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(TOutput record);

    int insertSelective(TOutput record);

    List<TOutput> selectByExample(TOutputExample example);

    TOutput selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") TOutput record, @Param("example") TOutputExample example);

    int updateByExample(@Param("record") TOutput record, @Param("example") TOutputExample example);

    int updateByPrimaryKeySelective(TOutput record);

    int updateByPrimaryKey(TOutput record);
}