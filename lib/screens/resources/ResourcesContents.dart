

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:url_launcher/url_launcher.dart';


class ResourcesContents {

  final arrResourcesAdditionalRelated = [
    'Flushing Out IBS',
    'Monash Low Fodmap Diet',
    'CDHF.ca',
    'CDHF. 2019. Evidence Based Ways to Manage IBS.',
     'CDHF. 2020. CDHF Talks: IBS and the Gut Microbiome.',
     'CDHF. 2021. The Latest Clinical Approaches for IBS.',
     'CDHF. 2021. Long Term Benefits of Cognitive Behavioural Therapy for IBS.',
     'CDHF. 2019. The Importance of Managing Stress for People who Suffer from IBS.',
     'Hoyle, B. 2013. Prescription Medication Must-Haves for IBS.',
     'IFFGD. 2018. Cognitive Behavioral Therapy for IBS.',
     'IFFGD. N.d. Sleep and Irritable Bowel Syndrome.',
     'Johannesson, E. 2011. Physical activity improves symptoms in irritable bowel syndrome: a randomized controlled trial.',
     'Monash University. N.d. Starting the FODMAP diet.',
     'Nunez, K. 2020. How to Exercise with Irritable Bowel Syndrome.',
     'Qin, H. 2020. Impact of psychological stress on irritable bowel syndrome.',
  ];

  final arrResourcesAdditionalRelatedLinks = [
    'https://www.flushingoutibs.ca/',
    'https://www.monashfodmap.com/',
    'https://cdhf.ca/digestive-disorders/irritable-bowel-syndrome-ibs/',
  'https://cdhf.ca/health-lifestyle/evidence-based-ways-to-manage-ibs-infographic/',
  'https://cdhf.ca/digestive-disorders/irritable-bowel-syndrome-ibs/ibs-and-the-gut-microbiome/',
  'https://cdhf.ca/health-lifestyle/the-latest-clinical-approaches-for-ibs-infographic/',
  'https://cdhf.ca/health-lifestyle/long-term-benefits-of-cognitive-behavioural-therapy-for-ibs/',
  'https://cdhf.ca/health-lifestyle/the-importance-of-managing-stress-for-people-who-suffer-from-ibs/',
  'https://www.everydayhealth.com/ibs/ibs-prescription-medications.aspx',
  'https://aboutibs.org/treatment/psychological-treatments/cognitive-behavioral-therapy/',
  'https://aboutibs.org/signs-and-symptoms/sleep-and-irritable-bowel-syndrome/',
  'https://pubmed.ncbi.nlm.nih.gov/21206488/',
  'https://www.monashfodmap.com/ibs-central/i-have-ibs/starting-the-low-fodmap-diet/',
  'https://www.healthline.com/health/digestive-health/ibs-and-exercise',
  'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4202343/',
  ];

  final arrResourcesImages = [
    'resources_1.png',
    'resources_2.png',
    'resources_3.png',
    'resources_4.png',
    'resources_1.png',
    'resources_2.png',
  ];

  final arrResources = [
    'Think you may have IBS?',
    'What is IBS?',
    'Signs and Symptoms of IBS',
    'Lifestyle & Dietary Changes for IBS',
    'IBS Frequently Asked Questions',
    'Statistics',
    'Links to Additional IBS Related Content',
  ];

  final arrResourcesDescription = [
    RichText(
      text: TextSpan(
          text:  'Abdominal pain, bloating, cramps, constipation, diarrhea… we all experience these not-so-pleasant tummy troubles from time to time. But when these symptoms present themselves on a regular basis and negatively affecting your quality of life, it can leave you wondering if there is a bigger problem at hand. Never fear, CDHF is here! Below we have outlined the common symptoms associated with IBS, and how it is typically diagnosed. Please note: this information should not be used as a substitute for the medical care and advice of your physician'
  'So.. what is IBS and what are the common symptoms?'
  'Irritable bowel syndrome (IBS) is a disorder affecting the intestine. IBS involves problems with motility (movement of digested food through the intestines) and sensitivity (how the brain interprets signals from the intestinal nerves), leading to abdominal pain, changes in bowel patterns and other symptoms. Although often disruptive, debilitating and embarrassing, it may be some comfort to know that IBS is NOT life-threatening, nor does it lead to cancer or other more serious illnesses.'
  'IBS is very common. In fact, Canada has one of the highest rates of IBS in the world, estimated 18% vs. 11% globally. (Lovell et al. 2012) The exact cause of IBS is unknown, however, it is believed that IBS may be caused by one of several factors. In some, it may be linked to a prior infection or event which disrupts the normal functioning of the intestines.'

  '\n\nIt is common for people to develop IBS following a gastrointestinal infection, food poisoning, traveller’s diarrhea, surgery, a change in diet or the use of medications. In others, an imbalance of intestinal bacteria or a change in the body’s level of hormones, immune signaling in the bowel wall or neurotransmitters (brain chemicals) may also lead to the development of IBS. Currently, there is a great deal of interest in possible alterations in the number or type of bacteria within the intestine, but the exact role this may play in IBS is not yet known.'

  '\n\nIBS is not a single entity. It’s a collection of abdominal and bowel-related symptoms. Symptoms common in IBS that support a diagnosis are:'

  '\n\nAbdominal pain'
  'Bloating'
  'Abnormal stool form (hard and/or loose)'
  'Abnormal stool frequency (less than three times per week or over three times per day)'
  'Straining at defecation'
  'Urgency'
  'Cramps'
  'Feeling like you haven’t completely emptied your bowels when you do go Mucus in stool'
  'To distinguish IBS from temporary tummy troubles, experts have emphasized the chronic (long-lasting) and relapsing nature of IBS and use a criteria based on the occurrence rate of symptoms and their duration to diagnose it (Quigley, et al, 2016).'

  '\n\nRome IV Criteria'
  '\In May 2016, the Rome Foundation released the new Rome IV criteria for diagnosing IBS. All around the world, physicians follow this organization’s lead when diagnosing IBS.'

  '\n\nAccording to the Rome IV diagnostic criteria, IBS is characterised by recurrent abdominal pain for, on average, at least one day per week in the last three months, associated with two or more of the following:'

  '\n\nSymptoms related to defecation'
  'Symptoms associated with a change in stool frequency'
  'Symptoms associated with a change in form (appearance) of stool'
  'Everyone is different. So are your poops. It’s important to note that the change in your stool could be constipation for some people, diarrhea for others, or alternate between the two. Subtypes of IBS are recognized by the Rome IV criteria based on the person’s reported predominant bowel habit, when not on medications, as follows:'

  '\n\n\nIBS is no joke. People with IBS frequently report feeling depressed, embarrassed and self-conscious. Not being able to predict symptoms places a large burden on daily living. It can limit productivity and performance at work, has a negative effect on the quality of relationships, and limits participation in routine social activity (IBS Impact Report, 2018).'

  '\n\nDo the above symptoms and stool patterns sound like you?'
  'You should see your physician. The American Gastroenterology Association (AGA) recommends to patients three steps to improve communication with their physician:'

  'Speak up early: Talk to a doctor as soon as possible after the onset of symptoms, not just with a friend or family.'
  'Speak up completely: Detail the symptoms to your HCP, including how the symptoms impact your life, mental health, work, and social interactions. A great way you can do this is by downloading our app. It helps you track symptoms daily and organizes them into easy to understand charts and graphs for your doctor.'
  'Speak up Often: Inform the doctor on the evolution of your symptoms after any new treatment efforts so that alternative treatment approaches can begin.'
  'You are Not Alone!'
  'It’s so important to remember you are not alone with IBS. Millions of people just like you may also struggle to find the best ways to manage their symptoms. While working with your healthcare professional, you may also want to join an IBS support group to see how others are living with IBS – such as FlushingOutIBS. Having the opportunity to discuss symptoms and coping strategies with others who are experiencing similar issues is another helpful tool in your tool kit for dealing with IBS.'

  '\n\nApril is IBS Awareness Month! Stay tuned for more articles on IBS including how your microbiome plays a role, evidence based ways to manage IBS, and more tools for living with this condition on a day to day basis.',
          style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
              color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(
                text: '\n\nReferences',
                style: TextStyles.textStyleSettingNotificationsResourceTitle.apply(
                    color: Colors.black
                ),
            ),
            TextSpan(
                text: '\n\nQuigley EM, Fried M, Gwee KA, et al. World Gastroenterology Organisation (WGO) global guidelines irritable bowel syndrome: a global perspective update. J Clin Gastroenterol. 2016;50(9):704-13.'
                    '\n\nAmerican Gastroenterological Association (AGA). IBS in America. Summary Survey Findings 2015.',
                style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                    color: Colors.black
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
            TextSpan(
                text: '\n\nIBS Global Impact Report (2018, accessed March 2019). \n\n',
                style: TextStyles.textStyleSettingResourcesLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final _url = 'https://www.badgut.org/wp-content/uploads/IBS-Global-Impact-Report.pdf';
                    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
                  }
            ),
            TextSpan(
                text: '\n\nLovell RM and Ford AC. Global prevalence of and risk factors for irritable bowel syndrome: A meta-analysis. Clin Gastroenterol Hepatol. 2012 Jul;10(7):712-21.e4.',
                style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                    color: Colors.black
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
          ]
      ),
    ),

    // Todo second
    RichText(
      text: TextSpan(
          text:  ' Irritable bowel syndrome (IBS) is a disorder affecting the intestine. IBS involves problems with motility (movement of digested food through the intestines) and sensitivity (how the brain interprets signals from the intestinal nerves), leading to abdominal pain, changes in bowel patterns and other symptoms. Although often disruptive, debilitating and embarrassing, it may be some comfort to know that IBS is not life-threatening, nor does it lead to cancer or other more serious illnesses.'
              '\n\nCanada has one of the highest rates of IBS in the world, estimated 18% vs 11% globally  (Lovell et al. 2012). However, it is thought that IBS often remains under diagnosed. More than 70% indicate that their symptoms interfere with everyday life and 46% report missing work or school due to IBS. (Gastrointestinal Society 2016).'
              '\n\nPeople with IBS frequently report feeling depressed, embarrassed and self-conscious. Their inability to predict symptoms places significant burden on daily living. IBS limits productivity and performance at work, has a negative effect on the quality of relationships, and limits participation in routine social activity (Gastrointestinal Society 2018).'
              '\n\nIBS also has a personal financial burden with individuals sometimes trying multiple over-the-counter (OTC) treatments and alternative therapies in their quest to be symptom-free; costs can be significant due to the lack of information about the effectiveness of these purported remedies (Gastrointestinal Society 2018).'
              '\n\nThe underlying cause of IBS is still unclear and there is no diagnostic disease markers for IBS. Guidelines recommend doctors make a positive diagnosis using criteria that are based on person’s symptoms.'
              '\n\nSubtypes of IBS are recognised by the Rome IV criteria based on the person’s reported predominant bowel habit, when not on medications, as follows:'

              '\n\nIBS-C: with predominant constipation (Bristol types 1 and 2).'
              'IBS-D: with predominant diarrhea (Bristol types 6 and 7).'
              'IBS-M: with both constipation and diarrhea (Bristol types 1 and 6).'

              '\n\nMore questions? See our top 10 IBS questions: Answered here.'
              '\n\nWhat is IBS-C?'
              '\n\nIrritable bowel syndrome with constipation, also referred to as IBS-C, is a distressing condition that can significantly affect the quality of life of those affected.'
              '\n\nConstipation occurs when digested food moves slowly through the digestive tract. As a result, stool remain in the large intestines for prolonged periods of time where the intestines remove excess water causing stool to become hard, dry, lumpy and difficult to pass.'
              '\n\nWhat is IBS-D?'
              '\n\nIrritable bowel syndrome with diarrhea is IBS with diarrhea as the primary symptom, also referred to as IBS-D.'
              '\n\nPeople with IBS-D experience frequent abdominal pain and watery bowel movements, and, on occasion, loss of bowel control. In fact, approximately 1 out of every 3 people with IBS-D have loss of bowel control or soiling. This has a strong, negative impact on day-to-day life, however these and other symptoms of IBS-D can be managed.'
              '\n\nSound like you?'
              '\n\nYou should see your physician. The American Gastroenterology Association (AGA) recommends to patients three steps to improve communication with their physician:'

              '\n\nSpeak up early: talk to a doctor as soon as possible after the onset of symptoms, not just with a family or friend'
              'Speak up completely: detail the symptoms to your HCP. A great way to do this is by downloading our new app to help you track symptoms daily .'
              'Speak up often: Inform the doctor on the evolution of your symptoms after any new treatment efforts so that alternative treatment approaches can begin.'
              'If you think you may have IBS, click here to download our handy Infographic.',
          style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
              color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(
                text: '\n\nReferences',
                style: TextStyles.textStyleSettingNotificationsResourceTitle.apply(
                    color: Colors.black
                ),
            ),
            TextSpan(
                text: '\n\nCitations'
                    '\n\nGastrointestinal Society. 2018.',
                style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                    color: Colors.black
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
            TextSpan(
                text: '\n\nIBS Global Impact Report 2018.  [accessed 3 September 2018',
                    style: TextStyles.textStyleSettingResourcesLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final _url = 'https://badgut-5q10xayth7t3zjokbv.netdna-ssl.com/wp-content/uploads/IBS-Global-Impact-Report.pdf';
                    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
                  }
            ),
            TextSpan(
                text:
                    '\n\nGastrointestinal Society. 2016. 2016 Survey Report: Irritable bowel syndrome. [accessed 3 September 2018'
                    '\n\nLovell RM and Ford AC. Global prevalence of and risk factors for irritable bowel syndrome: A meta-analysis. Clin Gastroenterol Hepatol. 2012 Jul;10(7):712-21.e4.',
                style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                    color: Colors.black
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
          ]
      ),
    ),

    // Todo third
    RichText(
      text: TextSpan(
          text:
          'Abdominal pain'
              '\nAbnormal stool frequency'
              '\nUrgency'
              '\nCramps'
              '\nBloating'
              '\nAbnormal stool from'
              '\nStraining at defecation'
              '\nFeeling like you haven’t completely emptied your bowels'
              '\nMucus in stool'
              '\nWhile most people experience digestive troubles once in a while, what sets IBS apart is abdominal pain and diarrhea or constipation that comes back again and again. At times, the pain and discomfort of IBS symptoms may be severe and debilitating, and at other times, they may improve or even disappear completely.'

              '\n\nSigns & symptoms of IBS with constipation (IBS-C)'

              '\n\nWhen living with IBS-C, symptoms may suddenly worsen (flare) and then improve for no apparent reason. When symptoms flare, they may be severe, debilitating and last for days or months. Possible signs and symptoms of IBS-C are:'

              '\n\nabdominal pain or discomfort'
              'gas, bloating and abdominal distention'
              'straining when having a bowel movement'
              'a sense that something is blocking your rectum'
              'infrequent bowel movements (less than three per week)'
              'feeling like you have not completed your bowel movement other illnesses so that those can be ruled out.'
              'diarrhea or loose, watery stools, especially in the morning or after meals'
              'passing stools three or more times per day'
              'sudden urgency before bowel movements'
              'feeling of incomplete emptying after bowel movements'
              'abdominal pain or cramping'
              'loss of bowel control or soiling yourself'
              'What causes irritable bowel syndrome (IBS)?'

              '\n\nThe exact cause of IBS is unknown, however, it is believed that IBS may be caused by one of several factors. In some patients, it may be linked to a prior infection or event which disrupts the normal functioning of the intestines. It is common for people to develop IBS following a gastrointestinal infection, food poisoning, traveller’s diarrhea, surgery, a change in diet or the use of antibiotics or new medications. In others, an imbalance of intestinal bacteria or a change in the body’s level of hormones, immune signaling in the bowel wall or neurotransmitters (brain chemicals) may also lead to the development of IBS. Currently, there is a great deal of interest in possible alterations in the number or type of bacteria within the intestine, but the exact role this may play in IBS is not yet known. In people with IBS, bowel function can be altered in several ways:'

              '\n\nMotility (movement of contents through the intestines): Normally, waves of coordinated intestinal muscle contractions (peristalsis) transport digested food through the intestines. In people with IBS, the rhythm and coordination of these contractions may be altered. This altered motor function can result in the bowel moving too quickly (causing diarrhea) or too slowly (causing constipation) and can lead to spasm and pain.'
              'Sensitivity (how the brain interprets signals from the intestinal nerves): The network of nerves surrounding the digestive organs may become unusually sensitive. For some people with IBS, even a small change in intestinal activity can trigger the nerves to send messages to the brain causing abdominal pain.'
              'Brain-gut dysfunction:In IBS, there may be problems in how the brain receives and processes sensations coming from the intestines. A malfunction may occur along the many different pathways that connect the brain and gut, interfering with the normal function of the intestines. Many aspects of everyday living can trigger or aggravate IBS symptoms. Triggers vary from person to person, but the most common ones include certain foods, medications, emotional stress and hormone fluctuations. In particular, foods such as caffeine, alcohol, carbonated drinks, fatty foods, certain fruits and vegetables, as well as lactose, fructose and gluten (wheat protein) can cause problems for people with IBS.'
              'Risk factors of IBS'

              '\n\nAge: IBS can affect people of all ages, but it often begins in the teen years or early adulthood.'
              'Gender: IBS affects more women than men.'
              'Family history of IBS: People with a first-degree relative (parent or sibling) with IBS are at greater risk of developing the condition.'
              'What causes IBS with constipation (IBS-C)?'

              '\n\nThe cause of IBS-C is not yet known; however, there are a variety of factors that may contribute to the disorder. These include:'

              '\n\nIntestinal motility: The walls of the intestines are lined with layers of muscles that contract and relax in a coordinated rhythm as they move food from your stomach to your intestines through a process called peristalsis. For those with IBS-C, contractions within the intestine may be reduced or delayed causing gas, bloating and stool to move slower than normal.'
              '\n\nNerve Hyper-Sensitivity: Poorly coordinated signals between the brain and the gut can make your body overreact to the activities taking place during digestion causing increased sensitivity. This may explain why those with IBS-C experience abdominal pain and discomfort. Excess fluid absorption: Constipation results when the intestine absorbs too much fluid from the stool, which can occur because of reduced or delayed contractions. Brain-bowel connection: There is a strong connection between our brain and bowel. This is sometimes called the brain-gut connection. In individuals with IBS-C, a possible disconnect or miscommunication between the mind and gut, may impact motility, pain sensitivity and fluid absorption. This disconnect may result in abdominal pain, discomfort and constipation.'
              'Risks associated with IBS-C'

              '\n\nIf left untreated, IBS-C can potentially lead to additional health complications. These include:'

              '\n\nHemorrhoids: enlarged veins (blood vessels) in the rectum that may bleed or descend through the anus'
              'Anal fissure: a crack in the lining of the anus caused when large or hard stools stretch the anal sphincter'
              'Fecal impaction: a mass of hard stool that cannot be excreted by a normal bowel movement and may need to be removed manually'
              'Rectal prolapse: rectal tissue pushes out through the anus'
              'Lazy bowel syndrome: caused from frequent use of laxatives to have bowel function properly'
              'What causes irritable bowel syndrome with diarrhea (IBS-D)'

              '\n\nAlthough the exact cause of IBS-D is unknown, it is believed that IBS-D may be caused by one of several factors:'

              '\n\nBrain-gut dysfunction: There is a dynamic bidirectional communication between the gut and the brain. A malfunction may occur along the many different pathways that connect the brain and gut and changes in one pathway ultimately cannot affect others.'
              'Bacterial Infection: Food poisoning, traveler’s diarrhea. These infectious agents are cleared from the body typically within days but lead to chronic alterations in motility (gut too fast or too slow) and abnormal sensory signalling to the brain.'
              'Bile acids: These are normally absorbed in the small bowel but some patients spill too many into the large bowel (colon) and this can trigger diarrhea and cramps.'
              'Food Sensitivity: Many patients have meal-induced symptoms. Some patients have a hypersensitive gut and meals induce gut motility (e.g. distention) that can cause symptoms. There is also growing evidence that some food may also have specific actions on gut motility and this could involve alterations in the microbiome or that an individual’s microbiome might also make them more susceptible to specific foods. However much more research is needed in this area.'
              'Use of antibiotics or new medications: Antibiotics can cause an imbalance of intestinal bacteria and other medications a change in the motility in the gut.'
              'Stress and anxiety: These are not the cause of lBS-D but are recognized as a common trigger of symptoms in some individuals.'
              'Heredity: IBS-D can run in families but it is unclear how much of this association is related to some common environment or genetics. Recent research has identified one or more genetic defects that could be involved in a sub-set of IBS but further studies are needed to determine whether these defects are important. Consequently, genetic testing is not indicated.'
              'Risks associated with IBS-D'

              '\n\nIf left untreated, IBS-D can potentially lead to additional health complications. These include:'

              '\n\nDiarrhea may aggravate hemorrhoids in people who already have them.'
              'Eliminating many foods from the diet may result in a diet that is too limited in nutrients that could cause health problems.'
              'Stress and anxiety can result from the pain, and can impact a person’s quality of life.',
          style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
              color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(
                text: '',
                style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                    color: Colors.black
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
            TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
          ]
      ),
    ),

// Todo Forth
    RichText(
      text: TextSpan(
          text: '\n\nThe following lifestyle changes may help to prevent or ease your IBS symptoms:'
              '\n\nExercise regularly to promote movement of the colon and reduce stress. Exercise can take many forms, but 20 to 30 minutes of activity at least three times per week can be helpful.'
              'Get enough rest. A lack of sleep and fatigue can worsen the symptoms of IBS.'
              'Minimize stress and tension. The brain and colon are linked through many complex pathways and emotional stress can disrupt intestinal function and cause pain.'
              'Yoga, meditation, and slow, relaxed breathing techniques can help people with IBS manage stress.'
              'Limit intake of caffeine, alcohol, carbonated drinks and fatty foods.'
              'Follow through on an urge to have a bowel movement, if at all possible.'
              'If you have IBS, you know you have to navigate the world a bit differently than most people. Check out our IBS survival guide infographic here.'


              '\n\nDietary changes for IBS'

              '\n\nFood intolerances have been linked to IBS symptoms for many years, however conflicting information often creates confusion and frustration as to what foods IBS patients should include, or avoid, in their diet. Managing IBS often takes a combination of approaches, as each person may be different. Below are some proactive strategies and treatment options that can help you live your best life!'

              '\n\nRule out lactose intolerance. The symptoms of lactose intolerance (an inability to digest the sugar in milk) and the symptoms of IBS often overlap.'
              'Limit insoluble fibre.  Insoluble fibre (cannot dissolve in water) which is found primarily in wheat bran, brown rice, seeds, nuts, dried fruit and whole grain breads, adds bulk to the stool and can aggravate IBS symptoms in some people. Peeling fruits and vegetables to remove the high insoluble fibre skin or peel can be beneficial.'
              'Increase soluble fibre. Poorly fermentable, soluble fibre remains an evidence-based treatment for IBS. Try slowly increasing dietary fibre by 2 to 3 grams per day to prevent discomfort and to promote soft, painless stools.'
              'Try the low FODMAP diet. Fermentable carbohydrates (also known as FODMAPs), are small carbohydrate (sugar) molecules found in everyday foods that may be poorly absorbed in the small intestine of some people. FODMAPs are fermented (digested) by intestinal bacteria, which can lead to symptoms of abdominal pain, excess gas, constipation and/or diarrhea.'
              'Try a probiotic. Probiotics are live microorganisms that, when taken in adequate amounts over sufficient time, may provide a health benefit. They are natural, ‘healthy’ bacteria that may help with digestion and offer protection from harmful bacteria in the intestines. Studies have found that, in some cases, probiotics may help to improve symptoms of IBS. If other dietary strategies have not been successful, a 4-week trial of a probiotic (in the dose recommended by the manufacturer) may be helpful. Probiotics are not medicine. They are available to purchase as capsules, tablets or powders, and can also be found in some fortified yogurts and fermented milk products. However, not all probiotics are the same. It is important to choose a product that is reliable, proven to be safe and offers benefits for the specific symptoms you want to relieve. Speak to your doctor, dietitian, or pharmacist about which probiotic may be right for you. It is important to take the probiotic in the dose and duration recommended by the manufacturer to achieve the best results.'
              'Lifestyle Changes for IBS-C'

              '\n\nSometimes making simple changes to your lifestyle can be helpful for managing mild IBS-C symptoms such as:'

              '\n\nRegular exercise not only increases your strength, it can also boost bowel activity.'
              'Get enough rest. This allows your body to maintain basic function, repair and manage stress.'
              'As already mentioned, stress can affect bowel function. Try to find ways to manage your stress at home, work or school through good time management practices and prioritizing your health.'
              'Limit alcohol consumption'
              'Don’t smoke'
              'Dietary Changes for IBS-C'

              '\n\nSome foods support good bowel health while others can increase constipation. It is important to recognize the impact certain foods have on your digestive and overall health. Below are a few suggestions that may be helpful:'

              '\n\nReduce gassy foods: If bloating is bothersome or you are passing more than usual amounts of gas, your doctor may suggest eliminating trigger foods such as: carbonated beverages, greasy, fried foods, and refined sugar.'
              'Increase fluids: Try to consume adequate amounts of non-caffeinated, low sugar liquids each day. Healthy fluids include water, juices, milk and low sodium soups. Avoid liquids high in refined sugar or artificial sweeteners.'
              'Increase Soluble fibres: Soluble fibres are derived from plants and cannot be broken down or absorbed. This fibre attracts water and turns into gel during digestion, slowing digestion and making stools soft and easy to pass.'
              'Increase Insoluble fibres: Insoluble fibres are not broken down or absorbed by the digestive system. These fibres add bulk to stool, which helps move stool through the digestive tract.'
              'Explore a low FODMAP Diet: Some individuals are sensitive to types of carbohydrates such as fructose, fructans, lactose and others. These are called FODMAPs (fermentable oligo-, di-, and monosaccharides and polyols). FODMAPs are found in certain grains, vegetables, fruits and dairy products.'
              'Lifestyle and Diet Changes for IBS-D:'

              '\n\nIdentify food triggers – Tracking foods you eat and logging the times you experienced symptoms/distress may help reveal connections between food and IBS-D. You should take detailed notes that should include the types and amounts of foods eaten and the time of consumption. It’s important to also record the time and description of distressing bowel events or related pain and discomfort. Below are some dietary considerations which you may want to discuss with your doctor and/or registered dietitian.'
              'High-fat foods may worsen symptoms of IBS-D'
              'Dairy products – lactose free products may be better tolerated'
              'Avoid alcohol'
              'A reduction of caffeine may be beneficial. This includes caffeinated drinks, such as coffee, tea, colas and energy drinks'
              'Sorbitol sweeteners (found in some chewing gum) may be problematic'
              'Drink plenty of water'
              'Probiotic supplements such as lactobacillus acidophilus may help alleviate IBS symptoms including abdominal pain, bloating, and bowel movement irregularity. Ask your health care professional for more information.'
              'A diet low in FODMAPs (fermentable oligo-saccharides, di-saccharides, mono-saccharides, and polyols), a group of short-chain carbohydrates, may help relieve symptoms. The diet is used in the short-term followed by re-introduction to assess tolerance to individual foods. Consult your health-care professional for more information.'
              'Eating large meals also may trigger abdominal cramping and diarrhea. It’s best to eat smaller meals.'
              'Fibre may be helpful in reducing symptoms of IBS-D. If a trial of a fiber supplement such as psyllium is used, fiber should be added gradually, because it initially may worsen bloating and gassiness. If you have IBS-D, look for foods with more soluble fiber, the type that takes longer to digest (such as that found in oats).'
              'Stress is considered one of the triggers of IBS symptoms. Here are some healthy habits that may also help reduce IBS symptoms.'
              'Exercise may improve and could reduce stress.'
              'Get enough rest. This allows your body to maintain basic function, repair and manage stress.'
              'Use relaxation techniques: deep breathing, visualization, Yoga.'
              'Consult a professional trained in Cognitive Behavioral Therapy or Gut Directed Hypnotherapy.'
              'How do I prepare to talk to my doctor about IBS?'

              '\n\nGood communication with your doctor is an important part of effective management of a functional GI disorder like IBS. Before your appointment, take the time to track your symptoms in the CDHF app that can help you and your doctor see patterns in your activities and identify specific triggers for your symptoms.'

              '\n\nInclude the following information in the CDHF app:'

              '\n\nJot down key personal and medical information, including any recent changes or stressful events in your life in the notes section of the app.'
              'Make a list of the triggers (food, stress, activity, menstrual cycle) that seem to make your symptoms worse in the notes section of the app.'
              'Track the medications are you taking, including the conditions you take them for. Also note if any of your medications seem to affect your symptoms.'
              'Talk to your family members and note if any relatives have been diagnosed with IBS, inflammatory bowel disease (IBD), celiac disease or colon cancer.'
              'You may want to ask your doctor:'

              '\n\nWhat do you think is causing my symptoms?'
              'Are there other possible causes for my condition?'
              'What diagnostic tests do I need?'
              'Do these tests require any special preparation?'
              'What treatment approach do you recommend trying first?'
              'If the first treatment doesn’t work, what will we try next?'
              'Are there any side effects associated with these treatments?',
          style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
              color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
            TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
          ]
      ),
    ),


    // Todo Five
    RichText(
      text: TextSpan(
          text: '1. Q: What is IBS? '
              'A: Irritable bowel syndrome (IBS) is a disorder affecting the intestine. IBS involves problems with motility (movement of digested food through the intestines) and sensitivity (how the brain interprets signals from the intestinal nerves), leading to abdominal pain, changes in bowel patterns and other symptoms. Although often disruptive, debilitating and embarrassing, it may be some comfort to know that IBS is NOT life-threatening, nor does it lead to cancer or other more serious illnesses.'

              '\n\n2. Q: How common is IBS?'
              'A: IBS is very common. In fact, Canada has one of the highest rates of IBS in the world, with an estimated 18% vs. 11% globally (Lovell et al. 2012).\n\n'

              '\n\n3. Q: What are the most common symptoms?'
              'A: Abdominal Pain, irregular bowl patterns that result in constipation, diarrhea, or alternating periods of both.'

              '\n\n4. Q: How do you know if you have IBS?'
              'A: A set of specific symptom criteria (referred to by physicians as the Rome Criteria)'
              'has been developed to help physicians diagnose IBS.'

              '\n\n5. Q: Can IBS kill you?'
              'A: No. IBS is a chronic (long term), but manageable condition. Over time, the symptoms of IBS typically do not get worse, and with an effective treatment plan, as many as one-third of IBS patients may eventually become symptom-free.'

              '\n\n6. Q: Are there any complications of IBS?'
              'A: While IBS can cause pain and stress, it does not cause any permanent damage to the bowel or lead to cancer or any other major illness.'

              '\n\n7. Q: Is there an IBS Diet?'
              'A: One of the most common diets recommended by healthcare professionals to alleviate IBS symptoms is the FODMAP diet. Fermentable carbohydrates (also known as FODMAPs), are small carbohydrate (sugar) molecules found in everyday foods that may be poorly absorbed in the small intestine of some people. FODMAPs are fermented (digested) by intestinal bacteria, which can lead to symptoms of abdominal pain, excess gas, constipation, and diarrhea. Following a low-FODMAP diet may help to reduce gastrointestinal symptoms in 75% of IBS patients.'

              '\n\nLearn more about the FODMAP diet here.  Check out the other diets here.'

              '\n\n8. Q: Will probiotics help my IBS?'
              'A: If other dietary strategies have not been successful in relieving your symptoms, a trial of a probiotic (in the dose recommended) may be helpful. However, Probiotics are not medicine! They are available to purchase as capsules, tablets or powders, and can also be found in some fortified yogurts and fermented milk products. However, not all probiotics are the same. It is important to choose a product that is proven to be safe and offers benefits for the specific symptoms you want to relieve.  Speak to your doctor or pharmacist about which probiotic may be right for YOU.'

              '\n\n9. Q: Are there other ways to manage IBS?'
              'A: There are medications approved in Canada for IBS (over the counter or prescription) that can help your symptoms as well.  Peppermint Oil is a relatively new treatment option out there has recently been confirmed in a clinical trial. Peppermint can relax muscle, eases hypersensitivity in the bowels, and modulates pain in IBS.'

              '\n\nIBgard is a new clinically tested capsule filled with tiny beads of peppermint oil, using a technology called SST (Site Specific Targeting). It is the only product of its kind on the market that has gone through a clinical trial. It has been proven to be effective and safe in relieving symptoms in patients with moderate to severe IBS-M and IBS-D.'

              '\n\nThis product is easily attainable and available over the counter. Patients tested saw relief in symptoms over the course of 24 hours and continued relief over a 3-4 week period.'

              '\n\n10. Q: How is IBS different then IBD?'
              'A: Although both illnesses can be seriously debilitating, there are several primary differences between Inflammatory Bowel Disease (IBD) and Irritable Bowel Syndrome (IBS). IBD is an autoimmune disorder that causes swelling and ulcerations (sores) in the bowel. IBS involves problems with motility (how the bowel moves contents through our intestines) and sensitivity (how the brain interprets sensations in the bowel). Symptoms of IBS may wax and wane and possibly disappear altogether whereas IBD is a chronic condition. ',
          style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
              color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
            TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  }
            ),
          ]
      ),
    ),

    // Todo Six
    RichText(
      text: TextSpan(
          text: 'Tags: IBS'

              'Canada has one of the highest prevalence of irritable bowel syndrome (IBS) in the world – estimated 18% vs. 11% globally. (Lovell et al. 2012)'
              'More than 70% indicate that their symptoms interfere with everyday life and 46% report missing work or school due to IBS. (Gastrointestinal Society 2016)'
              '54% of those with IBS experience symptoms of fatigue. (Gastrointestinal Society 2018; Han et al. 2016)'
              '40 to 60% of those with IBS experience psychological symptoms, including anxiety disorders and depression. (Gastrointestinal Society 2018)'
              'On average, IBS patients reported they would give up 25% of their remaining life (15 years) to live a symptom-free life. (Gastrointestinal Society 2018)'
              "Data from the US suggest that on average, costs are US\$2,026 more per year per patient among those with IBS as compared to those without IBS. (Buono et al. 2017)"
              'On average, it takes 4 years for an individual to receive a definitive diagnosis of IBS. (Gastrointestinal Society 2018)'
              'In Canada, 45% of the direct costs for IBS treatment are attributed to diagnostic tests. (Fedorak et al. 2012)'
              'Citations:',
          style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
              color: Colors.black
          ),
          children: <TextSpan> [
            TextSpan(
                text: '\n\nReferences',
                style: TextStyles.textStyleSettingNotificationsResourceTitle.apply(
                    color: Colors.black
                ),
            ),
            TextSpan(
                text: '\n\nBuono JL et al. Economic burden of irritable bowel syndrome with diarrhea: Retrospective analysis of a U.S. commercially insured population. J Manag Care Spec Pharm. 2017 Apr;23(4):453-60.'
                    '\n\nFedorak RN et al. Canadian Digestive Health Foundation Public Impact Series 3: Irritable bowel syndrome in Canada. Incidence, prevalence, and direct and indirect economic impact. Can J Gastroenterol. 2012 May;26(5):252-6.'
                    '\n\nGastrointestinal Society. 2018. ',
              style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                    color: Colors.black
                ),
            ),
            TextSpan(
                text: '\n\nIBS Global Impact Report',
                style: TextStyles.textStyleSettingResourcesLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    print('helllo');
                    final _url = 'https://badgut-5q10xayth7t3zjokbv.netdna-ssl.com/wp-content/uploads/IBS-Global-Impact-Report.pdf';
                    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
                  }
            ),
            TextSpan(
              text: '\n\nGastrointestinal Society. 2016. 2016 Survey Report: Irritable bowel syndrome.'
                  '\n\nHan CJ and Yang GS. Fatigue in irritable bowel syndrome: A systematic review and meta-analysis of pooled frequency and severity of fatigue. Asian Nurs Res (Korean Soc Nurs Sci). 2016 Mar;10(1):1-10.'
                  '\n\nLovell RM and Ford AC. Global prevalence of and risk factors for irritable bowel syndrome: A meta-analysis. Clin Gastroenterol Hepatol. 2012 Jul;10(7):712-21.e4.',
              style: TextStyles.textStyleSettingNotificationsSubTitle.apply(
                  color: Colors.black
              ),
            ),
          ]
      ),
    ),
  ];


}




