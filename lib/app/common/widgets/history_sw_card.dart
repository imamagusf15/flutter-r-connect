import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/extension/datetime_extension.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';

class HistorySwCard extends StatelessWidget {
  final LastTransactionSwModel transaction;
  const HistorySwCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final item = [
      _buildRowInfo(
        iconAsset: ConstantAsset.calendarIcon,
        label: 'Tgl. Penetapan',
        value: transaction.tglTransaksi?.formatDate() ?? '',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.calendarIcon,
        label: 'Masa Berlaku',
        value:
            '${transaction.masaLakuAwal?.formatDate() ?? '-'} \ns.d ${transaction.masaLakuAkhir?.formatDate() ?? '-'}',
      ),
      _buildRowPriceTotal(context, [
        {
          'label': 'KD',
          'value': transaction.kd ?? '-',
          'textColor': AppColors.netral500,
        },
        {
          'label': 'SW',
          'value': transaction.sw ?? '-',
          'textColor': AppColors.netral500,
        },
        {
          'label': 'Denda',
          'value': transaction.denda ?? '-',
          'textColor': AppColors.netral500,
        },
        {
          'label': 'Total',
          'value': transaction.total ?? '-',
          'textColor': AppColors.primary,
        },
      ]),
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.center,
          colors: [AppColors.primary, AppColors.white],
        ),
      ),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Loket Kantor', style: AppTextStyle.regular12()),
              Text(
                transaction.tglTransaksi?.formatDate() ?? '-',
                style: AppTextStyle.regular12(),
              ),
            ],
          ),
          Text(
            transaction.loketKantor ?? '-',
            style: AppTextStyle.semibold12(),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.netral50,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: item.length,
              itemBuilder: (context, index) => item[index],
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildRowInfo({
    required String iconAsset,
    required String label,
    required String value,
    bool? visibleValue,
    VoidCallback? onPressed,
  }) {
    return Row(
      children: [
        CustomImageLocal(imagePath: iconAsset),
        SizedBox(width: 4),
        Text(label, style: AppTextStyle.regular12(color: AppColors.netral500)),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            visibleValue != null
                ? visibleValue == true
                      ? value
                      : '****************'
                : value,
            style: AppTextStyle.semibold12(color: AppColors.primary),
            textAlign: TextAlign.right,
            maxLines: 2,
          ),
        ),
        if (visibleValue != null)
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              color: AppColors.primary,
              visibleValue
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
      ],
    );
  }

  Widget _buildRowPriceTotal(
    BuildContext context,
    List<Map<String, dynamic>> items,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.center,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            VerticalDivider(indent: 10, endIndent: 10, width: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${item['value']}',
                style: AppTextStyle.bold12(color: item['textColor']),
              ),
              Text(
                item['label'],
                style: AppTextStyle.regular12(color: item['textColor']),
              ),
            ],
          );
        },
      ),
    );
  }
}
