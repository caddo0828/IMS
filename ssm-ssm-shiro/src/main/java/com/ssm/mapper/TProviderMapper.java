package com.ssm.mapper;

import com.ssm.pojo.TProvider;
import com.ssm.pojo.TProviderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TProviderMapper {
    int countByExample(TProviderExample example);

    int deleteByExample(TProviderExample example);

    int deleteByPrimaryKey(Integer pid);

    int insert(TProvider record);

    int insertSelective(TProvider record);

    List<TProvider> selectByExample(TProviderExample example);

    TProvider selectByPrimaryKey(Integer pid);

    int updateByExampleSelective(@Param("record") TProvider record, @Param("example") TProviderExample example);

    int updateByExample(@Param("record") TProvider record, @Param("example") TProviderExample example);

    int updateByPrimaryKeySelective(TProvider record);

    int updateByPrimaryKey(TProvider record);
}