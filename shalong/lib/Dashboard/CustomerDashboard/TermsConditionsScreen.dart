import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  _TermsConditionScreenState createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Terms & Conditions"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.blue])),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,

        ),
        // body:  Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Row(
        //     //   mainAxisAlignment: MainAxisAlignment.center,
        //     //   children: [
        //     //     Center(child: Text("Terms & Conditions",style: TextStyle(fontSize: 32),)),
        //     //     Icon(Icons.file_copy,size: 32,color: CupertinoColors.systemRed,)
        //     //   ],),
        //     // Text("Coming Soon",style: TextStyle(
        //     //     color: CupertinoColors.systemGrey
        //     // ),),
        //     // RichText(
        //     //   text: TextSpan(
        //     //     text: 'Privacy Policy',
        //     //     style: DefaultTextStyle.of(context).style,
        //     //     children: const <TextSpan>[
        //     //       TextSpan(
        //     //         text: "Privacy Policy",
        //     //         style: TextStyle(
        //     //           fontSize: 21,
        //     //           fontWeight: FontWeight.bold,
        //     //         )
        //     //       )
        //     //     ],
        //     //   ),
        //     // ),
        //     WebView(
        //       initialUrl: 'https://privacyterms.io/view/fdigclPM-8YosmjKR-DnNCuL/',
        //       gestureRecognizers: Set()
        //         ..add(Factory<VerticalDragGestureRecognizer>(
        //                 () => VerticalDragGestureRecognizer())),
        //     )
        //
        //
        //   ],
        // )
        body:  Center(
          child: SingleChildScrollView(
            child: Html(
              data: """
                
             
<h3>Your privacy is important to us</h3>
<p>Yash School of technology is located at:</p>
<address>
    Yash School of technology,<br>
    jakkampatty,andipatty,<br>Theni <br>625512 TamilNadu , india<br>
    
</address>



<p>It is Yash School of technology's policy to respect your privacy regarding any information we may collect while operating our website. This Privacy Policy applies to <a href="https://www.gogle.co"> www.gogle.co</a> (hereinafter, "us", "we", or "www.gogle.co"). We respect your privacy and are committed to protecting personally identifiable information you may provide us through the Website. We have adopted this privacy policy ("Privacy Policy") to explain what information may be collected on our Website, how we use this information, and under what circumstances we may disclose the information to third parties. This Privacy Policy applies only to information we collect through the Website and does not apply to our collection of information from other sources.</p>
<p>This Privacy Policy, together with the Terms of service posted on our Website, set forth the general rules and policies governing your use of our Website. Depending on your activities when visiting our Website, you may be required to agree to additional terms of service.</p><h2 id="tableofcontents">Contents</h2>
<p>Click below to jump to any section of this privacy policy</p>
<ol type="1">
    <li><a href="#PII"><strong>Personally-Identifying Information</strong></a>
</li>
    <li><a href="#Security"><strong>Security</strong></a>
</li>
    <li><a href="#Ads"><strong>Advertisements</strong></a>
</li>
    <li><a href="#ExternalLinks"><strong>Links To External Sites</strong></a>
</li>
    <li><a href="#PIIProtection"><strong>Protection of Certain Personally-Identifying Information</strong></a>
</li>
    <li><a href="#Stats"><strong>Aggregated Statistics</strong></a>
</li>
    <li><a href="#Cookies"><strong>Cookies</strong></a>
</li>
    <li><a href="#businesstransfers"><strong>Business Transfers</strong></a>
</li>
    <li><a href="#Changes"><strong>Privacy Policy Changes</strong></a>
</li>
    <li><a href="#Custom"><strong>Other Policies</strong></a>
</li>
    <li><a href="#Credit"><strong>Contact Information &amp; Credit</strong></a>
</li>

</ol>
<h2 id="PII">1. Personally-Identifying Information</h2><p>Certain visitors to Yash School of technology's websites choose to interact with Yash School of technology in ways that require Yash School of technology to gather personally-identifying information. The amount and type of information that Yash School of technology gathers depends on the nature of the interaction. For example, we ask visitors who leave a comment at https://www.gogle.co to provide a username and email address.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Security">2. Security</h2><p>The security of your Personal Information is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Information, we cannot guarantee its absolute security.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Ads">3. Advertisements</h2><p>Ads appearing on our website may be delivered to users by advertising partners, who may set cookies. These cookies allow the ad server to recognize your computer each time they send you an online advertisement to compile information about you or others who use your computer. This information allows ad networks to, among other things, deliver targeted advertisements that they believe will be of most interest to you. This Privacy Policy covers the use of cookies by Yash School of technology and does not cover the use of cookies by any advertisers.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="ExternalLinks">4. Links To External Sites</h2><p>Our Service may contain links to external sites that are not operated by us. If you click on a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy and terms of service of every site you visit.</p>
<p>We have no control over, and assume no responsibility for the content, privacy policies or practices of any third party sites, products or services.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="PIIProtection">5. Protection of Certain Personally-Identifying Information</h2><p>Yash School of technology discloses potentially personally-identifying and personally-identifying information only to those of its employees, contractors and affiliated organizations that (i) need to know that information in order to process it on Yash School of technology's behalf or to provide services available at Yash School of technology's website, and (ii) that have agreed not to disclose it to others. Some of those employees, contractors and affiliated organizations may be located outside of your home country; by using Yash School of technology's website, you consent to the transfer of such information to them. Yash School of technology will not rent or sell potentially personally-identifying and personally-identifying information to anyone. Other than to its employees, contractors and affiliated organizations, as described above, Yash School of technology discloses potentially personally-identifying and personally-identifying information only in response to a subpoena, court order or other governmental request, or when Yash School of technology believes in good faith that disclosure is reasonably necessary to protect the property or rights of Yash School of technology, third parties or the public at large.</p>
<p>If you are a registered user of https://www.gogle.co and have supplied your email address, Yash School of technology may occasionally send you an email to tell you about new features, solicit your feedback, or just keep you up to date with what's going on with Yash School of technology and our products. We primarily use our blog to communicate this type of information, so we expect to keep this type of email to a minimum. If you send us a request (for example via a support email or via one of our feedback mechanisms), we reserve the right to publish it in order to help us clarify or respond to your request or to help us support other users. Yash School of technology takes all measures reasonably necessary to protect against the unauthorized access, use, alteration or destruction of potentially personally-identifying and personally-identifying information.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Stats">6. Aggregated Statistics</h2><p>Yash School of technology may collect statistics about the behavior of visitors to its website. Yash School of technology may display this information publicly or provide it to others. However, Yash School of technology does not disclose your personally-identifying information.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Cookies">7. Cookies</h2><p>To enrich and perfect your online experience, Yash School of technology uses "Cookies", similar technologies and services provided by others to display personalized content, appropriate advertising and store your preferences on your computer.</p>
<p>A cookie is a string of information that a website stores on a visitor's computer, and that the visitor's browser provides to the website each time the visitor returns. Yash School of technology uses cookies to help Yash School of technology identify and track visitors, their usage of https://www.gogle.co, and their website access preferences. Yash School of technology visitors who do not wish to have cookies placed on their computers should set their browsers to refuse cookies before using Yash School of technology's websites, with the drawback that certain features of Yash School of technology's websites may not function properly without the aid of cookies.</p>
<p>By continuing to navigate our website without changing your cookie settings, you hereby acknowledge and agree to Yash School of technology's use of cookies.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="businesstransfers">8. Business Transfers</h2><p>If Yash School of technology, or substantially all of its assets, were acquired, or in the unlikely event that Yash School of technology goes out of business or enters bankruptcy, user information would be one of the assets that is transferred or acquired by a third party. You acknowledge that such transfers may occur, and that any acquirer of Yash School of technology may continue to use your personal information as set forth in this policy.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Changes">9. Privacy Policy Changes</h2><p>Although most changes are likely to be minor, Yash School of technology may change its Privacy Policy from time to time, and in Yash School of technology's sole discretion. Yash School of technology encourages visitors to frequently check this page for any changes to its Privacy Policy. Your continued use of this site after any change in this Privacy Policy will constitute your acceptance of such change.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Custom">10. Other Policies</h2>
<h3>Shalong App</h3>
<p>This is app is used to book salong</p>



<p><a href="#tableofcontents">Back to table of contents</a></p><h2 id="Credit">11. Contact Information &amp; Credit</h2><p>This privacy policy was created at <a style="color:inherit;text-decoration:none;" href="https://privacyterms.io/privacy-policy-generator/" title="Privacy policy generator" target="_blank">privacyterms.io privacy policy generator</a>. If you have any questions about our Privacy Policy, please contact us via <a href="mailto:knknaveen28@gmail.com">email</a> or <a href="tel:">phone</a>.</p>

<p><a href="#tableofcontents">Back to table of contents</a></p>            
                """,

            ),
          ),
        )
    );
  }
}
