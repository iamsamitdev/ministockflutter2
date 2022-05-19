/*
GestureDetector(
                      onTap: () async {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: context.width(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: "demo",
                              child: cachedImage(
                                'http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/angry-father-scolds-daughter-wife-family-problems_183219-4082.jpeg', 
                                height: 150, 
                                width: 150, 
                                fit: BoxFit.cover)
                                .cornerRadiusWithClipRRect(10)
                                .visible(
                                  "http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/angry-father-scolds-daughter-wife-family-problems_183219-4082.jpeg".isNotEmpty, 
                                  defaultWidget: Image.asset(
                                  greyImage, 
                                  fit: BoxFit.cover, 
                                  height: 150, 
                                  width: 150)
                                  .cornerRadiusWithClipRRect(10)
                                ),
                            ),
                            8.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    parseHtmlString("Are you an authoritative parent? Here’s why it is good for your child"),
                                    style: boldTextStyle(color: Theme.of(context).textTheme.headline6!.color, size: textSizeMedium),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  8.height,
                                  Text(
                                    parseHtmlString('<p>Do you allow your children to take independent decisions even while setting boundaries for them? In that case, you might be an authoritative parent.</p> <p>An authoritative parenting style is quite different from taking the authoritarian approach and calls for being nurturing and listening to kids rather than talking down to them and blindly enforcing rules. In the 1960s, developmental psychologist Diana Baumrind identified three <a class="" href="https://indianexpress.com/article/parenting/family/parenting-trends-2019-5611836/">parenting styles</a>–authoritative, authoritarian and permissive–based on the behaviour exhibited by preschoolers. Of these, the authoritative parenting style is characterised by high expectations and high responsiveness. An authoritative parent is responsive to the child’s needs but not indulgent. The parent sets rules and boundaries by open discussion and reasoning, which is why this parenting style is also called “democratic”.</p> <h2>Characteristics of authoritative parents</h2> <p>According to Baumrind, here are some common characteristics of authoritative parents:</p> <p>1. They listen to their children.</p> <p>2. They allow their children to express opinions.</p> <p>3. They encourage their children to discuss options.</p> <p>4. They foster independence and reasoning.</p> <p>5. They place limits, consequences, and expectations on their children’s behavior.</p> <p>6. They express warmth and nurturing.</p> <p>7. They administer fair and consistent discipline when rules are broken.</p> <p>8. They expect kids to act with responsibility but if they don’t, they are not given extreme punishment or allowed to get away with bad behaviour.</p> <div class="wp-block-image"><figure class="aligncenter size-large"><img loading="lazy" width="759" height="422" src="http://localhost/flutter_news_api/wp-content/uploads/2021/06/authoritative1.jpg" alt="Encourage kids to talk about their feelings. (Source: Getty Images)" class="wp-image-23" srcset="http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/authoritative1.jpg 759w, http://192.168.1.49/flutter_news_api/wp-content/uploads/2021/06/authoritative1-300x167.jpg 300w" sizes="(max-width: 759px) 100vw, 759px" /><figcaption>Encourage kids to talk about their feelings. (Source: Getty Images)</figcaption></figure></div> <h2>Impact of authoritative parenting on children</h2> <p>As per Baumrind’s research, children with authoritative parents showed greater competence, exceptional maturity, assertiveness and self-control. According to Krevans &amp; Gibbs, such children display high levels of moral reasoning, moral conscience and prosocial behaviour. Again, children reared by authoritative parenting have a better mental health condition, as per a study published in European Online Journal of Natural and Social Sciences 2013. “Authoritative parents have unconditional love and acceptance of their children. Expressing love and acceptance helps children to feel safe. Secure children whose parents are authoritative are often cheerful, happy and have good mental health,” the study concluded.</p> <h2>Ways to practice authoritative parenting</h2> <h2>Encourage kids to talk about their feelings</h2> <p>Regular communication will allow you to gauge your child’s mood and draw them out when you feel they’re holding back something. Talk to them daily about their day at school, likes and dislike, favourite part of their day, etc. Create a safe space to confide in you if they are scared or upset.</p> <h2>Let them express their opinions</h2> <p>Allow your child to develop a mind of their own. Ask them why they prefer a certain toy, get their opinion on what they would like to sketch, games they like to play, etc. You could also check with them if you’re planning a vacation and allow them to pick places or suggest things to do during the holiday.</p> <h2>Make them self-reliant</h2> <p>Get them used to doing chores at an early age, even if it’s just putting away their play things or setting the table before meals, as they grow older. Watering plants, arranging their bookshelf or study table are some other useful chores. This will teach them to be independent in the long run.</p> <h2>Teach them discipline</h2> <p>By allowing kids to take charge of certain areas of their lives, you are teaching them key life skills. Let them make their own timetable for exams, plan their homework schedule and decide when they can have a cheat day for desserts or junk food</p>'),
                                    style: secondaryTextStyle(size: textSizeSMedium),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  8.height,
                                  Align(
                                    child: Text(DateFormat.yMMMMd('en_US').format(DateTime.parse('2021-06-19T03:23:10')), style: secondaryTextStyle(size: 11)),
                                    alignment: Alignment.centerRight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


------------------------------------


                    Container(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          print("OK");
                        },
                        child: Card(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/pic.jpg'),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'The Dark Truth About Baby Cereal',
                                        style: TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Baby cereal was first introduced in the 1930s, which was when a monumental shift occurred away from real foods towards processed convenience foods. Previously known as pablum',
                                        style: TextStyle(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )

*/
