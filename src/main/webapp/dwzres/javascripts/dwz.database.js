/**
 * @author ZhangHuihua@msn.com
 */

var _GLOBAL_OPEN_TYPE = "navTab";
(function($) {
	var _lookup = {
		currentGroup : "",
		currentName : "",
		index : -1
	};
	var _util = {
		_lookupPrefix : function() {
			var indexStr = _lookup.index < 0 ? "" : "[" + _lookup.index + "]";
			var preFix = _lookup.currentGroup + indexStr;
			return preFix ? preFix + "." : "";
		},
		lookupPk : function(key) {
			return _util._lookupPrefix() + _lookup.currentName + "." + key;
		},
		lookupField : function(key) {
			return _util._lookupPrefix() + "dwz_" + _lookup.currentName + "."
					+ key;
		}
	};

	$.extend({
		bringBackSuggest : function(args) {
			// wonder modify
			for ( var key in args) {
				var _o = document.getElementById(key);
				if (_o != null)
					_o.value = args[key];
			}
			var type;
			var $box;
			if (type != undefined) {
				$box = type == "dialog" ? $.pdialog.getCurrent() : navTab
						.getCurrentPanel();
			} else {
				$box = navTab.getCurrentPanel();
			}
			$box.find(":input").each(
					function() {
						var $input = $(this), inputName = $input.attr("name");
						for ( var key in args) {
							var name = ("id" == key) ? _util.lookupPk(key)
									: _util.lookupField(key);
							if (name == inputName) {
								$input.val(args[key]);
								$.cascadeSuggestAndBringBack($input, args);// add
								// by
								// cfuture.weiwei
								break;
							}
						}

						// });
						// var $box;
						// if (type != undefined) {
						// $box = type == "dialog" ? $.pdialog.getCurrent() :
						// navTab
						// .getCurrentPanel();
						// } else {
						// $box = navTab.getCurrentPanel();
						// }
						// $box = _lookup['$target'].parents(".unitBox:first");
						// $box.find(":input").each(
						// function() {
						// var $input = $(this), inputName =
						// $input.attr("name");
						//
						// for ( var key in args) {
						// var name = (_lookup.pk == key) ? _util
						// .lookupPk(key) : _util.lookupField(key);
						//
						// if (name == inputName) {
						// $input.val(args[key]);
						// break;
						// }
						// }
					});
		},
		cascadeSuggestAndBringBack : function($input, json) {
			// 在这里可以截获当前点击选择的某个节点，然后做级联显示的功能 by CFuture.weiwei
			// 初始化当前菜单
			// 将级联菜单url替换掉
			var cascadeSuggest = $input.attr("cascadeSuggestId");

			if (cascadeSuggest) {
				var suggestUrlFormat = $("#" + cascadeSuggest).attr(
						'suggestUrlFormat');
				var suggestUrl = $("#" + cascadeSuggest).attr('suggestUrl');
				var suggestUrlFormatParams = $input.attr(
						'cascadeSuggestUrlFormatParam').split(",");
				for (i = 0; i < suggestUrlFormatParams.length; i++) {
					suggestUrl = suggestUrlFormat.replace("$s" + (i + 1),
							json[suggestUrlFormatParams[i]]);
				}
				$("#" + cascadeSuggest).attr('suggestUrl', suggestUrl);
				$("#" + cascadeSuggest).attr("alt", "请选择");
				// 清空给定的dom
				var clearId = $input.attr("clearId");
				if (clearId) {
					var clearIds = clearId.split(",");
					for ( var j = 0; j < clearIds.length; j++) {
						$("#" + clearIds[j]).attr("value", "");
					}
				}

				// 级联“查找带回”的URL变换
				var cascadeLookup = $input.attr("cascadeLookupId");
				if (cascadeLookup) {
					var lookupUrlFormat = $("#" + cascadeLookup).attr(
							'lookupUrlFormat');
					var lookupUrl = $("#" + cascadeLookup).attr('href');
					var lookupUrlFormatParams = $input.attr(
							'cascadeLookupUrlFormatParam').split(",");
					for ( var i = 0; i < lookupUrlFormatParams.length; i++) {
						lookupUrl = lookupUrlFormat.replace("$s" + (i + 1),
								json[lookupUrlFormatParams[i]]);
					}
					$("#" + cascadeLookup).attr('href', lookupUrl);
				}
				// 关闭当前打开的对话框面板
				// $.pdialog.closeCurrent();
			}

		},
		bringBack : function(args) {
			$.bringBackSuggest(args);
			// wonder add 增加，对于返回json的第一个设置全选焦点，可以在全选焦点失去时调用函数做更多的事
			for ( var key in args) {
				var _o = document.getElementById(key);
				if (_o != null) {
					_o.select();
				}
				break;
			}

			$.pdialog.closeCurrent();
		}
	});

	$.fn
			.extend({
				lookup : function() {
					return this.each(function() {
						var $this = $(this), options = {
							mask : true,
							width : $this.attr('width') || 820,
							height : $this.attr('height') || 400,
							maxable : eval($this.attr("maxable") || "true"),
							resizable : eval($this.attr("resizable") || "true")
						};
						$this.click(function(event) {
							_lookup = $.extend(_lookup, {
								currentGroup : $this.attr("lookupGroup") || "",
								currentName : $this.attr("lookupName") || "",
								index : parseInt($this.attr("index") || -1)
							});
							$.pdialog.open($this.attr("href"), "_blank", $this
									.attr("title")
									|| $this.text(), options);
							event.preventDefault();
						});
					});
				},
				suggest : function() {
					var op = {
						suggest$ : "#suggest",
						suggestShadow$ : "#suggestShadow"
					};
					var selectedIndex = -1;
					return this
							.each(function() {
								var $input = $(this)
										.attr('autocomplete', 'off')
										.keydown(
												function(event) {
													if (event.keyCode == DWZ.keyCode.ENTER)
														return false; // 屏蔽回车提交
												});

								// -----------------------------------------------
								_GLOBAL_OPEN_TYPE = "navTab";
								var tmp_open_type = $input.attr("openType");
								if (tmp_open_type != undefined)
									_GLOBAL_OPEN_TYPE = tmp_open_type;
								// --------------------------add by
								// weiwei--2011-12-14-----------

								var suggestFields = $input
										.attr('suggestFields').split(",");

								function _show() {
									var offset = $input.offset();
									var iTop = offset.top + this.offsetHeight;
									var $suggest = $(op.suggest$);
									if ($suggest.size() == 0)
										$suggest = $('<div id="suggest"></div>')
												.appendTo($('body'));

									$suggest.css({
										left : offset.left + 'px',
										top : iTop + 'px'
									}).show();

									_lookup = $.extend(_lookup, {
										currentGroup : $input
												.attr("lookupGroup")
												|| "",
										currentName : $input.attr("lookupName")
												|| "",
										index : parseInt($input.attr("index")
												|| -1)
									});

									$
											.ajax({
												type : 'POST',
												dataType : "json",
												url : $input.attr("suggestUrl"),
												cache : false,
												data : {
													inputValue : $input.val()
												},
												success : function(response) {
													if (!response)
														return;
													var html = '';

													$
															.each(
																	response,
																	function(i) {
																		var liAttr = '', liLabel = '';

																		for ( var i = 0; i < suggestFields.length; i++) {
																			var str = this[suggestFields[i]];
																			if (liLabel)
																				liLabel += '-';
																			liLabel += str;

																			if (liAttr)
																				liAttr += ',';
																			liAttr += suggestFields[i]
																					+ ":'"
																					+ str
																					+ "'";
																		}
																		html += '<li lookupId="'
																				+ this["id"]
																				+ '" lookupAttrs="'
																				+ liAttr
																				+ '">'
																				+ liLabel
																				+ '</li>';
																	});
													$suggest
															.html(
																	'<div style=\'height:300px; overflow-y:auto; overflow-x:hidden;\'><ul>'
																			+ html
																			+ '</ul></div>')
															.find("li")
															.hoverClass(
																	"selected")
															.click(
																	function() {
																		_select($(this));
																	});
												},
												error : function() {
													$suggest.html('');
												}
											});

									$(document).bind("click", _close);
									return false;
								}
								function _select($item) {
									var jsonStr = "{id:'"
											+ $item.attr('lookupId') + "',"
											+ $item.attr('lookupAttrs') + "}";
									$.bringBackSuggest(DWZ.jsonEval(jsonStr));
								}

								function _close() {
									// 关闭suggest不断地请求事件
									$(op.suggest$).html('').hide();
									selectedIndex = -1;
									$(document).unbind("click", _close);
								}

								$input.focus(_show).click(false).keyup(
										function(event) {
											var $items = $(op.suggest$).find(
													"li");
											switch (event.keyCode) {
											case DWZ.keyCode.ESC:
											case DWZ.keyCode.TAB:
											case DWZ.keyCode.SHIFT:
											case DWZ.keyCode.HOME:
											case DWZ.keyCode.END:
											case DWZ.keyCode.LEFT:
											case DWZ.keyCode.RIGHT:
												break;
											case DWZ.keyCode.ENTER:
												_close();
												break;
											case DWZ.keyCode.DOWN:
												if (selectedIndex >= $items
														.size() - 1)
													selectedIndex = -1;
												else
													selectedIndex++;
												break;
											case DWZ.keyCode.UP:
												if (selectedIndex < 0)
													selectedIndex = $items
															.size() - 1;
												else
													selectedIndex--;
												break;
											default:
												_show();
											}
											$items.removeClass("selected");
											if (selectedIndex >= 0) {
												var $item = $items.eq(
														selectedIndex)
														.addClass("selected");
												_select($item);
											}
										});
							});
				},

				itemDetail : function() {
					return this
							.each(function() {
								var $table = $(this).css("clear", "both"), $tbody = $table
										.find("tbody");
								var itemDetail = $table.attr("itemDetail")
										|| "", fields = [];

								$table
										.find("tr:first th[type]")
										.each(
												function() {
													var $th = $(this);
													var field = {
														type : $th.attr("type")
																|| "text",
														patternDate : $th
																.attr("pattern")
																|| "yyyy-MM-dd",
														name : $th.attr("name")
																|| "",
														size : $th.attr("size")
																|| "12",
														enumName : $th
																.attr("enumName")
																|| "",
														enumUrl : $th
																.attr("enumUrl")
																|| "",
														lookupName : $th
																.attr("lookupName")
																|| "",
														lookupUrl : $th
																.attr("lookupUrl")
																|| "",
														suggestUrl : $th
																.attr("suggestUrl"),
														suggestFields : $th
																.attr("suggestFields")
													};
													fields.push(field);
												});

								$tbody.find("a.btnDel").click(
										function() {
											var $btnDel = $(this);
											function delDbData() {
												$.ajax({
													type : 'POST',
													dataType : "json",
													url : $btnDel.attr('href'),
													cache : false,
													success : function() {
														$btnDel.parents(
																"tr:first")
																.remove();
														initSuffix($tbody);
													},
													error : DWZ.ajaxError
												});
											}

											if ($btnDel.attr("title")) {
												alertMsg.confirm($btnDel
														.attr("title"), {
													okCall : delDbData
												});
											} else {
												delDbData();
											}

											return false;
										});

								if (!$table.hasClass('noadd')) {
									var $addBut = $(
											'<div class="button"><div class="buttonContent"><button type="button">新建</button></div></div>')
											.insertBefore($table)
											.find("button");
									var $rowNum = $(
											'<input type="text" name="dwz_rowNum" class="textInput" style="margin:2px;" value="1" size="2"/>')
											.insertBefore($table);

									var trTm = "";
									$addBut.click(function() {
										if (!trTm)
											trTm = trHtml(fields, itemDetail);
										var rowNum = 1;
										try {
											rowNum = parseInt($rowNum.val())
										} catch (e) {
										}

										for ( var i = 0; i < rowNum; i++) {
											var $tr = $(trTm.replaceAll(
													"#index#", $tbody.find(
															">tr").size()));
											$tr.appendTo($tbody).initUI().find(
													"a.btnDel").click(
													function() {
														$(this).parents(
																"tr:first")
																.remove();
														initSuffix($tbody);
														return false;
													});
										}
									});
								}
							});

					/**
					 * 删除时重新初始化下标
					 */
					function initSuffix($tbody) {
						$tbody.find('>tr').each(
								function(i) {
									$(':input', this).each(
											function() {
												var $input = $(this);
												var name = $input.attr('name')
														.replaceAll(
																'\[[0-9]+\]',
																'[' + i + ']');
												$input.attr('name', name);
											});
								});
					}
					function tdHtml(field, itemDetail) {
						var html = '', fieldName = itemDetail + '[#index#].'
								+ field.name;
						var lookupFieldName = itemDetail + '[#index#].dwz_'
								+ field.lookupName + '.' + field.name;
						switch (field.type) {
						case 'del':
							html = '<a href="javascript:void(0)" class="btnDel">删除</a>';
							break;
						case 'lookup':
							var suggestFrag = '';
							if (field.suggestFields) {
								suggestFrag = 'autocomplete="off" lookupGroup="'
										+ itemDetail
										+ '" lookupName="'
										+ field.lookupName
										+ '" index="#index#" suggestUrl="'
										+ field.suggestUrl
										+ '" suggestFields="'
										+ field.suggestFields + '"';
							}

							html = '<input type="hidden" name="' + itemDetail
									+ '[#index#].' + field.lookupName
									+ '.id"/>' + '<input type="text" name="'
									+ lookupFieldName + '"' + suggestFrag
									+ ' size="' + field.size + '"/>'
									+ '<a class="btnLook" href="'
									+ field.lookupUrl + '" lookupGroup="'
									+ itemDetail + '" lookupName="'
									+ field.lookupName
									+ '" index="#index#" title="查找带回">查找带回</a>';
							break;
						case 'attach':
							html = '<input type="hidden" name="'
									+ itemDetail
									+ '[#index#].'
									+ field.lookupName
									+ '.id"/>'
									+ '<input type="text" name="'
									+ lookupFieldName
									+ '" size="'
									+ field.size
									+ '" readonly="readonly"/>'
									+ '<a class="btnAttach" href="'
									+ field.lookupUrl
									+ '" lookupGroup="'
									+ itemDetail
									+ '" lookupName="'
									+ field.lookupName
									+ '" index="#index#" width="560" height="300" title="查找带回">查找带回</a>';
							break;
						case 'enum':
							$.ajax({
								type : "POST",
								dataType : "html",
								async : false,
								url : field.enumUrl,
								data : {
									enumName : field.enumName,
									inputName : fieldName
								},
								success : function(response) {
									html = response;
								}
							});
							break;
						case 'date':
							html = '<input type="text" name="'
									+ fieldName
									+ '" class="date" pattern="'
									+ field.patternDate
									+ '" size="'
									+ field.size
									+ '"/>'
									+ '<a class="inputDateButton" href="javascript:void(0)">选择</a>';
							break;
						case 'datetime':
							html = '<input type="text" name="'
									+ fieldName
									+ '" class="date" pattern="'
									+ field.patternDatetime
									+ '" size="'
									+ field.size
									+ '"/>'
									+ '<a class="inputDateButton" href="javascript:void(0)">选择</a>';
							break;
						default:
							html = '<input type="text" name="' + fieldName
									+ '" size="' + field.size + '"/>';
							break;
						}
						return '<td>' + html + '</td>';
					}
					function trHtml(fields, itemDetail) {
						var html = '';
						$(fields).each(function() {
							html += tdHtml(this, itemDetail);
						});
						return "<tr>" + html + "</tr>";
					}
				},

				selectedTodo : function(options) {

					function _getIds(selectedIds) {
						var ids = "";
						navTab.getCurrentPanel().find("input:checked").filter(
								"[name='" + selectedIds + "']").each(
								function(i) {
									var val = $(this).val();
									ids += i == 0 ? val : "," + val;
								});
						return ids;
					}
					return this.each(function() {
						var $this = $(this);
						var selectedIds = $this.attr("rel") || "ids";
						var postType = $this.attr("postType") || "map";

						$this.click(function() {
							var ids = _getIds(selectedIds);
							if (!ids) {
								alertMsg.error($this.attr("warn")
										|| DWZ.msg("alertSelectMsg"));
								return false;
							}
							function _doPost() {
								$.ajax({
									type : 'POST',
									url : $this.attr('href'),
									dataType : 'json',
									cache : false,
									data : function() {
										if (postType == 'map') {
											return $.map(ids.split(','),
													function(val, i) {
														return {
															name : selectedIds,
															value : val
														};
													})
										} else {
											var _data = {};
											_data[selectedIds] = ids;
											return _data;
										}
									}(),
									success : navTabAjaxDone,
									error : DWZ.ajaxError
								});
							}
							var title = $this.attr("title");
							if (title) {
								alertMsg.confirm(title, {
									okCall : _doPost
								});
							} else {
								_doPost();
							}
							return false;
						});

					});
				}
			});
})(jQuery);
