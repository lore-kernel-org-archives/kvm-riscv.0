Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D601CA1013
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 03:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrPb1sVdi9ZG7T88ue5aA0bazPEWmaPFXaPwc/NQ9xU=; b=Z5YwCF3O6jzITk
	BYAYDQisNpW1IQvFjYekvMXub5X+qjQyoqI1QAtqSNEmoGeAvudUVnPwTtInUkIZ7IpiRZxJstGk/
	kHOAaNq9VogFoJLxE1kJxIB1QWChLn1kOHG33X49ecQrMEyK+lx1fdQr+HOJxwbCOMf8iWJ+4A8Ph
	qnAjshEbC/57jsRx03JbIFAISC2R6XnRTRVh6gf2P+u4v4rPF7ETCzBHUuLxwpbb7Ldu6oqhPZ6L/
	k7r5USjEMxulDPNLazqVH6ygadb1dTH/CUPTiK6PV+bZtCOwjQufU0SVQfo+4KyFosWPhQZ7o666Z
	jcFoEoBKMOJLQDMVrZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSuT-0000000ELT5-2wmz;
	Mon, 08 Sep 2025 03:51:17 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSuQ-0000000ELQp-1Sl9
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 03:51:16 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-406ec5934caso3333595ab.3
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Sep 2025 20:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757303473; x=1757908273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq2toZ1MStoLsAaQpze6/oEBhlqrv8NRJsOlpJj3oRE=;
        b=yS0ngoT4/0Ov3BlEImNyjxajUdEj9cyV+VFyDyNyzn/LxYy15gMHJ+IIMwtVCBmbMT
         QILlKRETWNO5Xjlq+OEad8kgxDz3HmXNh/HxE3G5uGk2FzO+Klr2bXXR7fc4Arotsw7h
         w85A5HOZIZPIKmisqthD3iajLPGJNzP8BeXcskTxzv5P3JGRWPf6olbAjNyzyL3OIh/3
         VkQ93JVCykl67KGvTMlr+08zvk3k0p5kFMC2aY0//gh1742pvY0wBJagM+7Vz+lryxxG
         JMP0jGgZIFe5FqemU68QLOE1j3sSwZbb8HQJ787bNn4886rdB1xHEcKOnP/Fg1x1A9IV
         eV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757303473; x=1757908273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq2toZ1MStoLsAaQpze6/oEBhlqrv8NRJsOlpJj3oRE=;
        b=OxkJHx27cS5y0PjPSvWDY/7f4Xa2HvMsNps20HKJkZkM/huxpN0Woa3x9ywrvMRfn4
         Yo2LZMfqUQeBPDd/pY3M21m8VEwwzC5baRF57iPAVeAcGSmt4qASgdfWBK1SqcWhJlja
         IusuBDr7bmLqzcB0THqCfqQ1P1XWvPRyqEv4Eto+ovgXvlxfDxahpNODAq/f5fSxy0PU
         hyZw85M5yYD5zMgxq+/POhSauG1VZe69ZdnSSv14FjIHg/k1WBqnhdDw+0y5v4tePPMq
         InKFxM+FVUXMT9dNVfT3dgqiEyRqyFdERpjY2L5eSDXSBCezjyYapYS57xEj6fFevzsS
         EneA==
X-Forwarded-Encrypted: i=1; AJvYcCWRXYDZJ2OmKBJ9PBg31QKxLNqAixiEEU4ahYhWm4QzVAkcYT5kWJV959/tCP7OtpgJ5qkinePs3KI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2RtjdsVuZUbGuWKYfygmBon+6JYlZLWlGbxDu8AouksKsc7iT
	JDxfOzIFxdl8VvpaChrSzG8duYXgycxls3nTF1adgsMoblPgTcUS6vmPDQ5nXPxKBLtMnPqu8Ob
	a3nkD9drBHeq4W6nynXSeug0sC74arXQJS0IOZ8sXig==
X-Gm-Gg: ASbGncsc/wKixPAaUJl18V14BbhSwcm4IFR8HtXugjubspTn/a3O/Mv22BLAT/6ImCE
	tmMUZ6TjUk8k8acO7/nqBxh1HDSMy5La4w18GAY1Meg8Ec79MmyHI+7Ii7O7je2FuCSN2k2CIIO
	2z6gnzZNU8+CcZcTzTQdGu0DIbh6t2gNwOV+pe1Bf5sNrz3hfHEZVytLEyPdVBYP0u6Ky+zxknp
	KbihH3ZJiYSSji8CPYddyIItvBuqL7pvzI4aVrufZEZltBNnBY=
X-Google-Smtp-Source: AGHT+IH4WAwWrAnnu4Rq1LOrwKuZ6PLy8v3SBH2WLczbYxVUoFRkmc/aL1MGlRWWeIeFxAJfFISceCNUeP2fr23Ivao=
X-Received: by 2002:a05:6e02:1d9d:b0:3f6:80ec:bae with SMTP id
 e9e14a558f8ab-3fd853158bamr95133955ab.21.1757303473045; Sun, 07 Sep 2025
 20:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Sep 2025 09:21:00 +0530
X-Gm-Features: Ac12FXxdad2U7i621spIzbFw-GpwyPTNC5JI8CApKugYuwHXgesJ9uOvv3sJqD4
Message-ID: <CAAhSdy1jAmCeqWoPi7QpuzW4stH6U-Z0pSHmyC93jBYbSr6_xw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] ONE_REG interface for SBI FWFT extension
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_205114_628189_8A8AA0F1 
X-CRM114-Status: GOOD (  13.82  )
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

T24gU2F0LCBBdWcgMjMsIDIwMjUgYXQgOTozMOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgT05FX1JFRyBpbnRlcmZh
Y2UgZm9yIFNCSSBGV0ZUIGV4dGVuc2lvbiBpbXBsZW1lbnRlZAo+IGJ5IEtWTSBSSVNDLVYuIFRo
aXMgd2FzIG1pc3NlZCBvdXQgaW4gYWNjZXB0ZWQgU0JJIEZXRlQgcGF0Y2hlcyBmb3IKPiBLVk0g
UklTQy1WLgo+Cj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zf
a3ZtX2Z3ZnRfb25lX3JlZ192MyBicmFuY2gKPiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0
ZWwvbGludXguZ2l0Cj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIFJlLWJhc2VkIG9uIGxhdGVz
dCBLVk0gUklTQy1WIHF1ZXVlCj4gIC0gSW1wcm92ZWQgRldGVCBPTkVfUkVHIGludGVyZmFjZSB0
byBhbGxvdyBlbmFibGluZy9kaXNhYmxpbmcgZWFjaAo+ICAgIEZXRlQgZmVhdHVyZSBmcm9tIEtW
TSB1c2Vyc3BhY2UKPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gRHJvcHBlZCBoYXZlX3N0YXRl
IGluIFBBVENINCBhcyBzdWdnZXN0ZWQgYnkgRHJldwo+ICAtIEFkZGVkIERyZXcncyBSZXZpZXdl
ZC1ieSBpbiBhcHByb3ByaWF0ZSBwYXRjaGVzCj4KPiBBbnVwIFBhdGVsICg2KToKPiAgIFJJU0Mt
VjogS1ZNOiBTZXQgaW5pdGlhbCB2YWx1ZSBvZiBoZWRlbGVnIGluIGt2bV9hcmNoX3ZjcHVfY3Jl
YXRlKCkKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2UgZmVhdHVyZSBzcGVjaWZpYyByZXNldCBm
b3IgU0JJIEZXRlQKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2Ugb3B0aW9uYWwgT05FX1JFRyBj
YWxsYmFja3MgZm9yIFNCSSBleHRlbnNpb25zCj4gICBSSVNDLVY6IEtWTTogTW92ZSBjb3B5X3Ni
aV9leHRfcmVnX2luZGljZXMoKSB0byBTQkkgaW1wbGVtZW50YXRpb24KPiAgIFJJU0MtVjogS1ZN
OiBJbXBsZW1lbnQgT05FX1JFRyBpbnRlcmZhY2UgZm9yIFNCSSBGV0ZUIHN0YXRlCj4gICBLVk06
IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBTQkkgRldGVCB0byBnZXQtcmVnLWxpc3QgdGVzdAoKUXVl
dWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjE4CgpSZWdhcmRzLApBbnVwCgo+Cj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggICAgICAgICB8ICAyMiArLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmggICAgfCAgIDEgKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgfCAgMTUgKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICA2MCArLS0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgICAgICAgICAgfCAxNzIgKysr
KysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgICAgICAgICAg
ICAgfCAyMjcgKysrKysrKysrKysrKysrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0
YS5jICAgICAgICAgICAgICAgICB8ICA2MyArKystLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgMzIgKysrCj4gIDkgZmlsZXMgY2hhbmdlZCwgNDY3
IGluc2VydGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40My4wCj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
