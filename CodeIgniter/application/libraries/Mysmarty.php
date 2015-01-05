<?PHP	if (!defined('BASEPATH')) exit(' No direct script access allowed');
	require('smarty/libs/Smarty.class.php');
class Mysmarty extends Smarty{

	public function __construct() {
		parent::__construct();
		$relate_path = '/home/vein/myTP_related/';
		$config = & get_config();
		$this->template_dir = $relate_path . 'views/template/';
		$this->compile_dir = $relate_path . 'views/templates_c/';
		$this->addConfigDir($relate_path . 'config/');
		$this->cache_dir = $relate_path . 'views/cache/';
		$this->caching = false;
		$this->left_delimiter = '{%';
		$this->right_delimiter = '%}';
	}
}
?>
