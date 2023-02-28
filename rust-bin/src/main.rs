use log::info;

const LOG_CONFIG: &str = "config/log4rs.yml";

fn main() {
    let log_config = log4rs::config::load_config_file(LOG_CONFIG, Default::default()).unwrap();
    let _log_handle = log4rs::init_config(log_config).unwrap();

    info!("Hello, world!");
    info!("1 + 2 = {}", rust_lib::add(1, 2));
}
