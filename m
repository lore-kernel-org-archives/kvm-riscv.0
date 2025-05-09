Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C98BC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 04:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpyT7uoXXrNY5g/lAz4wh/1zeVP4538pwqxHo1OKTx8=; b=4UMRheCq8DSMk3
	KQxb5G4ZJBs6HGwiQ9LRhmu/xaKc/inPFsH4GkpiAxtem4RaUVyrzAeLtkfpt2SZg2WMK0EZ+pvmW
	9lsFPmFWFjapqdckFX1tzuW00hh80Zynlcd9BcOiJMSnsHSbCatf/2Xt1dNDNGdL+fAHstV2VrMVH
	13H8hVK7H2ZJWz6+07ex6bl9BQ6cRMCoV4vojjSY7yJb0/Qia/oBE1wKkdnhfSwgM67bHQGseiZ3M
	OW0fuSlECJZR4ZofW8kZP5nPhKubhSbSQO0jdGKaj9J+l/UVqoXYHjvK0tFczQt19/lYbcqKgUSw3
	tOBRedTtgwGioaCGz7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEuP-00000002PqB-0mGq;
	Fri, 09 May 2025 04:00:25 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEHt-00000002M65-0WuV
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 03:20:38 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so8351545ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 20:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746760836; x=1747365636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnqKcVSyirwFx4wEXZIT0zJRplLj4a3hbHksAZ3+SSo=;
        b=jcStfDKE2xB1gYpDtEowWKtFi77TdYJe7kVqHzcE4x2J62mZCc4FySsDKVihllfgEt
         ZVHTdcpZ7WxfKjgawtj+sappz5tzlQCbRZEMawfwPTUoZxtEdfj8MlZBv3372THPiSpW
         thFvHzBYYg+ypCenWT5skSI/ezQ+YY34okNbUltzELkJHR6YAidqk9lXqYLDoGTk2jDk
         8Zqofkvb7+Q7HLQ95hGueUHUTGta02b8A/ijwtimsLJ7rOyPVjv+hrthSPG/fGeuB9zk
         bcY+mc4eCH7bshBDcPPJ5a9wAZN2sjMslddDwvtywtozBbmfRMahZ2lV0ww2aqGxzkwu
         1FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746760836; x=1747365636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnqKcVSyirwFx4wEXZIT0zJRplLj4a3hbHksAZ3+SSo=;
        b=kc+XHL9ZRjgji5/bpE0KKF1sWgChLMtac+950JVJGCOYb38wuV3oaYUDZsO6BtOdB5
         Vw+0bmF7CFr80XVCK20ZXUzcTnFpM8p7H9tCBxi+vVYMO81X3RE/E4asrZOMux2Vx0YA
         pVcL4MAdWuEq3AAt9n75b/52mRRhr6ctCcCboTwoiwe3hiYisLe2XEmw+9bVqz+KVGz3
         VZH3/TiNUeeiWph29gnAIn5TNTRWNx3V8p2pDr7dG14pkKdvUK+xh13/buVdf/HyoeYW
         SatOsUP/S8QdcQ6+dYV9piOxCUMVM9XkV9bUyAxtngd30X3mPUEzooeUxmVVBmQXOnfD
         AZSw==
X-Forwarded-Encrypted: i=1; AJvYcCV3tqkryE2a1ZlmLlOBOXs5oM+vUuyVyAvyoF+uxHYw/RUF1wE0CZRdLIjyzrm37/p20JEeNd6V0+4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJdjxTLDzRNzA3E6/2ALU3Q+l+NicjPRFZe1JGueEbAHgIXEIA
	KlyP/geMToD8HS0vjVNSHrprBdWReXGvJS0kXscIps/TnssEuH3ZyUjdazwscq+A+EwkSIhlBsf
	IWjYMrJnrLxQ0VPoOhp+x0JLdq+XFv2HFg/ACUw==
X-Gm-Gg: ASbGncsseipWmkTVgboQlo5jKo6CGPvkRd7NoHYrxU+WjRY+Yqpp3stGuCQU8u/DD1c
	75scwAtrm0+sMeb5lp0d6H978cjAvVarbiCSildCrZgsYGjbG9yozZQjPC6V6tFaqJKMxA+Zk4g
	zAQ+wGmyCbg4PpB7uX0ZnWziw=
X-Google-Smtp-Source: AGHT+IGxJSJOfj/uPGDX0l9BVY/KPaOwcW52GGJrD6j3FDNArn7ULaOwfHRemocw3j7KZ3LWZVqMGaPpDr7hAfyxnxs=
X-Received: by 2002:a05:6e02:2292:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3da7e21658cmr27127695ab.22.1746760835694; Thu, 08 May 2025
 20:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250424173204.1948385-12-cleger@rivosinc.com> <mhng-0c7b576b-882d-4020-996d-adb1b2bbcc4b@palmer-ri-x1c9a>
In-Reply-To: <mhng-0c7b576b-882d-4020-996d-adb1b2bbcc4b@palmer-ri-x1c9a>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 May 2025 08:50:24 +0530
X-Gm-Features: ATxdqUHBve2EeFlPYflmLTkAF_hrOfFokX5MPn_gLZXF6fdS6VEfyoAB6lvQ_MY
Message-ID: <CAAhSdy1JspaC6aYjkMQn_fvjc1eFakdu2JMTQFuCzrh4h4o_3w@mail.gmail.com>
Subject: Re: [PATCH v6 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@rivosinc.com>, cleger@rivosinc.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org, shuah@kernel.org, 
	corbet@lwn.net, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, samuel.holland@sifive.com, 
	ajones@ventanamicro.com, debug@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_202037_439788_BB7C34EE 
X-CRM114-Status: GOOD (  25.14  )
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

SGkgUGFsbWVyLAoKT24gVGh1LCBNYXkgOCwgMjAyNSBhdCAxMDo1N+KAr1BNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyNCBBcHIgMjAyNSAx
MDozMTo1OCBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5jLmNvbSB3cm90ZToKPiA+IFRoZSBG
V0ZUIFNCSSBleHRlbnNpb24gd2lsbCBuZWVkIHRvIGR5bmFtaWNhbGx5IGFsbG9jYXRlIG1lbW9y
eSBhbmQgZG8KPiA+IGluaXQgdGltZSBzcGVjaWZpYyBpbml0aWFsaXphdGlvbi4gQWRkIGFuIGlu
aXQvZGVpbml0IGNhbGxiYWNrcyB0aGF0Cj4gPiBhbGxvd3MgdG8gZG8gc28uCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDkgKysrKysrKysr
Cj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCj4KPiBU
aGVyZSdzIDQgS1ZNIHBhdGNoZXMgaW4gaGVyZSB3aXRob3V0IGFuIEFjayBmcm9tIEF0aXNoIG9y
IEFudXAuCj4gVGhleSdyZSBhbGwgdGllZCB1cCBpbiB0aGUgU0JJdjMgc3R1ZmYsIHNvIGp1c3Qg
TE1LIGlmIHlvdSB3YW50IG1lIHRvCj4gdGFrZSB0aGVtIGludG8gdGhhdCBzdGFnaW5nIGJyYW5j
aCBvciBpZiB5b3Ugd2FudCBtZSB0byB3YWl0Lgo+Cj4gRm9yIG5vdyBJJ20gZ29pbmcgdG8gZ28g
bG9vayBhdCBvdGhlciBzdHVmZiwgbm8gcnVzaCBvbiBteSBlbmQuCgpUaGUgNCBLVk0gcGF0Y2hl
cyBvZiB0aGlzIHNlcmllcyBzaG91bGQgZ28gdGhyb3VnaCB0aGUgS1ZNIFJJU0MtVgp0cmVlIHRv
IGF2b2lkIGNvbmZsaWN0cyB3aGVuIGl0IHJlYWNoZXMgTGludXMuIEkgYW0gb2theSBkb2luZyBh
IHNoYXJlZAp0YWcgZm9yIHRoZSBmaXJzdCAxMCBwYXRjaGVzLgoKUmVnYXJkcywKQW51cAoKPgo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gaW5kZXggNGVkNjIw
M2NkZDMwLi5iY2I5MDc1N2IxNDkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV92Y3B1X3NiaS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3NiaS5oCj4gPiBAQCAtNDksNiArNDksMTQgQEAgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRl
bnNpb24gewo+ID4KPiA+ICAgICAgIC8qIEV4dGVuc2lvbiBzcGVjaWZpYyBwcm9iZSBmdW5jdGlv
biAqLwo+ID4gICAgICAgdW5zaWduZWQgbG9uZyAoKnByb2JlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpOwo+ID4gKwo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIEluaXQvZGVpbml0IGZ1bmN0aW9u
IGNhbGxlZCBvbmNlIGR1cmluZyBWQ1BVIGluaXQvZGVzdHJveS4gVGhlc2UKPiA+ICsgICAgICAq
IG1pZ2h0IGJlIHVzZSBpZiB0aGUgU0JJIGV4dGVuc2lvbnMgbmVlZCB0byBhbGxvY2F0ZSBvciBk
byBzcGVjaWZpYwo+ID4gKyAgICAgICogaW5pdCB0aW1lIG9ubHkgY29uZmlndXJhdGlvbi4KPiA+
ICsgICAgICAqLwo+ID4gKyAgICAgaW50ICgqaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsK
PiA+ICsgICAgIHZvaWQgKCpkZWluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gPiAgfTsK
PiA+Cj4gPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+ID4gQEAgLTY5LDYgKzc3LDcgQEAgY29uc3Qg
c3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2bV92Y3B1X3NiaV9maW5kX2V4dCgKPiA+
ICBib29sIHJpc2N2X3ZjcHVfc3VwcG9ydHNfc2JpX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IGludCBpZHgpOwo+ID4gIGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPiA+ICB2b2lkIGt2bV9yaXNjdl92Y3B1
X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gPiArdm9pZCBrdm1fcmlzY3ZfdmNw
dV9zYmlfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gPgo+ID4gIGludCBrdm1fcmlz
Y3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBs
b25nIHJlZ19udW0sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nICpyZWdfdmFsKTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+IGluZGV4IDYwZDY4NGM3NmM1OC4uODc3YmNjODVj
MDY3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKPiA+IEBAIC0xODUsNiArMTg1LDggQEAgdm9pZCBrdm1fYXJjaF92
Y3B1X3Bvc3RjcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ID4KPiA+ICB2b2lkIGt2bV9h
cmNoX3ZjcHVfZGVzdHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiAgewo+ID4gKyAgICAg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdCh2Y3B1KTsKPiA+ICsKPiA+ICAgICAgIC8qIENsZWFu
dXAgVkNQVSBBSUEgY29udGV4dCAqLwo+ID4gICAgICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX2RlaW5p
dCh2Y3B1KTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiA+IGluZGV4IGQxYzgzYTc3NzM1ZS4uMzEzOWYx
NzFjMjBmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ID4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ID4gQEAgLTUwOCw1ICs1MDgsMzEgQEAgdm9p
ZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiAgICAg
ICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJs
ZWQgPwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1Zf
U0JJX0VYVF9TVEFUVVNfRElTQUJMRUQgOgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRDsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgaWYgKGV4dC0+aW5pdCAmJiBleHQtPmluaXQodmNwdSkgIT0gMCkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0gS1ZNX1JJU0NW
X1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPiA+
ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+
ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAm
dmNwdS0+YXJjaC5zYmlfY29udGV4dDsKPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zf
c2JpX2V4dGVuc2lvbl9lbnRyeSAqZW50cnk7Cj4gPiArICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3Zj
cHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+ID4gKyAgICAgaW50IGlkeCwgaTsKPiA+ICsKPiA+ICsg
ICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQpOyBpKyspIHsKPiA+ICsgICAg
ICAgICAgICAgZW50cnkgPSAmc2JpX2V4dFtpXTsKPiA+ICsgICAgICAgICAgICAgZXh0ID0gZW50
cnktPmV4dF9wdHI7Cj4gPiArICAgICAgICAgICAgIGlkeCA9IGVudHJ5LT5leHRfaWR4Owo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICBpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlfU0laRShzY29u
dGV4dC0+ZXh0X3N0YXR1cykpCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiArCj4gPiArICAgICAgICAgICAgIGlmIChzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID09IEtW
TV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFWQUlMQUJMRSB8fAo+ID4gKyAgICAgICAgICAgICAg
ICAgIWV4dC0+ZGVpbml0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICBleHQtPmRlaW5pdCh2Y3B1KTsKPiA+ICAgICAgIH0KPiA+ICB9
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
