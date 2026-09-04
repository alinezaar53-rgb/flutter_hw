import 'package:flutter/material.dart';

class InputFormScreen extends StatefulWidget {
  const InputFormScreen({super.key});

  @override
  State<InputFormScreen> createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  // =========================
  // Form Key
  // =========================

  final _formKey = GlobalKey<FormState>();

  // =========================
  // Controllers
  // =========================

  final TextEditingController _textController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _phoneController =
      TextEditingController();

  final TextEditingController _requiredController =
      TextEditingController();

  // =========================
  // Variables
  // =========================

  // Checkbox
  bool agree = false;

  // Radio
  String? gender;

  // Switch
  bool notifications = false;

  // Slider
  double experience = 5;

  // RangeSlider
  RangeValues ageRange = const RangeValues(18, 30);

  // Dropdown
  String? city;

  // PopupMenu
  String? language;

  // =========================
  // Lists
  // =========================

  final List<String> cities = [
    'صنعاء',
    'عدن',
    'تعز',
    'إب',
    'الحديدة',
  ];

  final List<String> languages = [
    'العربية',
    'English',
    'Français',
  ];

  // =========================
  // إرسال
  // =========================

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('ملخص البيانات'),

            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الإدخال العادي: ${_textController.text}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'البريد: ${_emailController.text}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'الهاتف: ${_phoneController.text}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'الحقل المطلوب: '
                    '${_requiredController.text}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'الموافقة: ${agree ? "نعم" : "لا"}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'الجنس: $gender',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'الإشعارات: '
                    '${notifications ? "مفعلة" : "غير مفعلة"}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'الخبرة: '
                    '${experience.toStringAsFixed(1)}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'العمر: '
                    '${ageRange.start.round()} - '
                    '${ageRange.end.round()}',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'المدينة: $city',
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'اللغة: $language',
                  ),
                ],
              ),
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('إغلاق'),
              ),
            ],
          );
        },
      );
    }
  }

  // =========================
  // إعادة التعيين
  // =========================

  void resetForm() {
    _formKey.currentState?.reset();

    _textController.clear();
    _emailController.clear();
    _phoneController.clear();
    _requiredController.clear();

    setState(() {
      agree = false;
      gender = null;
      notifications = false;
      experience = 5;
      ageRange = const RangeValues(18, 30);
      city = null;
      language = null;
    });
  }

  // =========================
  // Dispose
  // =========================

  @override
  void dispose() {
    _textController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _requiredController.dispose();

    super.dispose();
  }

  // =========================
  // UI
  // =========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assignment'),
        centerTitle: true,
      ),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [

            // =====================================
            // 1. TextField
            // =====================================

            const Text(
              '1. TextField',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: _textController,

              decoration: const InputDecoration(
                labelText: 'إدخال عادي',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // =====================================
            // 2. Email TextFormField
            // =====================================

            const Text(
              '2. البريد الإلكتروني',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: _emailController,

              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                border: OutlineInputBorder(),
              ),

              validator: (value) {
                return value!.contains('@')
                    ? null
                    : 'بريد غير صحيح';
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 3. Phone TextFormField
            // =====================================

            const Text(
              '3. رقم الهاتف',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: _phoneController,

              keyboardType: TextInputType.phone,

              decoration: const InputDecoration(
                labelText: 'رقم الهاتف',
                border: OutlineInputBorder(),
              ),

              validator: (value) {
                return value!.length == 9
                    ? null
                    : 'رقم غير صحيح';
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 4. Required TextFormField
            // =====================================

            const Text(
              '4. حقل مطلوب',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: _requiredController,

              decoration: const InputDecoration(
                labelText: 'هذا الحقل مطلوب',
                border: OutlineInputBorder(),
              ),

              validator: (value) {
                return value!.isEmpty
                    ? 'مطلوب'
                    : null;
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 5. Checkbox
            // =====================================

            const Text(
              '5. Checkbox - الموافقة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            FormField<bool>(
              initialValue: agree,

              validator: (value) {
                return value == true
                    ? null
                    : 'وافق على الشروط';
              },

              builder: (field) {
                return Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,

                      title: const Text(
                        'أوافق على الشروط والأحكام',
                      ),

                      value: agree,

                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });

                        field.didChange(agree);
                      },
                    ),

                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 6. Radio
            // =====================================

            const Text(
              '6. Radio - الجنس',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            FormField<String>(
              initialValue: gender,

              validator: (value) {
                return value != null
                    ? null
                    : 'اختر الجنس';
              },

              builder: (field) {
                return Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    RadioListTile<String>(
                      title: const Text('ذكر'),

                      value: 'ذكر',

                      groupValue: gender,

                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });

                        field.didChange(value);
                      },
                    ),

                    RadioListTile<String>(
                      title: const Text('أنثى'),

                      value: 'أنثى',

                      groupValue: gender,

                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });

                        field.didChange(value);
                      },
                    ),

                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 7. Switch
            // =====================================

            const Text(
              '7. Switch - الإشعارات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,

              title: const Text(
                'تفعيل الإشعارات',
              ),

              value: notifications,

              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 8. Slider
            // =====================================

            const Text(
              '8. Slider - الخبرة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            FormField<double>(
              initialValue: experience,

              validator: (value) {
                return value! >= 0 && value <= 10
                    ? null
                    : 'خارج النطاق';
              },

              builder: (field) {
                return Column(
                  children: [
                    Slider(
                      min: 0,
                      max: 10,
                      divisions: 10,

                      value: experience,

                      label: experience.toString(),

                      onChanged: (value) {
                        setState(() {
                          experience = value;
                        });

                        field.didChange(value);
                      },
                    ),

                    Text(
                      'سنوات الخبرة: '
                      '${experience.toStringAsFixed(1)}',
                    ),

                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 9. RangeSlider
            // =====================================

            const Text(
              '9. RangeSlider - العمر',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            FormField<RangeValues>(
              initialValue: ageRange,

              validator: (value) {
                return value!.start < value.end
                    ? null
                    : 'نطاق غير صحيح';
              },

              builder: (field) {
                return Column(
                  children: [
                    RangeSlider(
                      min: 0,
                      max: 100,
                      divisions: 100,

                      values: ageRange,

                      labels: RangeLabels(
                        ageRange.start
                            .round()
                            .toString(),

                        ageRange.end
                            .round()
                            .toString(),
                      ),

                      onChanged: (value) {
                        setState(() {
                          ageRange = value;
                        });

                        field.didChange(value);
                      },
                    ),

                    Text(
                      'العمر: '
                      '${ageRange.start.round()} - '
                      '${ageRange.end.round()}',
                    ),

                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 10. DropdownButton
            // =====================================

            const Text(
              '10. DropdownButton - المدينة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            FormField<String>(
              initialValue: city,

              validator: (value) {
                return value != null
                    ? null
                    : 'اختر مدينة';
              },

              builder: (field) {
                return Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    DropdownButton<String>(
                      isExpanded: true,

                      hint: const Text(
                        'اختر المدينة',
                      ),

                      value: city,

                      items: cities.map((cityName) {
                        return DropdownMenuItem<String>(
                          value: cityName,
                          child: Text(cityName),
                        );
                      }).toList(),

                      onChanged: (value) {
                        setState(() {
                          city = value;
                        });

                        field.didChange(value);
                      },
                    ),

                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // =====================================
            // 11. PopupMenuButton
            // =====================================

            const Text(
              '11. PopupMenuButton - اللغة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            FormField<String>(
              initialValue: language,

              validator: (value) {
                return value != null
                    ? null
                    : 'اختر لغة';
              },

              builder: (field) {
                return Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            setState(() {
                              language = value;
                            });

                            field.didChange(value);
                          },

                          itemBuilder: (context) {
                            return languages.map((lang) {
                              return PopupMenuItem<String>(
                                value: lang,
                                child: Text(lang),
                              );
                            }).toList();
                          },

                          child: const Padding(
                            padding: EdgeInsets.all(12),

                            child: Row(
                              mainAxisSize:
                                  MainAxisSize.min,

                              children: [
                                Icon(Icons.language),

                                SizedBox(width: 8),

                                Text('اختر اللغة'),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        if (language != null)
                          Text(
                            language!,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                      ],
                    ),

                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 30),

            // =====================================
            // زر إرسال
            // =====================================

            ElevatedButton(
              onPressed: submitForm,

              child: const Padding(
                padding: EdgeInsets.all(14),

                child: Text(
                  'إرسال',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // =====================================
            // زر إعادة التعيين
            // =====================================

            TextButton(
              onPressed: resetForm,

              child: const Text(
                'إعادة تعيين',
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}