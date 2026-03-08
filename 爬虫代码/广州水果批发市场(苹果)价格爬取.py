import requests
import time
import openpyxl

wb = openpyxl.Workbook()
sheet1 = wb.active
sheet1.append(['时间', '价格'])

name = '苹果'
begain = '2016-03-01'
End = '2025-03-01'

for i in range(388):
    url = f'https://www.jnmarket.net/api/dailypricelist?pageNum={i + 1}&pageSize=10&kind=2&productName={name}&params%5BbeginTime%5D={begain}&params%5BendTime%5D={End}'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36'
    }
    res = requests.get(url, headers=headers)
    data = res.json()
    for D in data['rows']:
        if D['productName'] == name:  # 筛选出苹果，而不是进口苹果
            sheet1.append([str(D['priceDate']), float(D['averagePrice'])])

    time.sleep(0.1)
    print(f'成功爬取第{i + 1}页~')

wb.save(f'{name}.xlsx')
