<?PHP
defined('BASEPATH') or exit ('No direct script access allowed');

/**
 * User defined Exception Class `MY_Exception`
 * 用户json 格式打印日志信息， 同时记录日志错误。 
*/
class MY_Exception extends Exception {
	
	public function __construct($message=null, $code=0) {
		parent::__construct($message, $code);
	}


	/**
	 * console 错误信息。
 	 *
	*/	
	public function console() {
		$arr = array(
			'errno' => $this->code,
			'msg' => $this->message ?: 'no',
			'file' => $this->file,
			'line' => $this->line
		);

		echo json_encode($arr);
		die;
	}
	
	/**
	 * log 日志
	 *
	*/
	public function log($message) {
		$filePath =  '/home/vein/log/';
		$fileSuffix = date('Y-m-d_H');
		$fileName = $filePath . 'blog_' . $fileSuffix . '.log';	
		if (file_exists($fileName)) {
			$flag = touch($fileName, date('Y-m-d H'), date('Y-m-d H'));
			if (!$flag) {
				trigger_error('Sorry, can`t create file ' . $fileName, E_USER_ERROR);
			}
			$msg = '[' . date('Y-m-d H:i:s') . ']' . 'msg:' . $message;
			file_put_contents($fileName, $msg . PHP_EOL, FILE_APPEND);
		}
	}

}
?>
