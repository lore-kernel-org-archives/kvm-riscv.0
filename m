Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0B3C2A079
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2FtR7TFBx+SwLNvOgVfLuxz5HhO/L3StRIiTJZk4B0=; b=sShsDjDNGm8lrY
	+LU1rpNeAGQtIgNShYMQy/QKtf5bhXAmtCeS1DULbmV6Gu5TkGqGP3EjZqDN18PVrs44qMW6LxTlI
	0IPhSFVpumSjUZyKzy2fCLuYc1T9tsKyqrdft7zcrtU9BEZXf3bl7X9sq4I8SWFDSyr1ymIWMyYwm
	vRnB/DfFewcsThboypN33x1PMKSe6mL+vQ3aqE5HSeDVq0ny507aHOGcBA6xCHXLIh+xvYvgHpjiY
	gis48/hL25Tfrd9j22elAfXnrJFGfeRLMpXXtkZa7zqnly9cmsOodpuD5aGAGzJCFlXBIhLfzve1V
	6go8SpyzO8jHFYQtWlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgTl-0000000B1xi-0UY2;
	Mon, 05 Jan 2026 09:02:21 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgTi-0000000B1x7-3ocF
	for kvm-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 09:02:20 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-3e8f418e051so9401031fac.3
        for <kvm-riscv@lists.infradead.org>; Mon, 05 Jan 2026 01:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767603738; x=1768208538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLgzGv5fLc8fsHoh6HgxliKmTiWU9X2CeR3QczQ/WzU=;
        b=luJ0YTEfhm7VWnYiN9/fP07jXGjfUgkVzh9PcCHdtMU+5jbN73CsLC3BlLLWi1hVjQ
         /IT5XbUnQOobCEKPUS+z21qHOoUQVf7OsgvqqC3QhsEKy2LNUPBDujQrG7rExvSofMOh
         tPi0h2quIAt4+SZ4/WBPoZ/RLUsKByyIBV3LNAfv2VHAx33NMkbrS/1NdL75cc9zd05n
         7qNY5RFk/KozSLM/Bf2E2NSRTeF2GNXhq6HNU8T4VyrdKE4puMultJV9tZd1xGNv1FjV
         MPErmszTokQ9rzGXNzBzlZDBbFC/01Omu+MSBi95YTJRRge2r++FAIesyRkzrHeQdnG5
         9ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603738; x=1768208538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLgzGv5fLc8fsHoh6HgxliKmTiWU9X2CeR3QczQ/WzU=;
        b=JXp9GXFyhwD6839PPRkbG2+h36WZkVX1b8+AYBWIgGsKsK3yIAghPzwzxAyrvgeapC
         KjkZOsButmvFhLCs4GYjjLclZYOJcliMIHt1/gP/5sbHuuDxRmW02uqJNuQnkk4TUzY/
         ldul/ZIaq59snSsdMuQ/ICa1b/Kp0FslVJlzoCeLoRi1yMb2mWkeTXE2w15dOEWL/MI0
         aQb5W6lvuBT2KDAGpdSL/3eGjgeGSKuLpD+ZShFu2WS/ZmqhG2LkfKNYyyQKSPDolIc7
         Zw6y4oSN48lgbuI4xkHzNJjmXfUjn/yPEOor6k74q1nuha861BhmfUu6aWQWtM87qVlN
         Oe2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsAPHC5LIozlh2o7HO7iFAmyj/rZUrHbec7kG/CKl8g7nR3Ol2QJcZIDN3Y6ob9IxljYPdwdlJiq0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEA186G3hNEER0SoCX/sVcXhAoeYqHFfox76i73bpmAzJwHEr2
	6+nRpB82mV6PLqP7I6EbvLqF4b0p/259eqkq044hkgjDERIQ5w+jCuc8CKXiuS/sfBAMOzm6OYd
	pteDlCDen3L1KHcKV2UgxQb8OSy+7Cm6NNlhmXy/uQA==
X-Gm-Gg: AY/fxX6FpNGJLrz5qjAEj64HuWPfFvNIC2wYQk1NpL4LZxD4AO+J0BD8o6+MlRH9Ot/
	dVy4k0C7bDM00Eb1DRWaalVSI9FjqSEMEu4JzygKs2PfYeDJodJ73jiZiVf10QalIY9kYOyb+ZD
	8fGO+iwRk4+F6rqJnliaMFNhUhSwgcCWRd8WPOPQoKK6gVvbXg/5xtsesDWyrKdjqU8zGMRkdzn
	2Fl5rgYW5Ct4hvHzpdyFtBuoHGRSg+RvjihA0Iub6g4bzYI66GO2OIHaDXwezHrdj0ypDhWOV3s
	gaNFgSmj9myuHWOGu1tfEh4kR9WRtfHNeGQQC17A/BqcPeqJNIWTzKMsDw==
X-Google-Smtp-Source: AGHT+IG/2dbYVAi+kE9jQKrV+b5ME2O9/wDR8akXLsA6MOvPGexAzyR6yiQetXOblpapVeFT7WzjD3+LEnqxI7rG0V0=
X-Received: by 2002:a4a:b285:0:b0:659:9a49:9023 with SMTP id
 006d021491bc7-65d0eafe372mr16492285eaf.80.1767603737633; Mon, 05 Jan 2026
 01:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn> <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 14:32:06 +0530
X-Gm-Features: AQt7F2r7JOD0nswZYt1d_1RpOAVlRLQ2tRHmfthI7w40klc16h1ihmE0AFTutIc
Message-ID: <CAAhSdy1B155WWM8=FA=fvmpVHgVzXke5WjQRnv63RLyLbdpDFw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, cyan.yang@sifive.com, 
	cleger@rivosinc.com, charlie@rivosinc.com, cuiyunhui@bytedance.com, 
	samuel.holland@sifive.com, namcao@linutronix.de, jesse@rivosinc.com, 
	inochiama@gmail.com, yongxuan.wang@sifive.com, ajones@ventanamicro.com, 
	parri.andrea@gmail.com, mikisabate@gmail.com, yikming2222@gmail.com, 
	thomas.weissschuh@linutronix.de, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_010219_234519_D2B3E7C3 
X-CRM114-Status: GOOD (  13.34  )
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

T24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTA6MDDigK9QTSBQaW5jaGVuZyBXYW5nCjxwaW5jaGVu
Zy5wbGN0QGlzcmMuaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gRXh0ZW5kIHRoZSBLVk0gSVNBIGV4
dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBLVk0gdXNlciBzcGFjZQo+IHRvIGRl
dGVjdCBhbmQgZW5hYmxlIFppbHNkIGFuZCBaY2xzZCBleHRlbnNpb25zIGZvciBHdWVzdC9WTS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFBpbmNoZW5nIFdhbmcgPHBpbmNoZW5nLnBsY3RAaXNyYy5pc2Nh
cy5hYy5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiAr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAyICsrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4g
aW5kZXggNWY1OWZkMjI2Y2M1Li5iZWI3Y2UwNmRjZTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gQEAgLTE3NCw2ICsxNzQsOCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lE
IHsKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKPiAgICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX1pDRiwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+ICsgICAgICAg
S1ZNX1JJU0NWX0lTQV9FWFRfWkNMU0QsCj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUxT
RCwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBV1JTLAo+ICAgICAgICAgS1ZNX1JJU0NW
X0lTQV9FWFRfU01OUE0sCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTSwKClRoZSBL
Vk1fUklTQ1ZfSVNBX0VYVF9aQ0xTRCBhbmQgS1ZNX1JJU0NWX0lTQV9FWFRfWklMU0QKTVVTVCBC
RSBpbnNlcnRlZCBhdCB0aGUgZW5kIG9mIGVudW0gdG8gbWFpbnRhaW4gYmFja3dhcmQgY29tcGF0
aWJpbGl0eQppbiB0aGUgVUFQSSBoZWFkZXIuCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IDJl
MWI2NDZmMGQ2MS4uODIxOTc2OWZjNGExIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTY0
LDYgKzY0LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10g
PSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkNEKSwKPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihaQ0YpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKPiArICAgICAgIEtW
TV9JU0FfRVhUX0FSUihaQ0xTRCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkZBKSwKPiAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkgpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpG
SE1JTiksCj4gQEAgLTc4LDYgKzc5LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3Zt
X2lzYV9leHRfYXJyW10gPSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklISU5UUEFVU0Up
LAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJSFBNKSwKPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihaSU1PUCksCj4gKyAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklMU0QpLAo+ICAgICAgICAg
S1ZNX0lTQV9FWFRfQVJSKFpLTkQpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAo+
ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpLTkgpLAoKQm90aCBaQ0xTRCBhbmQgWklMU0QgbXVz
dCBiZSBpbnNlcnRlZCBpbiBhbHBoYWJldGljYWwgb3JkZXIKaW4gdGhlIGt2bV9pc2FfZXh0X2Fy
cltdIGFycmF5LgoKSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNvbW1lbnRzIGF0IHRo
ZSB0aW1lIG9mIG1lcmdpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjIwCgpUaGFua3MsCkFudXAK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
