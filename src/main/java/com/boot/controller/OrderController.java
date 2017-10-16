package com.boot.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.Address;
import com.boot.pojo.Order;
import com.boot.pojo.OrderItem;
import com.boot.pojo.User;
import com.boot.service.AddressService;
import com.boot.service.OrderItemService;
import com.boot.service.OrderService;
import com.boot.tool.PaymentUtil;
import com.boot.tool.PropUtils;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private AddressService addressService;

	// 订单列表
	@RequestMapping("/toOrder")
	public String toOrder(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LoginUser");
		if (user != null) {
			String userId = user.getUserId();
			List<Order> orderList = orderService.findAllById(userId);

			if (orderList != null && orderList.size() != 0) {
				List<String> oIdList = new ArrayList<String>();
				for (Order order : orderList) {
					String orderId = order.getOrderId();
					oIdList.add(orderId);
				}

				List<OrderItem> oItemsList = orderItemService.findAllByOrderId(oIdList);

				model.addAttribute("oItemsList", oItemsList);
				model.addAttribute("orderList", orderList);

				return "order/orderList";
			}
			return "redirect:/home.action";
		}
		return "login/login";
	}

	// 删除订单
	@RequestMapping("/deleteOrder/{orderId}")
	public String deleteOrder(@PathVariable String orderId) {
		orderService.deleteOrderByOrderId(orderId);
		orderItemService.deleteOrderByOrderId(orderId);
		return "redirect:/toOrder.action";
	}

	// 订单付款,查看订单详细
	@RequestMapping("/payOrder/{orderId}")
	public String payOrder(@PathVariable String orderId, Model model) {

		List<OrderItem> oItemsList = orderItemService.findByOrderId(orderId);
		Order order = orderService.findOrderByOrderId(orderId);
		String receiveId = order.getReceiveId();
		Address address = addressService.findAddressByReceiveId(receiveId);
		model.addAttribute("oItemsList", oItemsList);
		model.addAttribute("order", order);
		model.addAttribute("address", address);
		return "order/orderPay";
	}

	// 支付银行
	@RequestMapping("/pay/{orderId}/{money}")
	public String pay(@PathVariable String orderId, @PathVariable Double money, Model model) {
		model.addAttribute("orderId", orderId);
		model.addAttribute("money", money);
		return "pay/pay";
	}

	// 确认支付
	@RequestMapping("/paymentAction")
	public String paymentAction(Model model, HttpServletRequest request) {
		// 1、准备请求需要的参数
		String p0_Cmd = "Buy";// 业务类型
		// 商户编号
		String p1_MerId = PropUtils.getProperty("p1_MerId");
		// 订单号
		String p2_Order = request.getParameter("orderId");
		// 支付金额,测试时使用0.01
		String p3_Amt = "0.01";
		
		// 支付金额,正式使用时订单金额需要根据订单id从数据库查询
		/*Order order = orderService.findOrderByOrderId(p2_Order);
		String p3_Amt = order.getMoney() + "";*/
		
		String p4_Cur = "CNY";// 交易币种
		String p5_Pid = "";// 商品名称
		String p6_Pcat = "";// 商品种类
		String p7_Pdesc = "";// 商品描述
		// 回调的Servlet:商户接收支付成功数据的地址
		String p8_Url = PropUtils.getProperty("responseURL");
		String p9_SAF = "";// 送货地址
		String pa_MP = "";// 商户的扩展信息
		String pd_FrpId = request.getParameter("pd_FrpId");
		String pr_NeedResponse = "1";// 应答机制
		// 使用提供的工具和秘钥对以上参数进行加密
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc,
				p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, PropUtils.getProperty("keyValue"));
		// 2、将以上参数保存到request作用域中
		request.setAttribute("pd_FrpId", pd_FrpId);
		request.setAttribute("p0_Cmd", p0_Cmd);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("p2_Order", p2_Order);
		request.setAttribute("p3_Amt", p3_Amt);
		request.setAttribute("p4_Cur", p4_Cur);
		request.setAttribute("p5_Pid", p5_Pid);
		request.setAttribute("p6_Pcat", p6_Pcat);
		request.setAttribute("p7_Pdesc", p7_Pdesc);
		request.setAttribute("p8_Url", p8_Url);
		request.setAttribute("p9_SAF", p9_SAF);
		request.setAttribute("pa_MP", pa_MP);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("hmac", hmac);
		// 3、转发到confirm.jsp
		return "pay/confirm";
	}

	// 接受易宝返回参数
	@RequestMapping("/callback")
	public String CallBack(HttpServletRequest request, HttpServletResponse response) {
		int state = 1; 
		// 1、接收参数
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		// 1表示重定向，2表示点对点通讯
		String r9_BType = request.getParameter("r9_BType");
		String rb_BankId = request.getParameter("rb_BankId");
		// 银行流水号
		String ro_BankOrderId = request.getParameter("ro_BankOrderId");
		String rp_PayDate = request.getParameter("rp_PayDate");
		String rq_CardNo = request.getParameter("rq_CardNo");
		String ru_Trxtime = request.getParameter("ru_Trxtime");
		// 签名数据
		String hmac = request.getParameter("hmac");
		// 2校验数据是否被修改 true:未被修改 false:被修改
		boolean isNoUpdate = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur,
				r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, PropUtils.getProperty("keyValue"));
		// 3、未修改的话
		if (isNoUpdate) {// 未被修改
			// 判断重定向过来，还是点对点通讯过来的
			if ("1".equals(r9_BType)) {// 重定向
				// 测试时使用.....
				// 修改订单的支付状态
				/*
				 * int state = 1; orderService.updateStateByOrderId(orderId, state);
				 */
				orderService.updateStateByOrderId(r6_Order, state);
				// .......
				try {
					response.getWriter().write("支付操作已受理，支付结果等待进一步通知.");
					return "redirect:/toOrder.action";
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else if ("2".equals(r9_BType) && "1".equals(r1_Code)) {
				// 修改订单的支付状态
				orderService.updateStateByOrderId(r6_Order, state);
				// 响应的第三方支付平台success
				try {
					response.getWriter().write("success");
					return "redirect:/toOrder.action";
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {// 4被修改了
			System.out.println("数据被篡改了...");
			// 可以转发到数据被篡改的页面
		}
		return "redirect:/toOrder.action";
	}

	// 确认收货
	@RequestMapping("/takeOrder/{orderId}")
	public String takeOrder(@PathVariable String orderId) {
		int confirm = 1;
		orderService.updateConfirmByOrderId(orderId, confirm);
		return "redirect:/toOrder.action";
	}

	// 查询待付款
	@RequestMapping("/obligationOrder")
	public String obligationOrder(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LoginUser");
		String userId = user.getUserId();

		int state = 0;
		List<Order> orderList = orderService.findAllByState(userId, state);
		if(orderList == null || orderList.size() == 0) {
			return "redirect:/toOrder.action";
		}
		List<String> oIdList = new ArrayList<String>();
		for (Order order : orderList) {
			String orderId = order.getOrderId();
			oIdList.add(orderId);
		}

		List<OrderItem> oItemsList = orderItemService.findAllByOrderId(oIdList);

		model.addAttribute("oItemsList", oItemsList);
		model.addAttribute("orderList", orderList);

		return "order/orderList";
	}

	// 查询待发货
	@RequestMapping("/deliverOrder")
	public String deliverOrder(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LoginUser");
		String userId = user.getUserId();
		int state = 1;
		int delivery = 0;
		List<Order> orderList = orderService.findAllByDelivery(userId, state, delivery);
		if(orderList == null || orderList.size() == 0) {
			return "redirect:/toOrder.action";
		}
		List<String> oIdList = new ArrayList<String>();
		for (Order order : orderList) {
			String orderId = order.getOrderId();
			oIdList.add(orderId);
		}

		List<OrderItem> oItemsList = orderItemService.findAllByOrderId(oIdList);

		model.addAttribute("oItemsList", oItemsList);
		model.addAttribute("orderList", orderList);

		return "order/orderList";
	}

	// 查询待收货
	@RequestMapping("/receiveOrder")
	public String receiveOrder(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LoginUser");
		String userId = user.getUserId();
		int state = 1;
		int delivery = 1;
		int confirm = 0;
		List<Order> orderList = orderService.findAllByConfirm(userId, state, delivery, confirm);
		if(orderList == null || orderList.size() == 0) {
			return "redirect:/toOrder.action";
		}
		List<String> oIdList = new ArrayList<String>();
		for (Order order : orderList) {
			String orderId = order.getOrderId();
			oIdList.add(orderId);
		}

		List<OrderItem> oItemsList = orderItemService.findAllByOrderId(oIdList);

		model.addAttribute("oItemsList", oItemsList);
		model.addAttribute("orderList", orderList);

		return "order/orderList";
	}

	// 查询成功交易
	@RequestMapping("/successOrder")
	public String successOrder(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LoginUser");
		String userId = user.getUserId();
		int state = 1;
		int delivery = 1;
		int confirm = 1;
		List<Order> orderList = orderService.findAllByConfirm(userId, state, delivery, confirm);
		if(orderList == null || orderList.size() == 0) {
			return "redirect:/toOrder.action";
		}
		List<String> oIdList = new ArrayList<String>();
		for (Order order : orderList) {
			String orderId = order.getOrderId();
			oIdList.add(orderId);
		}

		List<OrderItem> oItemsList = orderItemService.findAllByOrderId(oIdList);

		model.addAttribute("oItemsList", oItemsList);
		model.addAttribute("orderList", orderList);

		return "order/orderList";
	}
	
	//后台订单详情
	@RequestMapping("/toBackOrderDetail/{orderId}")
	public String toBackOrder(@PathVariable String orderId, Model model, HttpSession session) {
		User user = (User) session.getAttribute("LoginUser");
		List<OrderItem> oItemsList = orderItemService.findByOrderId(orderId);
		Order order = orderService.findOrderByOrderId(orderId);
		String receiveId = order.getReceiveId();
		Address address = addressService.findAddressByReceiveId(receiveId);
		model.addAttribute("oItemsList", oItemsList);
		model.addAttribute("order", order);
		model.addAttribute("address", address);
		model.addAttribute("user", user);
		
		return "back/order_detail";
	}
	
	//后台发货
	@RequestMapping("/toDelivery/{orderId}")
	public String toDelivery(@PathVariable String orderId, Model model) {
		int delivery = 1;
		orderService.updateDeliveryByOrderId(orderId, delivery);
		model.addAttribute("orderId",orderId);
		return "redirect:/toBackOrderDetail/{orderId}.action";
	}
}
