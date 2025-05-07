Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B80C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+kj4xUgSUAGajZtYRyd8+kcUsqpsYVdtkb8OodrhXU=; b=tFPRL4M/L8Jj+f
	K5qtsswP7nsfevxI5KnFJ1KAhiJbQEBUso21ZzmwU+1Dp3qTdoyGmNn2cSlkQnoktf1VcIjBfUxgB
	DOIlF+aRcPrHXYbicasKT1xcegl6CikIDwYXWyMNzJaImmDf163JVOata2+MQyM+g+lCrpia6RnXE
	gKd99fzy+oxcp3TBnPsHZlNfKE6cT5+MYjyEJP5VFLZyxC7KNV9ESlJKr5l2tF1U09Q+O4khSvUmn
	tm91BhHc/RB7/Q1FRmTsmjAmus4dxoW+JuN+ESENMjfMEDjcdS4EVWB3frcVRfweOHlPFeNO3dTN7
	JRWJv7BT+mPPU4MCS00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdWv-0000000FJHT-2P7x;
	Wed, 07 May 2025 12:05:41 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdT8-0000000FISK-0Rpi
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 12:01:47 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3da7642b5deso2655045ab.2
        for <kvm-riscv@lists.infradead.org>; Wed, 07 May 2025 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746619305; x=1747224105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfksTJphxL8/tqIZbEC1vmhshvxVbtCcWFaJZOmGc+c=;
        b=PWquw1pYeu2f1BLEFzcmhiy6z7JgB/0ZvDLUAqc43z+hQG8o1CR2rkGjX3zEWIhOiQ
         jJOc+J8/BMZ2TlDjRvsSeKPUUKLQHa7aNIeLbA1VKgKJdIOMDFUI1O1yfmrnCZ0atEmE
         zo0rKO9hjMstEz+BElsbihAiKFpaY5W9hmOD7peCI2ZsIbj8oWY/xwoxfXjcneXQleSD
         dz83j2sl1E6GTQaJCjRguN42a74DVKRNnK8Y5K+phAKtawmA6qpJzKaIzw5cN+oDmno6
         yWBOfW/2fS2lU/khBWiD5UpEH1RlvJ0XalonX8kqteeIoYU2CocdXy4FSzySEOioJ1i2
         8w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619305; x=1747224105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfksTJphxL8/tqIZbEC1vmhshvxVbtCcWFaJZOmGc+c=;
        b=wjvRZf46gSpIGrSkApUAJWhppq2lXvhw4Mk67ylTN6NP1WlfH/BCiIOJtIQWeMMH+M
         yiJXFXxD2Nj0+e9MnaYO7HLhSW92/9MtEGYBZkazG4NWD5I2yuixJQd1dq/KSYewkT5Y
         z81qN7AQyNFA+kKj2d2kNlZ69gq3bXnsFlRrrpR6H12IfzSQ2BoyLwBF2rc44WoaSi/w
         Cag0QBl/1EiYr1ts170VUjSK1YvpIczFn8nwb0axKHV50T25nGmCb3gS5FQA+BE2lNvB
         RgeNbkzx65yy2P6vS2aXHYiaSSiUrTPPrdnkew4SEklh12Cr9V5CRZOBLKaUxmDj6J1G
         6Qrg==
X-Gm-Message-State: AOJu0YxXe4EoJJWsThuWZu2cEn+mJkiTBqW7Uz4KedJd0n6a/GD1ODbH
	NA39CldUgoFlw6xviOPGmfni/p38edqkece0yG/knBzk4Bkjpmh0iG9MS2/J98/AQ+SUxHkywh6
	xw9FNO0L4aFsdlY2/nYQZGZyN/HTPyY12TQGtKQ==
X-Gm-Gg: ASbGncuYXC9rRU2m/7JqkLDKp7q3aa9mVOnb5bb10jNcjpeVSxKFfGSCNUcDpAN4HtR
	9Q0NgcWj16pi1YlIZRZFzwtMk6wAeJF0r5YsSLZIBUH1AktHW3TslnNckD0K4oD4nbE7uMY+yNR
	EufRDX0ywt4NeAezjf7WHItBM=
X-Google-Smtp-Source: AGHT+IFkZGdbLqqYtnBIxPNoB/AAAkKnYxcbV3TvXGHWR/dk3f5HpfrkqVg/svBXEFNqgSJQ1iCWCi8Uf95FPmM7zQQ=
X-Received: by 2002:a05:6e02:1c2c:b0:3d8:1d7c:e192 with SMTP id
 e9e14a558f8ab-3da738f849emr29139475ab.7.1746619304812; Wed, 07 May 2025
 05:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 May 2025 17:31:33 +0530
X-Gm-Features: ATxdqUEfXOKoC0fyIHGD5l9Qjl_U-GZBULEO3hLfdZKgXeyi62xCroqXS1Rt6jw
Message-ID: <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_050146_145421_37203BFF 
X-CRM114-Status: GOOD (  19.23  )
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

T24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIHNhbWUgY29kZSBpcyB1c2VkIHR3aWNl
IGFuZCBTQkkgcmVzZXQgc2V0cyBvbmx5IHR3byB2YXJpYWJsZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICAyICsrCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfaHNtLmMgICAgICAgICB8IDEzICstLS0tLS0tLS0tLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgICAgICB8IDEwICstLS0tLS0tLS0KPiAgNCBmaWxl
cyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+IGluZGV4IDRlZDYyMDNjZGQzMC4uYWFhYTgxMzU1
Mjc2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gQEAgLTU1LDYg
KzU1LDggQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9z
eXN0ZW1fcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgdHlwZSwgdTY0IGZsYWdzKTsKPiArdm9pZCBrdm1fcmlz
Y3ZfdmNwdV9zYmlfcmVxdWVzdF9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYywgdW5zaWdu
ZWQgbG9uZyBhMSk7CgpVc2UgdGFicyBmb3IgYWxpZ25tZW50IGluc3RlYWQgb2Ygc3BhY2VzLgoK
PiAgaW50IGt2bV9yaXNjdl92Y3B1X3NiaV9yZXR1cm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBz
dHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPiAgaW50IGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfc2JpX2V4
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3Qga3ZtX29uZV9yZWcgKnJlZyk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXgg
ZDFjODNhNzc3MzVlLi5mNTgzNjhmN2RmMWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMTU2LDYg
KzE1NiwxOCBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9zeXN0ZW1fcmVzZXQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgcnVuLT5leGl0X3JlYXNvbiA9IEtWTV9FWElUX1NZU1RF
TV9FVkVOVDsKPiAgfQo+Cj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgcGMsIHVuc2lnbmVkIGxvbmcgYTEpCj4gK3sKPiArICAgICAg
IHNwaW5fbG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwo+ICsgICAgICAgdmNwdS0+
YXJjaC5ndWVzdF9yZXNldF9jb250ZXh0LnNlcGMgPSBwYzsKPiArICAgICAgIHZjcHUtPmFyY2gu
Z3Vlc3RfcmVzZXRfY29udGV4dC5hMCA9IHZjcHUtPnZjcHVfaWQ7Cj4gKyAgICAgICB2Y3B1LT5h
cmNoLmd1ZXN0X3Jlc2V0X2NvbnRleHQuYTEgPSBhMTsKPiArICAgICAgIHNwaW5fdW5sb2NrKCZ2
Y3B1LT5hcmNoLnJlc2V0X2NudHhfbG9jayk7Cj4gKwo+ICsgICAgICAga3ZtX21ha2VfcmVxdWVz
dChLVk1fUkVRX1ZDUFVfUkVTRVQsIHZjcHUpOwo+ICt9Cj4gKwo+ICBpbnQga3ZtX3Jpc2N2X3Zj
cHVfc2JpX3JldHVybihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4p
Cj4gIHsKPiAgICAgICAgIHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNwID0gJnZjcHUtPmFyY2gu
Z3Vlc3RfY29udGV4dDsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNt
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+IGluZGV4IDMwNzBiYjMxNzQ1ZC4u
ZjI2MjA3Zjg0YmFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKPiBAQCAtMTUsNyArMTUsNiBA
QAo+Cj4gIHN0YXRpYyBpbnQga3ZtX3NiaV9oc21fdmNwdV9zdGFydChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKnJlc2V0X2NudHg7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjcCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0
X2NvbnRleHQ7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnRhcmdldF92Y3B1Owo+ICAgICAg
ICAgdW5zaWduZWQgbG9uZyB0YXJnZXRfdmNwdWlkID0gY3AtPmEwOwo+IEBAIC0zMiwxNyArMzEs
NyBAQCBzdGF0aWMgaW50IGt2bV9zYmlfaHNtX3ZjcHVfc3RhcnQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAg
c3Bpbl9sb2NrKCZ0YXJnZXRfdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwo+IC0gICAgICAg
cmVzZXRfY250eCA9ICZ0YXJnZXRfdmNwdS0+YXJjaC5ndWVzdF9yZXNldF9jb250ZXh0Owo+IC0g
ICAgICAgLyogc3RhcnQgYWRkcmVzcyAqLwo+IC0gICAgICAgcmVzZXRfY250eC0+c2VwYyA9IGNw
LT5hMTsKPiAtICAgICAgIC8qIHRhcmdldCB2Y3B1IGlkIHRvIHN0YXJ0ICovCj4gLSAgICAgICBy
ZXNldF9jbnR4LT5hMCA9IHRhcmdldF92Y3B1aWQ7Cj4gLSAgICAgICAvKiBwcml2YXRlIGRhdGEg
cGFzc2VkIGZyb20ga2VybmVsICovCj4gLSAgICAgICByZXNldF9jbnR4LT5hMSA9IGNwLT5hMjsK
PiAtICAgICAgIHNwaW5fdW5sb2NrKCZ0YXJnZXRfdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2sp
Owo+IC0KPiAtICAgICAgIGt2bV9tYWtlX3JlcXVlc3QoS1ZNX1JFUV9WQ1BVX1JFU0VULCB0YXJn
ZXRfdmNwdSk7Cj4gKyAgICAgICBrdm1fcmlzY3ZfdmNwdV9zYmlfcmVxdWVzdF9yZXNldCh0YXJn
ZXRfdmNwdSwgY3AtPmExLCBjcC0+YTIpOwo+Cj4gICAgICAgICBfX2t2bV9yaXNjdl92Y3B1X3Bv
d2VyX29uKHRhcmdldF92Y3B1KTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9zeXN0ZW0uYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N5c3RlbS5jCj4gaW5kZXgg
YmMwZWJiYTg5MDAzLi4zNTliZTkwYjBmYzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfc3lzdGVtLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0u
Ywo+IEBAIC0xMyw3ICsxMyw2IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfc3VzcF9oYW5kbGVy
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0
ZGF0YSkKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY3AgPSAmdmNwdS0+
YXJjaC5ndWVzdF9jb250ZXh0Owo+IC0gICAgICAgc3RydWN0IGt2bV9jcHVfY29udGV4dCAqcmVz
ZXRfY250eDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnVuY2lkID0gY3AtPmE2Owo+ICAgICAg
ICAgdW5zaWduZWQgbG9uZyBodmEsIGk7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnRtcDsK
PiBAQCAtNDUsMTQgKzQ0LDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9zdXNwX2hhbmRsZXIo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIHNw
aW5fbG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwo+IC0gICAgICAgICAgICAgICBy
ZXNldF9jbnR4ID0gJnZjcHUtPmFyY2guZ3Vlc3RfcmVzZXRfY29udGV4dDsKPiAtICAgICAgICAg
ICAgICAgcmVzZXRfY250eC0+c2VwYyA9IGNwLT5hMTsKPiAtICAgICAgICAgICAgICAgcmVzZXRf
Y250eC0+YTAgPSB2Y3B1LT52Y3B1X2lkOwo+IC0gICAgICAgICAgICAgICByZXNldF9jbnR4LT5h
MSA9IGNwLT5hMjsKPiAtICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnZjcHUtPmFyY2gucmVz
ZXRfY250eF9sb2NrKTsKPiAtCj4gLSAgICAgICAgICAgICAgIGt2bV9tYWtlX3JlcXVlc3QoS1ZN
X1JFUV9WQ1BVX1JFU0VULCB2Y3B1KTsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVf
c2JpX3JlcXVlc3RfcmVzZXQodmNwdSwgY3AtPmExLCBjcC0+YTIpOwo+Cj4gICAgICAgICAgICAg
ICAgIC8qIHVzZXJzcGFjZSBwcm92aWRlcyB0aGUgc3VzcGVuZCBpbXBsZW1lbnRhdGlvbiAqLwo+
ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZCh2Y3B1LCBydW4pOwo+
IC0tCj4gMi40OC4xCj4KCk90aGVyd2lzZSwgaXQgbG9va3MgZ29vZCB0byBtZS4KSSBoYXZlIHRh
a2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNvbW1lbnQgYXQgdGhlIHRpbWUKb2YgbWVyZ2luZyB0aGlz
IHBhdGNoLgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTYKClRoYW5rcywKQW51cAoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
