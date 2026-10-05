import 'package:flutter/material.dart';

class PhoneNumberView extends StatefulWidget {
  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {

  int selectedCountryCode = 966;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Color(0xff292D32)),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsetsDirectional.only(start: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Color(0xffECECEC)),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text('What’s your Phone number?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('We’ll send you a code to verify it’s you', style: TextStyle(fontSize: 14)),
              SizedBox(height: 16),
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD1D1DB)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton(
                      value: selectedCountryCode,
                      style: TextStyle(color:  Color(0xff737373),fontSize: 14),
                      icon: Icon(Icons.keyboard_arrow_down,color: Color(0xff737373),),
                      padding: EdgeInsetsDirectional.only(start: 12,end: 12),
                      items: [
                        DropdownMenuItem(child: Text("+20"), value: 20),
                        DropdownMenuItem(child: Text("+966"), value: 966),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      underline: SizedBox(),
                      onChanged: (value) {
                        print('Value $value');
                        if(value!=null)
                          {
                            selectedCountryCode =value;
                            setState(() {

                            });
                          }


                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        hintText: '00000000000',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD1D1DB)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xffD1D1DB)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFFF9352),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
