<?php
namespace zine\controllers;

use wulaphp\io\Response;
use wulaphp\mvc\controller\Controller;
use wulaphp\mvc\view\JsonView;
use wulaphp\router\Router;

class HtmlController extends Controller {
	public function consoleTitle() {
		return view();
	}

	public function table() {
		return view();
	}

	public function button() {
		return view();
	}
}