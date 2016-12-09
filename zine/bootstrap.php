<?php
namespace zine;

use wulaphp\app\App;
use wulaphp\app\Module;

class ZineModule extends Module {
	public function getName() {
		return 'zine modules';
	}

	public function getDescription() {
		return 'test';
	}

	public function getHomePageURL() {
		return 'http://www.wulaphp.com/';
	}

	/**
	 * @param $comps
	 * @return array
	 * @bind home\comps
	 */
	public function abc($comps){
		$comps['laohe'] = App::url('zine/home/laohe');
		return $comps;
	}
}

App::register(new ZineModule());
