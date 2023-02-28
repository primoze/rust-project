use log::info;

pub fn add(left: usize, right: usize) -> usize {
    info!("add {} + {} = {}", left, right, left + right);
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
