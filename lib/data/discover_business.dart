class DiscoverBusiness {
  final String title, discription, avatarUrl, imageUrl;
  final bool offer;

  DiscoverBusiness(
      this.title, this.discription, this.avatarUrl, this.imageUrl, this.offer);
}

List<DiscoverBusiness> discoverB = [
  DiscoverBusiness(
      'Zomato',
      '10% offer',
      'https://seeklogo.com/images/Z/zomato-logo-AD6823E433-seeklogo.com.png',
      'https://www.zomato.com/blog/wp-content/uploads/2020/06/HEADER_FINAL.png',
      true),
  DiscoverBusiness(
      'Trains',
      'Tickets with IRCTC',
      'https://iconape.com/wp-content/png_logo_vector/train.png',
      'https://www.railway-technology.com/wp-content/uploads/sites/24/2018/06/indianrailways.jpg',
      true),
  DiscoverBusiness(
      'Swiggy',
      '10% offer',
      'https://dealtm.com/wp-content/uploads/2020/08/Swiggy.png',
      'https://files.pitchbook.com/website/files/jpg/featured_in_post.jpg',
      false),
  DiscoverBusiness(
      'redBus',
      'Bus rides throughout India',
      'https://i2.wp.com/ebinphilip.com/wp-content/uploads/2019/06/redbus-logo-png-1.png?ssl=1',
      'https://couponswala.com/blog/wp-content/uploads/2019/08/Redbus-Referral-Code.jpg',
      false)
];
