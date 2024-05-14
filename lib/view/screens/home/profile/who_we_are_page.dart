import 'package:flutter/material.dart';
import 'package:myucommerce/helper/constants.dart';
import 'package:myucommerce/view/widgets/custom_text.dart';

class WhoWeArePage extends StatelessWidget {
  const WhoWeArePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyUCommerce"),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomText(text: "من نحن؟", size: 30, color: kPrimaryColor),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "يهدف موقعنا الي أن يوفر لك مستلزماتك الدراسية لكل الأقسام ؛ كما أنها تقوم بتوفير مجموعة فائقة الجودة كما انه يوفر لك اسعار مناسبة حرصا علي تعرضك لاي مصدر غير مناسب خارج جامعتك",
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "ويسعي موقعنا الي انا يتميز عن اي مصدر خارج الجامعه وذلك من خلال :",
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                    text: "تلبية مطتلبات العملاء",
                    size: 18,
                    color: kPrimaryColor),
                CustomText(
                    text: "الالتزام مواعيد التسليم",
                    size: 18,
                    color: kPrimaryColor),
                CustomText(
                    text: "توفير منتجات عالية الجودة",
                    size: 18,
                    color: kPrimaryColor),
              ],
            ),
            CustomText(text: "رؤيتنا", size: 20, color: Colors.green),
            Text(
              'إنشاء متجرا يقترن اسمة بالجودة؛ وأن تكون منتجاته في القمة ، والعمل بأسلوب ملائم للبيئة، للمساهمة في صناعة مستقبل أفضل، ونهتم بتأمين بيئة عمل آمنة وصحية؛ حيث أن قيمة الإنسان تأتي في المقام الأول، كما نشجع العاملين على تطوير الذات وتنمية روح الإبداع',
              textDirection: TextDirection.rtl,
            ),
            CustomText(text: "سياسة الجودة", size: 20, color: Colors.green),
            Text(
              "يضع متجرنا رضا العملاء في بداية قائمة أولوياتة، من خلال توفيرها لكافة أنواع اجود انوع المنتجات وتوفير احتياجات العملاء بأسعار مناسبة، وبأعلى جودة، والالتزام بمواعيد التسليم",
              textDirection: TextDirection.rtl,
            ),
            CustomText(text: "رسالتنا", size: 20, color: Colors.green),
            Text(
              """في عالمنا اليوم: التغيير هو الثابت الجديد، ولم يعد من الممكن اعتباره ترفا أو رفاهية، ولذلك علينا التطوير وتوفير مانحتاجةوأيضا نهتم بإعادة النظر في التعليقات، واتخاذ الإجراءات المناسبة لتلبية احتياجات وتوقعات عملائنا.عند مشاركتك مع فريقنا، سوف تكتشف التزامنا بالتميز وتجربة العملاء الاستثنائية التي نعديه""",
              textDirection: TextDirection.rtl,
            ),
          ]),
        ),
      ),
    );
  }
}
