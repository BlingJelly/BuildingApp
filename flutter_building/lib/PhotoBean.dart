class PhotoBean {
  String url;

  PhotoBean(this.url);

  static List<PhotoBean> generateBean(String str) {
    if(str == "北京奥运会国家体育中心(鸟巢)") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/9f510fb30f2442a7b9d340ced143ad4bd01302ff?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/962bd40735fae6cd2068160a0fb30f2443a70ff8?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/bd3eb13533fa828b8efc2088fd1f4134960a5af9?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/8cb1cb1349540923c4b6de159258d109b2de49f9?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "埃及吉萨 大埃及博物馆") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/7af40ad162d9f2d31a2fc3f7aeec8a136327cce8?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxMTY=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://img0.baidu.com/it/u=4091029538,859109990&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=929315754,4121900779&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=313477927,4072965897&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "阿联酋 哈利法塔") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/0b46f21fbe096b63eda848eb04338744eaf8acd3?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxODA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/d1a20cf431adcbef68fa180daeaf2edda2cc9fea?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/c8ea15ce36d3d539b3f369c83887e950342ab0ea?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/95eef01f3a292df5a28fca1ebe315c6034a87368?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "耶路撒冷 宽容博物馆") {
      return [
        PhotoBean(
            "https://img1.baidu.com/it/u=909910242,1832084170&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=4240329622,3236422776&fm=15&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img1.baidu.com/it/u=1213685209,1430974797&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=931996498,3207298291&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "北京首都国际机场3号航站楼") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/5366d0160924ab18bc467e913ffae6cd7a890bc7?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/f11f3a292df5e0fe0feebeb05c6034a85fdf7288?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyMjA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/8601a18b87d6277f8af6058928381f30e824fc9e?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyMjA=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/d1160924ab18972b0ad3377be6cd7b899f510a91?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyMjA=,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "伦敦 泰特现代美术馆扩建工程") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/5243fbf2b2119313e50bda3765380cd790238de8?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/a71ea8d3fd1f4134dc3359f9251f95cad1c85e34?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/1f178a82b9014a907270f33aa9773912b21beeef?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/d009b3de9c82d1582772d123800a19d8bd3e42b4?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "罗马 国立当代艺术博物馆(MAXXI)") {
      return [
        PhotoBean(
            "https://img1.baidu.com/it/u=3391737023,3602655795&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=3455123786,599086755&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=737148569,1367904199&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img1.baidu.com/it/u=2651905240,3811590178&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "中国中央电视台新址") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/f603918fa0ec08fa1f65fcef51ee3d6d55fbda15?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/0b55b319ebc4b7451e34226bcffc1e178a82152e?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/96dda144ad3459827c2a70ef0cf431adcbef842f?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/cb8065380cd79123e101507bae345982b3b780d8?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxMTY=,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "伦敦 主教门大厦") {
      return [
        PhotoBean(
            "https://img1.baidu.com/it/u=478920285,938063254&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=575918990,1522631605&fm=15&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img1.baidu.com/it/u=1319699384,560302532&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=599165788,1350821615&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "重建的纽约世贸中心") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/6d81800a19d8bc3ea5a2a578818ba61ea9d345dd?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/b2de9c82d158ccbf3f99ce9d11d8bc3eb135416b?x-bce-process=image/crop,x_0,y_25,w_550,h_363/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/728da9773912b31bbaad049b8518367adbb4e1bb?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/b64543a98226cffc3b185200ba014a90f603ea56?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else return [
      PhotoBean("")
    ];
  }

  static List<PhotoBean> generateBean1(String str) {
    if(str == "古建筑保护存在的问题") {
      return [
        PhotoBean(
            "https://img2.baidu.com/it/u=3162525388,1899689273&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=4207396119,365220148&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=3485093117,2069485937&fm=26&fmt=auto&gp=0.jpg"),
        ];
    }else if(str == "古建筑保护的措施") {
      return [
        PhotoBean(
            "https://img1.baidu.com/it/u=1157841284,1547314010&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=4207396119,365220148&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=3485093117,2069485937&fm=26&fmt=auto&gp=0.jpg"),
        ];
    }else if(str == "古建筑保护的意义") {
      return [
        PhotoBean(
            "https://img1.baidu.com/it/u=1157841284,1547314010&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=3162525388,1899689273&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=3485093117,2069485937&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "历史建筑修缮及保护原则") {
      return [
        PhotoBean(
            "https://img1.baidu.com/it/u=1157841284,1547314010&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=3162525388,1899689273&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=4207396119,365220148&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else return [
      PhotoBean("")
    ];
  }

  static List<PhotoBean> generateBean3(String str) {
    if(str == "哥特式建筑") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/adaf2edda3cc7cd919a5dabd3301213fb90e91ce?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxMTY=,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/dc54564e9258d109b3de77597011dbbf6c81810ae78c?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/ac6eddc451da81cb39dba921f32fc7160924aa189b8c?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "文艺复兴建筑") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/359b033b5bb5c9ea28552447dd39b6003bf3b3eb?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/8c1001e93901213fd96067f754e736d12f2e954d?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/b03533fa828ba61e3d51e1044134970a304e5959?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "巴洛克式建筑") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/2e2eb9389b504fc2e01cc013eedde71190ef6d60?x-bce-process=image/crop,x_0,y_14,w_550,h_363/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/77c6a7efce1b9d167a90a89cf3deb48f8d5464f3?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/9922720e0cf3d7ca0d98c18cf21fbe096a63a9da?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "浪漫主义建筑") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/a686c9177f3e6709442240b23bc79f3df8dc5558?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/b7003af33a87e95085a6686610385343fbf2b403?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U3Mg==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/54fbb2fb43166d22c5d88e9e462309f79052d209?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
      ];
    }else if(str == "后现代主义建筑") {
      return [
        PhotoBean(
            "https://bkimg.cdn.bcebos.com/pic/8694a4c27d1ed21bfbefca8ca06eddc451da3fb1?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5/format,f_auto"),
        PhotoBean(
            "https://img2.baidu.com/it/u=131995151,2963063367&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=4054021465,2793538052&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else return [
      PhotoBean("")
    ];
  }

  static List<PhotoBean> generateBean4(String str) {
    if(str == "知识点（一）") {
      return [
        PhotoBean(
            "https://img2.baidu.com/it/u=3496487743,4125161894&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=3481636311,41111772&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=2614013867,3996536470&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "知识点（二）") {
      return [
        PhotoBean(
            "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00009-2846.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=3481636311,41111772&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=2614013867,3996536470&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "知识点（三）") {
      return [
        PhotoBean(
            "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00009-2846.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=3496487743,4125161894&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=2614013867,3996536470&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else if(str == "知识点（四）") {
      return [
        PhotoBean(
            "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00009-2846.jpg"),
        PhotoBean(
            "https://img2.baidu.com/it/u=3496487743,4125161894&fm=26&fmt=auto&gp=0.jpg"),
        PhotoBean(
            "https://img0.baidu.com/it/u=3481636311,41111772&fm=26&fmt=auto&gp=0.jpg"),
      ];
    }else return [
      PhotoBean("")
    ];
  }

}
