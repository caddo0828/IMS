package com.ssm.utils;
import java.io.Serializable;
import java.util.List;

/**
 * 分页辅助类：对分页的基本数据进行一个简单的封装
 * 用来传递分页参数和查询参数params
 */
public class PageUtils implements Serializable{
    private int pageNo = 1;							//页码，默认是第一页
    private int pageSize = 20;	//每页显示的记录数，默认是15
    private long totalRecord;						//总记录数
    private long totalPage;							//总页数
    private List results;				//对应的当前页记录
    public int getPageNo() {
       return pageNo;
    }
    public void setPageNo(int pageNo) {
       this.pageNo = pageNo;
    }
    public int getPageSize() {
       return pageSize;
    }
    public void setPageSize(int pageSize) {
       this.pageSize = pageSize;
    }
    public long getTotalRecord() {
       return totalRecord;
    }
    public void setTotalRecord(long totalRecord) {
       this.totalRecord = totalRecord;
       //在设置总记录数的时候计算出对应的总页数，在下面的三目运算中加法拥有更高的优先级，所以最后可以不加括号。
       //int totalPage = ((Long)totalRecord).intValue()%pageSize==0 ? ((Long)totalRecord).intValue()/pageSize : ((Long)totalRecord).intValue()/pageSize + 1;
       //this.setTotalPage(totalPage);
    }
    public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public List getResults() {
       return results;
    }
    public void setResults(List results) {
       this.results = results;
    }

}