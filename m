Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124B4C83F17
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 05:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHirS6tiJ/3Y0sg64aEGUCfZgS568KWeiTIt9GPO1Rs=; b=amhLJEr28i2iqL
	VKaojUGtzQBXP0L9WqBYZP74NYPIdboql2KMAZ/2pvaV+3/PlshW1wBJxMlbd+VLBoc/8NzUHSNE9
	SdXnBn0CNMXZpwWeK9gCXhxunKN1MSCEQ9EQ2blQi1raViNGoz+X9GlMCtF0bR7tfrbqJyJ6XUY+Q
	O1XGl4mwjeV0ODZBGj12MhzJGfMfXM/40bBVaB1Xl0/JFu+DzEgx+USL7BzfM24ZxwpvDdFKweYG3
	1gwVQPebLs2lhuTz6IaKoRX+F3866abXfmV5CSPQHE+ROtQKhyEdkCBQipnKHFeIlAOy/cK1WgQrJ
	aVFAAH9OjLJFCepbmBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdw4-0000000BjIF-2dEs;
	Fri, 18 Jul 2025 05:47:08 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdta-0000000Bj6Z-2vxq
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 05:44:37 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-86cdb330b48so143540039f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752817473; x=1753422273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbgPp2KhOfq0y4Sok/APrDX9m8Fb2lQ6Dd/Lb1wol6E=;
        b=a0h9HpSIrPmIEoLUgNSHm3NS/Oz/L2DNwqAfNkSRARYHXSsPcDxJWv4niF/NcpUz+y
         gLIhVDym/xinLIWvl+hJR4AsjUTkLjeJNvLuTPOM/l8oSZQ1pkJQoF4nOdgLVROOw1Qx
         L5L1ZO1KXfIhz10N8n21PFEYmwoPXadPUVapyCo0YACOEnNE0TkwYEpLDHc0E1Y/K+z8
         8wV5gj0Uz1ArNfmmEuyO5sYZCNbFZtg3upvSZPAAs//DDSyec8yjTwdzVzTjHhAKICvc
         ChGa2ZL7+SQY1CgHba1miuOZvlk9DjEVFoh23OAhZB6tamNoOibhHp1kcfhOiFh6bQIG
         /9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817473; x=1753422273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbgPp2KhOfq0y4Sok/APrDX9m8Fb2lQ6Dd/Lb1wol6E=;
        b=GMohvQrdbNeuWeQd+vUL4bJoz3rmm8t0/yR+0JcEVQs2oVIiAzkadmMEdxuspv3hBK
         MBdZ3IMQUXBL+YDBwMW8it4MUi/Boi5zcVbT7VrPkLFsM2Vt5XTrGXLMF5MPzvtZS55a
         O4u43fr0D39w4VOrsoPCs3//5VBa5hstksFktUUC9/sHdlZyM8GN676PZw5CKdGTES1k
         e6I8BGphoiAhLjaDsFyNwzAebiuaHVSKSgkY7UGXpUNKjjVeHSEIZ00yQeh8kEFXGHVB
         GNxNqwAUhBZt86fnukYorVI5smSxwaSXX2sZhPQml6/vHN9luLBA9chmyIryG/2fNaqC
         9CPg==
X-Forwarded-Encrypted: i=1; AJvYcCWOY+xxTQZXkoEy9eF/mHlsSClY8/tsuhbpBss/Goy2GysvxbG82utA6ztO6dpmy7oB3eZC3D/sNa8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCLoFQryiRO2/rgb6STeCbsqYJQBljSWkYBe5pcJiCVJ2GiFbj
	sTONoVKXNZNNs+GZXSpDq5kqMi99cWAGVOKYIcL7I/pQipdOaHYxo5JxAkM9E7uVkwJyXo0ssT+
	6ZQ63NOeJkMttmlExv1RJRpkdZ4zx3RjN+yA+5HeCrA==
X-Gm-Gg: ASbGnctXNFwHt/eXyX6dYq3REu//qoXDkBNbpgjGVyH5euQrcamk6obs++2HC7X7OfN
	LnSek6wppiaCGewXUtbyP7MWlO9tKRl2W3WnR+V7k1MkvrikJxH777fBtT5qeZHwQ6ayJu3kmtJ
	yeTMc3xsF6lQC9Gkb09mySCV35xIRrdNgFixfaTmGYkvTVLxzlf8hIC2eR/CpF2GQYPlO08PNke
	pucPO2l
X-Google-Smtp-Source: AGHT+IHDgWzcXCwj/DOJpP3ymIG8gmYK7y1xVWQRaZZ4+bN0CjPQTQhbKC7oNlsGD5d5wHcvIALI0L6dBMD+3efHuLc=
X-Received: by 2002:a05:6602:140e:b0:86a:256e:12df with SMTP id
 ca18e2360f4ac-879c08918d9mr1244420739f.2.1752817473316; Thu, 17 Jul 2025
 22:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-8-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-8-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 11:14:21 +0530
X-Gm-Features: Ac12FXyXbFx3oQHSVcqGrTUnY6wqlJWgBpkN376n7_oc300BjXLNazpUiw8OmFU
Message-ID: <CAAhSdy1Ca4pYDjTPz2YfgWx2R-N3GPdEGjoqksJi1Bc_xRdF-w@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] RISC-V: KVM: Implement get event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_224434_988067_ADA98DF3 
X-CRM114-Status: GOOD (  21.10  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgbmV3IGdldF9ldmVudF9pbmZvIGZ1bmNpdG9uIGFs
bG93cyB0aGUgZ3Vlc3QgdG8gcXVlcnkgdGhlIHByZXNlbmNlCj4gb2YgbXVsdGlwbGUgZXZlbnRz
IHdpdGggc2luZ2xlIFNCSSBjYWxsLiBDdXJyZW50bHksIHRoZSBwZXJmIGRyaXZlcgo+IGluIGxp
bnV4IGd1ZXN0IGludm9rZXMgaXQgZm9yIGFsbCB0aGUgc3RhbmRhcmQgU0JJIFBNVSBldmVudHMu
IFN1cHBvcnQKPiB0aGUgU0JJIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGluIEtWTSBhcyB3ZWxs
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5o
IHwgIDMgKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyAgICAgICAgICAgICB8IDY2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX3BtdS5jICAgICAgICAgfCAgMyArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Bt
dS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9wbXUuaAo+IGluZGV4IDFkODVi
NjYxNzUwOC4uOWE5MzBhZmM4ZjU3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfcG11LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3BtdS5oCj4gQEAgLTk4LDYgKzk4LDkgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9wbXVfaW5pdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90
X3NldF9zaG1lbShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgc2FkZHJfbG93
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBz
YWRkcl9oaWdoLCB1bnNpZ25lZCBsb25nIGZsYWdzLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3NiaV9yZXR1cm4gKnJldGRhdGEpOwo+ICtp
bnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1
bnNpZ25lZCBsb25nIHNhZGRyX2xvdywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBzYWRkcl9oaWdoLCB1bnNpZ25lZCBsb25nIG51bV9ldmVudHMsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHN0
cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKTsKPiAgdm9pZCBrdm1fcmlzY3ZfdmNw
dV9wbXVfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3Zj
cHVfcG11X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBpbmRl
eCAxNjNiZDQ0MDNmZDAuLjcwYTZiZGZjNDJmNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IEBAIC00NTMs
NiArNDUzLDcyIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfc25hcHNob3Rfc2V0X3NobWVtKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBzCj4gICAgICAgICByZXR1cm4gMDsK
PiAgfQo+Cj4gK2ludCBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZlbnRfaW5mbyhzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgc2FkZHJfbG93LAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNhZGRyX2hpZ2gsIHVuc2lnbmVkIGxvbmcgbnVt
X2V2ZW50cywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFncywgc3RydWN0IGt2bV92Y3B1X3NiaV9yZXR1cm4gKnJldGRhdGEpCj4gK3sKPiArICAg
ICAgIHN0cnVjdCByaXNjdl9wbXVfZXZlbnRfaW5mbyAqZWluZm87Cj4gKyAgICAgICBpbnQgc2ht
ZW1fc2l6ZSA9IG51bV9ldmVudHMgKiBzaXplb2YoKmVpbmZvKTsKPiArICAgICAgIGdwYV90IHNo
bWVtOwo+ICsgICAgICAgdTMyIGVpZHgsIGV0eXBlOwo+ICsgICAgICAgdTY0IGVjb25maWc7Cj4g
KyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIGlmIChmbGFncyAhPSAwIHx8IChzYWRkcl9s
b3cgJiAoU1pfMTYgLSAxKSkpIHsKPiArICAgICAgICAgICAgICAgcmV0ID0gU0JJX0VSUl9JTlZB
TElEX1BBUkFNOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgIH0KPiArCj4g
KyAgICAgICBzaG1lbSA9IHNhZGRyX2xvdzsKPiArICAgICAgIGlmIChzYWRkcl9oaWdoICE9IDAp
IHsKPiArICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHNobWVtIHw9ICgoZ3BhX3Qpc2FkZHJfaGlnaCA8PCAzMik7
Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gU0JJX0VSUl9JTlZBTElEX0FERFJFU1M7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAo
a3ZtX3ZjcHVfdmFsaWRhdGVfZ3BhX3JhbmdlKHZjcHUsIHNobWVtLCBzaG1lbV9zaXplLCB0cnVl
KSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiAr
ICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgZWluZm8g
PSBremFsbG9jKHNobWVtX3NpemUsIEdGUF9LRVJORUwpOwo+ICsgICAgICAgaWYgKCFlaW5mbykK
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsgICAgICAgcmV0ID0ga3Zt
X3ZjcHVfcmVhZF9ndWVzdCh2Y3B1LCBzaG1lbSwgZWluZm8sIHNobWVtX3NpemUpOwo+ICsgICAg
ICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0ZBSUxVUkU7Cj4g
KyAgICAgICAgICAgICAgIGdvdG8gZnJlZV9tZW07Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
Zm9yIChpbnQgaSA9IDA7IGkgPCBudW1fZXZlbnRzOyBpKyspIHsKPiArICAgICAgICAgICAgICAg
ZWlkeCA9IGVpbmZvW2ldLmV2ZW50X2lkeDsKPiArICAgICAgICAgICAgICAgZXR5cGUgPSBrdm1f
cG11X2dldF9wZXJmX2V2ZW50X3R5cGUoZWlkeCk7Cj4gKyAgICAgICAgICAgICAgIGVjb25maWcg
PSBrdm1fcG11X2dldF9wZXJmX2V2ZW50X2NvbmZpZyhlaWR4LCBlaW5mb1tpXS5ldmVudF9kYXRh
KTsKPiArICAgICAgICAgICAgICAgcmV0ID0gcmlzY3ZfcG11X2dldF9ldmVudF9pbmZvKGV0eXBl
LCBlY29uZmlnLCBOVUxMKTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCA+IDApCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZWluZm9baV0ub3V0cHV0ID0gMTsKPiArICAgICAgICAgICAgICAg
ZWxzZQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVpbmZvW2ldLm91dHB1dCA9IDA7Cj4gKyAg
ICAgICB9Cj4gKwo+ICsgICAgICAga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2htZW0sIGVp
bmZvLCBzaG1lbV9zaXplKTsKPiArICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgICAgICAgICAg
cmV0ID0gU0JJX0VSUl9GQUlMVVJFOwo+ICsgICAgICAgICAgICAgICBnb3RvIGZyZWVfbWVtOwo+
ICsgICAgICAgfQo+ICsKPiArZnJlZV9tZW06Cj4gKyAgICAgICBrZnJlZShlaW5mbyk7Cj4gK291
dDoKPiArICAgICAgIHJldGRhdGEtPmVycl92YWwgPSByZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJu
IDA7Cj4gK30KPiArCj4gIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfbnVtX2N0cnMoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2
bV92Y3B1X3NiaV9yZXR1cm4gKnJldGRhdGEpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYwo+IGlu
ZGV4IGU0YmUzNGUwM2U4My4uYTAyMGQ5NzlkMTc5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMK
PiBAQCAtNzMsNiArNzMsOSBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X3BtdV9oYW5kbGVyKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgIGNhc2Ug
U0JJX0VYVF9QTVVfU05BUFNIT1RfU0VUX1NITUVNOgo+ICAgICAgICAgICAgICAgICByZXQgPSBr
dm1fcmlzY3ZfdmNwdV9wbXVfc25hcHNob3Rfc2V0X3NobWVtKHZjcHUsIGNwLT5hMCwgY3AtPmEx
LCBjcC0+YTIsIHJldGRhdGEpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNh
c2UgU0JJX0VYVF9QTVVfRVZFTlRfR0VUX0lORk86Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGt2
bV9yaXNjdl92Y3B1X3BtdV9ldmVudF9pbmZvKHZjcHUsIGNwLT5hMCwgY3AtPmExLCBjcC0+YTIs
IGNwLT5hMywgcmV0ZGF0YSk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgZGVm
YXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfTk9UX1NV
UFBPUlRFRDsKPiAgICAgICAgIH0KPgo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
