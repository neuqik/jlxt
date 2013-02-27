package net.biz.hr.model;

import java.util.List;
import java.util.Map;

import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.hr.vo.HRD_EMP_EDU;
import net.biz.hr.vo.HRD_EMP_REG;
import net.biz.hr.vo.HRD_EMP_TRANSFER;
import net.biz.hr.vo.HRD_Emp;

public interface IHRService {
	/**
	 * 查询所有订单
	 * 
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> queryAllList() throws Exception;

	/**
	 * 查询订单样例
	 * 
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> queryList() throws Exception;

	/**
	 * 分页查询样例
	 * 
	 * @param startRow
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> queryAllListByPage(int startRow, int pageSize)
			throws Exception;

	/**
	 * 查询总行数
	 * 
	 * @param totalCount
	 * @return
	 * @throws Exception
	 */
	int queryRowCount(int totalCount) throws Exception;

	/**
	 * 根据grid的filter条件查询
	 * 
	 * @param filters
	 *            过滤条件
	 * @param sorts
	 *            排序条件
	 * @param startRow
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> queryListByPage(List<FilterInfo> filters,
			List<SortInfo> sorts, int startRow, int pageSize) throws Exception;

	/**
	 * 查询过滤条件行数
	 * 
	 * @param totalCount
	 * @return
	 * @throws Exception
	 */
	int queryFilterRowCount(List<FilterInfo> filters, int totalCount)
			throws Exception;

	/**
	 * 对象参数方式调用分页
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public AppInfo queryListByPage(RequestInfo request) throws Exception;

	/**
	 * 保存新员工
	 * 
	 * @param emp
	 * @return 新员工ID
	 * @throws Exception
	 */
	public String saveNewEmp(HRD_Emp emp) throws Exception;

	/**
	 * 保存编辑的员工信息
	 * 
	 * @param emp
	 * @return
	 * @throws Exception
	 */
	public void saveEditEmp(HRD_Emp emp) throws Exception;

	/**
	 * 根据传入的录入信息生成员工编号
	 * 
	 * @param emp
	 * @return
	 * @throws Exception
	 */
	public String genNewEmpID(HRD_Emp emp) throws Exception;

	/**
	 * 保存员工绩效考核信息
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 *            要修改的员工编号
	 * @throws Exception
	 */
	public void saveEmpPerf(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;

	/**
	 * 保存员工培训信息
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 *            要修改的员工编号
	 * @throws Exception
	 */
	public void saveEmpTrans(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;

	/**
	 * 保存员工家庭信息
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpFamily(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;

	/**
	 * 保存员工劳动合同
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpJob(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;

	/**
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpReward(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;

	/**
	 * 保存员工工作经历
	 * 
	 * @param insertList
	 * @param updateList
	 * @param deleteList
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpWork(List<Object> insertList, List<Object> updateList,
			List<Object> deleteList, String empId) throws Exception;

	/**
	 * 保存员工注册信息
	 * 
	 * @param reg
	 * @return
	 * @throws Exception
	 */
	public void saveNewEmpReg(HRD_EMP_REG reg) throws Exception;

	/**
	 * 保存员工编辑的注册信息
	 * 
	 * @param reg
	 * @throws Exception
	 */
	public void saveEditEmpReg(HRD_EMP_REG reg) throws Exception;

	/**
	 * 删除员工注册信息
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void dropEmpReg(String id) throws Exception;

	/**
	 * 保存员工职称信息
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpProf(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;

	/**
	 * 保存员工认证信息
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpCert(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception;
	/**
	 * 处理员工调转
	 * @param emptrans
	 * @throws Exception
	 */
	public void doEmpTransfer(HRD_EMP_TRANSFER emptrans) throws Exception;
	/**
	 * 保存新的员工学历信息
	 * @param edu
	 * @throws Exception
	 */
	public void saveNewEmpEdu(HRD_EMP_EDU edu) throws Exception;
	/**
	 * 保存编辑的员工学历信息
	 * @param edu
	 * @throws Exception
	 */
	public void saveEditEmpEdu(HRD_EMP_EDU edu) throws Exception;
	/**
	 * 删除员工学历信息
	 * @param id
	 * @throws Exception
	 */
	public void dropEmpEdu(String id) throws Exception;
	
}
