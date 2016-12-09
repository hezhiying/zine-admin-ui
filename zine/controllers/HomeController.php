<?php
namespace zine\controllers;

use wulaphp\io\Response;
use wulaphp\mvc\controller\Controller;
use wulaphp\mvc\view\JsonView;
use wulaphp\router\Router;

class HomeController extends Controller {

	public function login() {
		return view();
	}
	public function index() {
		// 可以按需修改
		$comps = apply_filter('home\comps', []);

		return view(['comps' => $comps]);
	}

	public function test() {
		return 'test';
	}

	public function laohe() {
		$data['template'] = '<h1>aaaa</h1>';

		return new JsonView($data);
	}

	public function user() {
		return 'user';

	}

	public function abc() {

		return view();
	}

	public function bcd() {
		return view();
	}

	public function bbb() {
		return view();
	}
	public function conf() {
		$conf = array();

		$conf['menus'] = [
			['id' => 1, 'name' => '系统设置', 'title' => '系统设置导航', 'icon' => '', 'url' => '', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>1,
			 'child' => [
				 ['id' => 2, 'name' => '网站设置', 'title' => '网站设置', 'url' => '#zine/home/abc', 'icon' => '<i class="fa fa-user-md"></i>','level'=>2,'child'=>[]],
				 ['id' => 3, 'name' => '缓存设置', 'title' => '缓存设置', 'url' => '#zine/home/bcd', 'icon' => '<i class="fa fa-car"></i>','level'=>2]
			 ]
			],
		    [
		    	'id'=>'21',
			    'name' => '文章管理',
			    'title' => '文章管理',
			    'icon' => '',
			    'url' => '', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>1,
		        'child'=>[
			       [ 'id'=>'22',
			         'name' => '栏目设置',
			         'title' => '栏目设置',
			         'icon' => '',
			         'url' => '#zine/home/bbb', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>2,
			         'child'=>[
			         	['id'=>'223',
			             'name' => '用户列表',
			             'title' => '用户列表',
			             'icon' => '',
			             'url' => '#zine/home/user', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>3,
			             'child'=>[]
			            ],
			            ['id'=>'224',
			             'name' => '添加用户',
			             'title' => '添加用户',
			             'icon' => '',
			             'url' => '', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>3,
			             'child'=>[
				             ['id'=>'2244',
				              'name' => 'VIP用户',
				              'title' => 'VIP用户',
				              'icon' => '',
				              'url' => '#zine/home/list', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>4,
				             ]
			             ]
			            ]

			         ]
			       ],
			       [ 'id'=>'22',
			         'name' => 'Form组件',
			         'title' => 'Form组件',
			         'icon' => '<i class="fa fa-cube"></i>',
			         'url' => '#zine/html/console-title', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>2,
			         'child'=>[
				         ['id'=>'223',
				          'name' => 'console-title',
				          'title' => 'console-title',
				          'icon' => '',
				          'url' => '#zine/html/console-title', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>3,
				          'child'=>[]
				         ],
				         ['id'=>'224',
				          'name' => 'button',
				          'title' => 'button',
				          'icon' => '',
				          'url' => '#zine/html/button', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>3,

				         ],
				         ['id'=>'224',
				          'name' => 'table',
				          'title' => 'table',
				          'icon' => '',
				          'url' => '#zine/html/table', 'target' => '', 'textCls' => '', 'textStyle' => '', 'iconStyle' => '', 'iconCls' => '','level'=>3,

				         ]

			         ]
			       ]
		        ]
		    ]

		];
		return $conf;
	}
	public function acdd(){

		$table = new HtmlTable();
		$table->col['id'] = '';
		$data['table'] = $table;
	}
}