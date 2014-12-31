<?PHP	if (!defined('BASEPATH')) exit(' No direct script access allowed');
	require('smarty/libs/Smarty.class.php');
class Mysmarty extends Smarty{

	public function __construct() {
		parent::__construct();
		$config = & get_config();
		$this->template_dir = APPPATH . 'views/template/';
		$this->compile_dir = APPPATH . 'views/templates_c/';
		$this->addConfigDir(APPPATH . 'configs/');
		$this->cache_dir = APPPATH . 'views/cache/';
		$this->left_delimiter = '{%';
		$this->right_delimiter = '%}';
	}
}
?>
